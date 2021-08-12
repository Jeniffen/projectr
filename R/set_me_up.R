#' Create folder structure
#'
#' @description
#' This function will create a folder structure that is needed for a data
#' science project, starting from the current directory.
#'
#' @param projectname A character string of the project title
#'
#' @return
#' A set of folders created in current directory
#'
#' @export
set_me_up <- function(projectname = "Template Project") {

  # Create static folder structure from internal data
  purrr::walk(folder_structure, dir.create)

  # Provide README.Rmd for initial setup
  system.file("templates", "README.Rmd", package = "projectr") %>%
    file.copy(here::here())

  # Create custom README.md
  rmarkdown::render(
      input  = here::here("README.Rmd"),
      params = list(projectname = projectname),
      quiet  = TRUE
    )

  projectname %>%
    .show_structure()
}

# Print console output of composed project structure and description
#
.show_structure <- function(projectname) {

  custom_tree <- gsub("<projectname>", projectname, structure_tree)

  # Ensure directory tree and description is aligned consistently
  composed_structure <- paste0(
      custom_tree,
      purrr::map(nchar(custom_tree), ~strrep(" ", (30 - .x))),
      structure_description
    )

  cat(
      ""                                            ,
      "Your project has been successfully created!" ,
      "Find below an outline of your structure:"    ,
      ""                                            ,
      composed_structure                            ,
      ""                                            ,
      "Good luck!"                                  ,
      sep = "\n"
    )
}
