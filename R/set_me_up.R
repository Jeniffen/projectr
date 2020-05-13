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

  projectname_ <- janitor::make_clean_names(projectname)

  if (!confirm_directory(projectname_)) {
    return(unconfirmed_directory())
  }

  # Create folder structure
  purrr::walk(folder_structure, dir.create)

  # Provide README.Rmd for initial setup
  system.file(
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

  show_structure(projectname_)
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

  custom_tree <- gsub("<projectname>", projectname, structure_tree)

  composed_structure <- nchar(custom_tree) %>%
    purrr::map(~strrep(" ", (30 - .x))) %>%
    paste0(
      custom_tree,
      .,
      structure_description
    )

  structure_overview(composed_structure)
}

#' Prompt to confirm current working directory
#'
#' @description
#' This is a helper function, in order to confirm the current working directory
#'
#' @inheritParams set_me_up
#'
#'@return
#' A logical whether or not to set up in the current working directory
#'
confirm_directory <- function(projectname){

  directory_confirm(projectname)

  switch (tolower(readline(prompt = "")),
          "y" = TRUE,
          "n" = FALSE,
          FALSE
  )
}


## Quites concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "3.6.2")  utils::globalVariables(c("."))
