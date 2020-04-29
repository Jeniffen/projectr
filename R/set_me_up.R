#' Create folder structure
#'
#' @description
#' This function will create a folder structure starting from the project root
#' that is necessary for a data science project.
#'
#' @param projectname A character string of the project title
#'
#' @return
#' A set of folders created in project root
#'
#' @export
set_me_up <- function(projectname = "Template Project") {

  # Create folder structure
  invisible(lapply(folder_structure, dir.create))

  # Provide README.Rmd for initial setup
  readme_rmd_path <- system.file(
      "rmarkdown",
      "templates",
      "readme",
      "skeleton",
      "README.Rmd",
       package = "projectr"
    ) %>%
    file.copy("./") %>%
    invisible()

  # Create custom README.md
  render(input  = "./README.Rmd",
         params = list(projectname = projectname),
         quiet = TRUE
  )

  structure <- c(
    "my_project                   # This is your project root                ",
    "│                                                                       ",
    "├── data                     # The root folder for data                 ",
    "│   ├── 01_raw               # Folder for all your raw data             ",
    "│   ├── 02_intermediate      # Folder for pre-processed data            ",
    "│   ├── 03_processed         # Folder for fully processed data          ",
    "│   └── 04_predictions       # Folder to save predictions               ",
    "│                                                                       ",
    "├── model                    # Folder to store all your models          ",
    "│                                                                       ",
    "├── notebooks                # Root folder for notebooks and Rmd files  ",
    "│   ├── eda                  # Folder for explpratory data analysis     ",
    "│   └── misc                 # Folder to try things out or stuff        ",
    "│                                                                       ",
    "├── references               # Root folder for all explanatory files    ",
    "│   ├── codebooks            # Folder for codebooks of your datasets    ",
    "│   └── docs                 # Folder for general documentation         ",
    "│       └── figures          # Folder to store figure and images        ",
    "│                                                                       ",
    "└── src                      # Root folder for all your scripts         ",
    "    ├── 01_preparation       # Folder for setup and prep. scripts       ",
    "    ├── 02_processing        # Folder for all kind of processing scripts",
    "    ├── 03_modelling         # Folder for all your training scripts     ",
    "    └── 04_visualization     # Folder for all your visualisation scripts"
  )

  cat("Your project has been successfully created!"   ,
      "Find below an ouline of your structure:"       ,
       ""                                             ,
      structure                                       ,
      ""                                              ,
      "Good luck!"                                    ,
      sep = "\n"
  )



}


