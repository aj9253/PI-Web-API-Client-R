% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assetDatabaseApi.r
\name{assetDatabase$getSecurityEntryByName}
\alias{assetDatabase$getSecurityEntryByName}
\title{Retrieve the security entry of the specified security item associated with the asset database with the specified name.}
\arguments{
\item{name}{The name of the security entry. For every backslash character (\\) in the security entry name, replace with asterisk (*). As an example, use domain*username instead of domain\\username.}

\item{webId}{The ID of the asset database.}

\item{securityItem}{The security item of the desired security entries information to be returned. If the parameter is not specified, security entries of the 'Default' security item will be returned.}

\item{selectedFields}{List of fields to be returned in the response, separated by semicolons (;). If this parameter is not specified, all available fields will be returned.}
}
\value{
The security entry matching the specified condition.
}
\description{
Retrieve the security entry of the specified security item associated with the asset database with the specified name.
}
