
<!-- README.md is generated from README.Rmd. Please edit that file -->

# projectr

<!-- badges: start -->

<!-- badges: end -->

## Overview

The **projectr** package is designed to be a lightweight package, with
the single goal of taking away the hassle of creating the *right* folder
structure for any data science project. The boilerpalte being provided,
any project can then be customized or enhanced to special needs and
requirements.

The resulting folder structure is insprired by [Coockiecutter Data
Science](https://tinyurl.com/y89ay63o) and Edward Ma’s
[blogpost](https://tinyurl.com/ybghtonj) on managing your data science
project early on. Further adjuments were made based on feedback by the
data science community.

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

## Code of Conduct

Please note that the projectr project is released with a [Contributor Code of Conduct](#). 
By contributing to this project, you agree to abide by its terms.
