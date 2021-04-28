library(ggplot2)
library(dplyr)
library(magick)
library(ggridges)

# Get image names
imgs <- list.files("image/")
img_names <- sapply(strsplit(imgs, "[.]"), `[`, 1)

# Read in and convert images
lapply(img_names, function(x){
  # Read in image and convert to grayscale
  img <- image_read(paste0("image/", x, ".jpg")) %>%
    image_convert(colorspace = "gray")
  
  # Get dimensions
  img_w <- image_info(img)$width
  img_h <- image_info(img)$height
  img_ratio <- img_w / img_h
  
  # Resize the longest dimension to 160 pixels
  if (img_w >= img_h) {
    img <- image_resize(img, "160")
  } else {
    img <- image_resize(img, ("x160"))
  }
  
  # Create array and number rows and columns
  img_array <- drop(as.integer(img[[1]]))
  rownames(img_array) <- 1:nrow(img_array)
  colnames(img_array) <- 1:ncol(img_array)
  
  # Create data frame from array and rename columns
  img_df <- as.data.frame.table(img_array) %>% 
    `colnames<-`(c("y", "x", "b")) %>% 
    mutate_all(as.numeric) %>%
    mutate(
      n = row_number()
    ) %>%
    filter(n %% 2 == 0)
  
  # Colors, fill and background
  col_fill <- "black"
  col_bg <- "white"
  
  # Plot
  ggplot(img_df) +
    geom_ridgeline_gradient(aes(x, y, height = b/50, group = y, fill = b), color = "grey30", size = 0.25) +
    scale_y_reverse() +
    scale_fill_viridis_c(option = "magma") +
    coord_cartesian(expand = FALSE) +
    theme_void() +
    theme(
      legend.position = "none",
      plot.background = element_rect(fill = col_fill, color = NA))  
  
  ggsave(paste0("output/", "ridge-", x, ".png"), width = 8, height = 8 / img_ratio)
  
  }
)
