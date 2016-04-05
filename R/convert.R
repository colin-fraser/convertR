# Hello, world!
#
# This is an example function named 'hello'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

data(df, envir=environment())
g <- igraph::graph_from_edgelist(as.matrix(df[,1:2]), directed = T)
igraph::E(g)$factor <- df$factor



  #' Unit conversion
  #'
  #' @param number A numeric
  #' @param from The standard symbol for the unit being converted from
  #' @param to The standard symbol for the unit being converted to
  #'
  #' @return A numeric in the units specified in \code{to}
  #'
  #' @examples
  #' convert(24, 'd', 'h')
  #' convert(1:20, 'lb', 'kg')
  #'
  #' @export
convert <- function(number, from, to) {
  if (!all(c(from, to) %in% igraph::V(g)$name)) {
    invalid_units <- setdiff(c(from, to), igraph::V(g)$name)
    em <- paste('Invalid units:', paste(invalid_units, collapse=', '))
    stop(em)
  }
  p <- igraph::shortest_paths(g, from=from, to=to, output='epath')
  if (length(p$epath[[1]]) == 0) {
    stop('No conversion path found between units')
  }
  f <- prod(p$epath[[1]]$factor)
  return(number*f)
}

#' Print the list of available units
#'
#' @export
available.units <- function() {
  print(sort(igraph::V(g)$name))
}

#' @export
get_g <- function() {
  g
}
