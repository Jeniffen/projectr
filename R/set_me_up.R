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

  if (!confirm_directory()) {
    return(
      cat(crayon::yellow(
        c("We are sorry, your working directory was not confirmed.",
          "Your project was not setup! Try again when you are ready."))
        )
      )
  }

  # Create folder structure
  invisible(lapply(folder_structure, dir.create))

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

  projectname %>%
    show_structure(.)
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

  composed_structure %>%
    cat(""                                            ,
        "Your project has been successfully created!" ,
        "Find below an outline of your structure:"    ,
        ""                                            ,
        .                                             ,
        ""                                            ,
        "Good luck!"                                  ,
        sep = "\n"
    )
}



confirm_directory <- function(){

  cat("Your current working directory is:",
      "",
      crayon::green("#>", getwd()),
      "",
      "Do you want to setup your project here? (y/n)",
      sep = "\n")

  switch (tolower(readline(prompt = "")),
          "y" = TRUE,
          "n" = FALSE,
          FALSE
  )
}


## Quites concerns of R CMD check re: the .'s that appear in pipelines
if(getRversion() >= "3.6.2")  utils::globalVariables(c("."))
