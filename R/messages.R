structure_overview <- function(composed_structure) {

  cat(""                                            ,
      "Your project has been successfully created!" ,
      "Find below an outline of your structure:"    ,
      ""                                            ,
      composed_structure                            ,
      ""                                            ,
      "Good luck!"                                  ,
      sep = "\n"
  )

}

# -------------------------------------------------------------------------

directory_confirm <- function(projectname) {

  cat("Your project will be set up in the following directory:",
      "",
      file.path(crayon::green("#>", getwd()),
                crayon::red(projectname)),
      "",
      "Do you want to proceed with the setup here? (y/n)",
      sep = "\n"
  )
}

# -------------------------------------------------------------------------

unconfirmed_directory <- function() {

  cat(
    crayon::yellow(
      c("Sorry, your directory was not confirmed.",
        "Your project was", crayon::red("not"), "setup!",
        "Try again when you are ready.", "\n",
        "\n",
        "Hint: If you want to change your working directory for this project",
        "do the following:", "\n",
        "\n",
        paste0(
          "#> setwd(\"",
          file.path("This", "is", "the", "directory", "I", "want"),
          "\")"
        )
      )
    )
  )
}
