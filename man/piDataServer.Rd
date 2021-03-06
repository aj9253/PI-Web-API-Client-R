% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/piDataServer.r
\name{piDataServer}
\alias{piDataServer}
\title{Generate an instance of the piDataServer PI Web API class}
\usage{
piDataServer(webId = NULL, id = NULL, name = NULL, path = NULL,
  isConnected = NULL, serverVersion = NULL, links = NULL)
}
\arguments{
\item{webId}{(string)}

\item{id}{(string)}

\item{name}{(string)}

\item{path}{(string)}

\item{isConnected}{(boolean)}

\item{serverVersion}{(string)}

\item{links}{(object)}
}
\value{
piDataServer
}
\description{
Generate an instance of the piDataServer PI Web API class
}
\examples{
dataServer <- piDataServer(webId = "s0ZkdQM9wxoUCScZWmnpgoEwUEhMVlpO", id = "6F88ABE1-7F0B-421A-852F-A0AE50035888", name = "MyPIServer", path = "\\\\\\\\PIServer[MyPIServer]", isConnected = FALSE, serverVersion = "3.4.390.18")

}
