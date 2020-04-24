#' Create folder structure
#'
#' @description
#' This function will create a folder structure starting from the project root
#' that is necessary for a data science project
#'
#' @return
#' A set of folders created in project root
#'
#' @export
give_me_wings <- function() {

  # function to create folder_structure
  invisible(lapply(folder_structure, dir.create))

}
