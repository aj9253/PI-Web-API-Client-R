analysisTemplateApi <- R6Class("analysisTemplateApi",
	private = list(),
	public = list(
		serviceBase = NULL,
		authType = NULL,
		username = NULL,
		password = NULL,
		validateSSL = NULL,
		debug = NULL,
		initialize = function(baseUrl, authType, username, password, validateSSL, debug) {
			self$serviceBase <- baseUrl
			self$username <- username
			self$password <- password
			self$authType <- authType
			self$validateSSL <- validateSSL
			self$debug <- debug
		},
		getByPath = function(path, selectedFields) {
			queryParameters <- list()
			if (is.null(path) || path == "") {
				return (paste0("Error: required parameter path was null or undefined"))
			}
			if (is.character(path) == FALSE) {
				return (print(paste0("Error: path must be a string.")))
			}
			queryParameters$path <- path
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piAnalysisTemplate"
			}
			return (contentResponse)
		},
		createFromAnalysis = function(analysisWebId, name) {
			queryParameters <- list()
			if (is.null(analysisWebId) || analysisWebId == "") {
				return (paste0("Error: required parameter analysisWebId was null or undefined"))
			}
			if (is.character(analysisWebId) == FALSE) {
				return (print(paste0("Error: analysisWebId must be a string.")))
			}
			queryParameters$analysisWebId <- analysisWebId
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates'), collapse = "")
			if (missing(name) == FALSE && is.null(name) == FALSE && name != "") {
				queryParameters$name <- name
				if (is.character(name) == FALSE) {
					return (print(paste0("Error: name must be a string.")))
				}
			}
			res <- postHttpRequest(localVarPath, , self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		},
		get = function(webId, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates/', webId), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piAnalysisTemplate"
			}
			return (contentResponse)
		},
		update = function(webId, piAnalysisTemplate) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(piAnalysisTemplate) || piAnalysisTemplate == "") {
				return (paste0("Error: required parameter piAnalysisTemplate was null or undefined"))
			}
			className <- attr(piAnalysisTemplate, "className")
			if ((is.null(className)) || (className != "piAnalysisTemplate")) {
				return (print(paste0("Error: the class from the parameter piAnalysisTemplate should be piAnalysisTemplate.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates/', webId), collapse = "")
			res <- patchHttpRequest(localVarPath, piAnalysisTemplate, self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		},
		delete = function(webId) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates/', webId), collapse = "")
			res <- deleteHttpRequest(localVarPath, self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		},
		getCategories = function(webId, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates/', webId, '/categories'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsAnalysisCategory"
			}
			return (contentResponse)
		},
		getSecurity = function(webId, userIdentity, forceRefresh, selectedFields) {
			queryParameters <- generateListForQueryString(userIdentity, "userIdentity")
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(userIdentity) || userIdentity == "") {
				return (paste0("Error: required parameter userIdentity was null or undefined"))
			}
			if (is.vector(userIdentity) == FALSE) {
				return (print(paste0("Error: userIdentity must be a vector.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates/', webId, '/security'), collapse = "")
			if (missing(forceRefresh) == FALSE && is.null(forceRefresh) == FALSE && forceRefresh != "") {
				queryParameters$forceRefresh <- forceRefresh
				if (is.logical(forceRefresh) == FALSE) {
					return (print(paste0("Error: forceRefresh must be a boolean.")))
				}
			}
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsSecurityRights"
			}
			if (res$status == 400) {
				attr(contentResponse, "className") <- "piErrors"
			}
			if (res$status == 401) {
				attr(contentResponse, "className") <- "piErrors"
			}
			if (res$status == 409) {
				attr(contentResponse, "className") <- "piErrors"
			}
			if (res$status == 502) {
				attr(contentResponse, "className") <- "piErrors"
			}
			return (contentResponse)
		},
		getSecurityEntries = function(webId, nameFilter, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates/', webId, '/securityentries'), collapse = "")
			if (missing(nameFilter) == FALSE && is.null(nameFilter) == FALSE && nameFilter != "") {
				queryParameters$nameFilter <- nameFilter
				if (is.character(nameFilter) == FALSE) {
					return (print(paste0("Error: nameFilter must be a string.")))
				}
			}
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsSecurityEntry"
			}
			return (contentResponse)
		},
		createSecurityEntry = function(webId, piSecurityEntry, applyToChildren) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(piSecurityEntry) || piSecurityEntry == "") {
				return (paste0("Error: required parameter piSecurityEntry was null or undefined"))
			}
			className <- attr(piSecurityEntry, "className")
			if ((is.null(className)) || (className != "piSecurityEntry")) {
				return (print(paste0("Error: the class from the parameter piSecurityEntry should be piSecurityEntry.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates/', webId, '/securityentries'), collapse = "")
			if (missing(applyToChildren) == FALSE && is.null(applyToChildren) == FALSE && applyToChildren != "") {
				queryParameters$applyToChildren <- applyToChildren
				if (is.logical(applyToChildren) == FALSE) {
					return (print(paste0("Error: applyToChildren must be a boolean.")))
				}
			}
			res <- postHttpRequest(localVarPath, piSecurityEntry, self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		},
		getSecurityEntryByName = function(name, webId, selectedFields) {
			queryParameters <- list()
			if (is.null(name) || name == "") {
				return (paste0("Error: required parameter name was null or undefined"))
			}
			if (is.character(name) == FALSE) {
				return (print(paste0("Error: name must be a string.")))
			}
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates/', webId, '/securityentries/', name), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piSecurityEntry"
			}
			if (res$status == 404) {
				attr(contentResponse, "className") <- "piErrors"
			}
			return (contentResponse)
		},
		updateSecurityEntry = function(name, webId, piSecurityEntry, applyToChildren) {
			queryParameters <- list()
			if (is.null(name) || name == "") {
				return (paste0("Error: required parameter name was null or undefined"))
			}
			if (is.character(name) == FALSE) {
				return (print(paste0("Error: name must be a string.")))
			}
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(piSecurityEntry) || piSecurityEntry == "") {
				return (paste0("Error: required parameter piSecurityEntry was null or undefined"))
			}
			className <- attr(piSecurityEntry, "className")
			if ((is.null(className)) || (className != "piSecurityEntry")) {
				return (print(paste0("Error: the class from the parameter piSecurityEntry should be piSecurityEntry.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates/', webId, '/securityentries/', name), collapse = "")
			if (missing(applyToChildren) == FALSE && is.null(applyToChildren) == FALSE && applyToChildren != "") {
				queryParameters$applyToChildren <- applyToChildren
				if (is.logical(applyToChildren) == FALSE) {
					return (print(paste0("Error: applyToChildren must be a boolean.")))
				}
			}
			res <- putHttpRequest(localVarPath, queryParameters, piSecurityEntry, self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		},
		deleteSecurityEntry = function(name, webId, applyToChildren) {
			queryParameters <- list()
			if (is.null(name) || name == "") {
				return (paste0("Error: required parameter name was null or undefined"))
			}
			if (is.character(name) == FALSE) {
				return (print(paste0("Error: name must be a string.")))
			}
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/analysistemplates/', webId, '/securityentries/', name), collapse = "")
			if (missing(applyToChildren) == FALSE && is.null(applyToChildren) == FALSE && applyToChildren != "") {
				queryParameters$applyToChildren <- applyToChildren
				if (is.logical(applyToChildren) == FALSE) {
					return (print(paste0("Error: applyToChildren must be a boolean.")))
				}
			}
			res <- deleteHttpRequest(localVarPath, self$username, self$password, self$authType, self$validateSSL, self$debug)
			return (res)
		}
	)
)
