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
set_me_up <- function(projectname = "Template Project",
                      structure_file = NULL) {

  projectname_ <- janitor::make_clean_names(projectname)

  if (!confirm_directory(projectname_)) {
    return(unconfirmed_directory())
  }

  if(is.null(structure_file)) {
    fs_structure <- system.file(
        "json",
        "folder_structure.json",
        package = "projectr"
      ) %>%
      jsonlite::read_json() %>%
      create_structure()
  }

  # Create folder structure
  purrr::walk(here::here(projectname_, fs_structure), fs::dir_create)

  # Provide README.Rmd for initial setup
  system.file(
      "rmarkdown",
      "templates",
      "readme",
      "skeleton",
      "README.Rmd",
       package = "projectr"
    ) %>%
    file.copy(here::here(projectname_)) %>%
    invisible()

  # Create custom README.md
  render(input  = here::here(projectname_, "README.Rmd"),
         params = list(projectname = projectname_),
         quiet = TRUE
  )

  show_structure(projectname_)
}

