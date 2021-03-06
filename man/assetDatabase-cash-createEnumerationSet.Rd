% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assetDatabaseApi.r
\name{assetDatabase$createEnumerationSet}
\alias{assetDatabase$createEnumerationSet}
\title{Create an enumeration set at the Asset Database.}
\arguments{
\item{webId}{The ID of the database in which to create the enumeration set.}

\item{piEnumerationSet}{The new enumeration set definition.}
}
\value{
The enumeration set was created. The response's Location header is a link to the created enumeration set.
}
\description{
Create an enumeration set at the Asset Database.
}
