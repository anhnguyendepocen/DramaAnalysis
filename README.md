[![release](https://img.shields.io/badge/release-2.0.2-blue.svg)](https://github.com/quadrama/DramaAnalysis/releases/tag/v2.0.2)
[![Build Status](https://travis-ci.org/quadrama/DramaAnalysis.svg?branch=master)](https://travis-ci.org/quadrama/DramaAnalysis)
[![DOI](https://zenodo.org/badge/64286398.svg)](https://zenodo.org/badge/latestdoi/64286398)
[![license](https://img.shields.io/badge/license-Apache%202-blue.svg)](LICENSE)

# DramaAnalysis with R

This package contains a number of functions to support the analyis of dramatic texts. 

## Features
- Summary statistics about the number of words and utterances per figure
- Statistics about word use from a dictionary per figure
- Support for stylometric analyses by figure or text
- Generation of a report for a dramatic text
- Reads in preprocessed texts 

# Requirements
DramaAnalysis *should* work on Mac OS X, Windows 10 and Linuxes, and is mostly used in [RStudio](https://www.rstudio.com).


# Installation
```R
# this is only necessary once per system
install.packages("devtools") 
library(devtools)

# Install newest stable version
install_github("quadrama/DramaAnalysis", build_vignettes = TRUE) 

# Install newest development version
install_github("quadrama/DramaAnalysis", ref="develop/2.x", build_vignettes = TRUE)

# Install specific version (2.0.2)
install_github("quadrama/DramaAnalysis", ref="v2.0.2", build_vignettes = TRUE) 
```

# Usage and Howto
Please see the [wiki](https://github.com/quadrama/DramaAnalysis/wiki).

