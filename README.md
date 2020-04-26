
<!-- README.md is generated from README.Rmd. Please edit that file -->

# projectr

<!-- badges: start -->

<!-- badges: end -->

The goal of this package is to set up a universal project folder
structure for any data science project.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Jeniffen/projectr")
```

## Usage

``` r
projectr::set_me_up()
```

    project
    │
    ├── data
    │   ├── 01_raw
    │   ├── 02_intermediate
    │   ├── 03_processed
    │   └── 04_predictions 
    │   
    ├── model
    │
    ├── notebooks
    │   ├── eda
    │   └── misc
    │
    ├── references
    │   ├── codebooks
    │   └── docs
    │       └── figures
    │
    └── src
        ├── 01_preparation
        ├── 02_processing
        ├── 03_modelling
        └── 04_visualization
