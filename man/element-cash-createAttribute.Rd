% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/elementApi.r
\name{element$createAttribute}
\alias{element$createAttribute}
\title{Create a new attribute of the specified element.}
\arguments{
\item{webId}{The ID of the element on which to create the attribute.}

\item{piAttribute}{The definition of the new attribute.}
}
\value{
The attribute was created. The response's Location header is a link to the created attribute.
}
\description{
Create a new attribute of the specified element.
}
