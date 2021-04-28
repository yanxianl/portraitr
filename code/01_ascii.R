library(ggplot2)
library(dplyr)
library(stringr)
library(magick)

# Character ramp from http://paulbourke.net/dataformats/asciiart/
ramp <- ".:-=+*#%@"  

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
  
  # Resize the longest dimension to 80 pixels
  if (img_w >= img_h) {
    img <- image_resize(img, "80")
  } else {
    img <- image_resize(img, ("x80"))
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
      # map b (0-255) to bf (1-0), so that "brighter" values become smaller numbers
      bf = 1 - b / 255,
      # and then map to i (1-10) to use with the character ramp
      i = round(bf * 10),
      # replace 0 with 1
      i = if_else(i == 0, 1, i)
    ) %>%
    rowwise() %>%
    mutate(c = substr(ramp, i, i)) %>% 
    arrange(y, x)
  
  # Plot
  ggplot(img_df) +
    # size of text is calculated from image height and is approximate
    geom_text(aes(x, y, label = c), family = "Courier Bold", size = max(img_df$y)/20) +
    scale_y_reverse() +
    coord_fixed() +
    theme_void()
  
  # Explort plot
  ggsave(paste0("output/", "ascii-", x, ".png"), width = 8, height = 8 / img_ratio)
  
  }
)

