#' Create folder structure
#'
#' @description
#' This function will create a folder structure starting from the project root
#' that is necessary for a data science project.
#'
#' @param structure_json A character string of the project title
#'
#' @return
#' A set of folders created in project root
#'
create_structure <- function(structure_json) {

  top_level_folder <- names(structure_json)

  if(!is.null(top_level_folder)) {
    top_level_folder %>%
      purrr::map(~deconstruct_hierarchy(structure_json, .x)) %>%
      unlist()
  }
}


#' Create folder structure
#'
#' @description
#' This function will create a folder structure starting from the project root
#' that is necessary for a data science project.
#'
#' @param sub_structure A character string of the project title
#' @param parent_name A character string of the project title
#'
#' @return
#' A set of folders created in project root
#'
deconstruct_hierarchy <- function(sub_structure, parent_name) {

  nodes <- purrr::pluck(sub_structure, parent_name)
  sub_level_folder <- names(purrr::pluck(nodes, 1))
  sub_level_select <- purrr::map_lgl(nodes, ~is.character(names(.x)))

  folder_paths <-  create_path(
    parent_name = parent_name,
    child_node  = nodes
  )

  if(sum(sub_level_select) > 0) {
    folder_paths <- purrr::discard(folder_paths, sub_level_select)
  }

  if(!is.null(sub_level_folder)) {
    child_nodes <- sub_level_folder %>%
      purrr::map(
        ~deconstruct_hierarchy(purrr::pluck(nodes, 1), .x) %>%
          file.path(parent_name, .)
      )

    folder_paths <- append(folder_paths, child_nodes)
  }

  return(folder_paths)
}


#' Create folder structure
#'
#' @description
#' This function will create a folder structure starting from the project root
#' that is necessary for a data science project.
#'
#' @param parent_name A character string of the project title
#' @param child_node A character string of the project title
#'
#' @return
#' A set of folders created in project root
#'
create_path <- function(parent_name, child_node) {

  if(is.null(child_node)) child_node <- c("")
  file.path(parent_name, child_node)

}


#' Output composed project structure description
#'
#' @description
#' This is a helper function, to output a composed structure using the
#' directory tree with the corresponding description and the projectname, that
#' was specified by the user.
#'
#' @param projectname A character string of the project title
#'
#' @return
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
#' @param projectname A character string of the project title
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
