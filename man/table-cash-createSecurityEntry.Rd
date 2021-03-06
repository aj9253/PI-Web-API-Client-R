% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tableApi.r
\name{table$createSecurityEntry}
\alias{table$createSecurityEntry}
\title{Create a security entry owned by the table.}
\arguments{
\item{webId}{The ID of the table where the security entry will be created.}

\item{piSecurityEntry}{The new security entry definition. The full list of allow and deny rights must be supplied.}

\item{applyToChildren}{If false, the new access permissions are only applied to the associated object. If true, the access permissions of children with any parent-child reference types will change when the permissions on the primary parent change.}
}
\value{
The security entry was created. The response's Location header is a link to the security entry.
}
\description{
Create a security entry owned by the table.
}
