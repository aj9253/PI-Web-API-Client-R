% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/piAssetServer.r
\name{piAssetServer}
\alias{piAssetServer}
\title{Generate an instance of the piAssetServer PI Web API class}
\usage{
piAssetServer(webId = NULL, id = NULL, name = NULL, description = NULL,
  path = NULL, isConnected = NULL, serverVersion = NULL,
  extendedProperties = NULL, links = NULL)
}
\arguments{
\item{webId}{(string)}

\item{id}{(string)}

\item{name}{(string)}

\item{description}{(string)}

\item{path}{(string)}

\item{isConnected}{(boolean)}

\item{serverVersion}{(string)}

\item{extendedProperties}{(object)}

\item{links}{(object)}
}
\value{
piAssetServer
}
\description{
Generate an instance of the piAssetServer PI Web API class
}
\examples{
assetServer <- piAssetServer(webId = "S0DqD5loBNH0erqeqJodtBZxUkVTyRVOmNQ", id = "88AC2613-6A25-43EE-8C72-11EA52AF9025", name = "MyServer", description = "Sample Description", path = "\\\\\\\\MyServer", isConnected = FALSE, serverVersion = "2.5.0.5039")

}
