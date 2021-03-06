% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/securityMappingApi.r
\name{securityMapping$getSecurityEntries}
\alias{securityMapping$getSecurityEntries}
\title{Retrieve the security entries associated with the security mapping based on the specified criteria. By default, all security entries for this security mapping are returned.}
\arguments{
\item{webId}{The ID of the security mapping.}

\item{nameFilter}{The name query string used for filtering security entries. The default is no filter.}

\item{selectedFields}{List of fields to be returned in the response, separated by semicolons (;). If this parameter is not specified, all available fields will be returned.}
}
\value{
A list of security entries matching the specified condition.
}
\description{
Retrieve the security entries associated with the security mapping based on the specified criteria. By default, all security entries for this security mapping are returned.
}
