# Creat portraits from photos in R
This is a GitHub repository for recreating portraits that I used as gifts for my PhD mentors, Dr. Åshild Krogdahl and Dr. Trond M. Kortner, after I defended my thesis.  

### How to regenerate the portraits
Click the ![Launch Binder](http://mybinder.org/badge_logo.svg) badge located at the top of this README file, 
which turns this repository into an RStudio instance that has all the dependencies installed. 
Run `code/02_bspline.R` in the RStudio instance and the portraits will be created and stored under the `output/` folder. 
Run other R code under the `code/` folder to generate portraits in different styles. 

### File organization
Below is an overview of the file organization in this repository.

### Acknowledgements
The code used for generating portraits is largely taken from the [gkaramanis/aRtist](https://github.com/gkaramanis/aRtist) repository under the MIT license. 
The repository is maintained by Georgios Karamanis.

The R package [holepunch](https://karthik.github.io/holepunch/) was used to make this repository [binder](https://mybinder.org/)-ready. 
