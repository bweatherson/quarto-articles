library(tidyverse)

add_lettrine <- function(text) {
  str_replace(text, 
              "^(\\s*)(\\w)(\\w+)",
              "\\1\\\\lettrine{\\2}{\\3}")
}

quarto_lettrine <- function(text) {
  pdf_version <- add_lettrine(text)
  
  str_c(
    '::: {.content-visible when-format="pdf"}',
    pdf_version,
    ':::',
    '',
    '::: {.content-visible unless-format="pdf"}',
    text,
    ':::',
    sep = "\n"
  )
}

lettrine_from_clipboard <- function() {
  clipr::read_clip() |> 
    str_c(collapse = "\n") |>
    quarto_lettrine() |> 
    clipr::write_clip()
  
  message("Processed text copied back to clipboard!")
}