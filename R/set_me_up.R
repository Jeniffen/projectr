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
    file.copy(here::here()) %>%
    invisible()

  # Create custom README.md
  render(input  = here::here("README.Rmd"),
         params = list(projectname = projectname),
         quiet = TRUE
  )

  projectname %>%
    show_structure()
}

#' Output composed project structure description
#'
#' @description
#' This is a helper function, to output a composed structure using the
#' directory tree with the corresponding description and the projectname, that
#' was specified by the user.
#'
#' @inheritParams set_me_up
#'
#'@return
#'A console output of the project structure
#'
show_structure <- function(projectname) {
  composed_structure <- (30 - nchar(structure_tree)) %>%
    purrr::map(~strrep(" ", .x)) %>%
    paste0(
      structure_tree,
      rlang::.data,
      structure_description
    )

  composed_structure %>%
    gsub("<projectname>", projectname, rlang::.data) %>%
    cat("Your project has been successfully created!" ,
        "Find below an outline of your structure:"    ,
        ""                                            ,
        rlang::.data                                  ,
        ""                                            ,
        "Good luck!"                                  ,
        sep = "\n"
    )
}
