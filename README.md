<!-- badges: start -->
[![Launch Rstudio Binder](http://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/yanxianl/portraitr/master?urlpath=rstudio)
<!-- badges: end -->

# Creat portraits from photos in R
This is a GitHub repository for recreating portraits that I used as gifts for my PhD mentors, Dr. Åshild Krogdahl and Dr. Trond M. Kortner, after I defended my thesis on Oct 29, 2021.  

### How to regenerate the portraits
Click the ![Launch Binder](http://mybinder.org/badge_logo.svg) badge located at the top of this README file. It will turn this repository into an RStudio instance that has all the dependencies installed. 
Run all the code under the `code/` folder to regenerate the portraits, which will be stored under the `output/` folder. 

### File organization
Below is an overview of the file organization in this repository.
```
root
├── code
│   ├── 01_ascii.R
│   ├── 02_bspline.R
│   ├── 03_ridge.R
│   └── 04_tanaka.R
├── DESCRIPTION
├── image
│   ├── ashild.jpg
│   └── trond.jpg
├── LICENSE
├── output
│   ├── ascii-ashild.png
│   ├── ascii-trond.png
│   ├── bspl-ashild.png
│   ├── bspl-trond.png
│   ├── ridge-ashild.png
│   ├── ridge-trond.png
│   ├── tanaka-ashild.png
│   └── tanaka-trond.png
├── portraitr.Rproj
└── README.md
```

### Acknowledgements
The code used for generating portraits was largely taken from the [gkaramanis/aRtist](https://github.com/gkaramanis/aRtist) repository under the MIT license. 
The repository is maintained by Georgios Karamanis.

The R package [holepunch](https://karthik.github.io/holepunch/) was used to make this repository [binder](https://mybinder.org/)-ready. 
