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
      "README.Rmd",
       package = "projectr"
    ) %>%
    file.copy("./") %>%
    invisible()

  # Create custom README.md
  render(input  = "./README.Rmd",
         params = list(projectname = projectname)
  )

}
