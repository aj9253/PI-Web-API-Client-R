pointApi <- R6Class("pointApi",
	private = list(),
	public = list(
		serviceBase = NULL,
		authType = NULL,
		username = NULL,
		password = NULL,
		debug = NULL,
		initialize = function(baseUrl, authType, username, password, debug) {
			self$serviceBase <- baseUrl
			self$username <- username
			self$password <- password
			self$authType <- authType
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
			localVarPath <- paste(c(self$serviceBase, '/points'), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piPoint"
			}
			return (contentResponse)
		},
		get = function(webId, selectedFields) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/points/', webId), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piPoint"
			}
			return (contentResponse)
		},
		update = function(webId, pointDTO) {
			queryParameters <- list()
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			if (is.null(pointDTO) || pointDTO == "") {
				return (paste0("Error: required parameter pointDTO was null or undefined"))
			}
			className <- attr(pointDTO, "className")
			if ((is.null(className)) || (className != "piPoint")) {
				return (print(paste0("Error: the class from the parameter pointDTO should be piPoint.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/points/', webId), collapse = "")
			res <- patchHttpRequest(localVarPath, pointDTO, self$username, self$password, self$authType, self$debug)
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
			localVarPath <- paste(c(self$serviceBase, '/points/', webId), collapse = "")
			res <- deleteHttpRequest(localVarPath, self$username, self$password, self$authType, self$debug)
			return (res)
		},
		getAttributes = function(webId, name, nameFilter, selectedFields) {
			queryParameters <- generateListForQueryString(name, "name")
			if (is.null(webId) || webId == "") {
				return (paste0("Error: required parameter webId was null or undefined"))
			}
			if (is.character(webId) == FALSE) {
				return (print(paste0("Error: webId must be a string.")))
			}
			localVarPath <- paste(c(self$serviceBase, '/points/', webId, '/attributes'), collapse = "")
			if (missing(name) == FALSE && is.null(name) == FALSE && name != "") {
				queryParameters$name <- name
				if (is.list(name) == FALSE) {
					return (print(paste0("Error: name must be a list.")))
				}
			}
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
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsPointAttribute"
			}
			if (res$status == 400) {
				attr(contentResponse, "className") <- "piErrors"
			}
			return (contentResponse)
		},
		getAttributeByName = function(name, webId, selectedFields) {
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
			localVarPath <- paste(c(self$serviceBase, '/points/', webId, '/attributes/', name), collapse = "")
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piPointAttribute"
			}
			return (contentResponse)
		},
		getMultiple = function(asParallel, includeMode, path, selectedFields, webId) {
			queryParameters <- generateListForTwoQueryString(path, "path", webId, "webId")
			localVarPath <- paste(c(self$serviceBase, '/points/multiple'), collapse = "")
			if (missing(asParallel) == FALSE && is.null(asParallel) == FALSE && asParallel != "") {
				queryParameters$asParallel <- asParallel
				if (is.logical(asParallel) == FALSE) {
					return (print(paste0("Error: asParallel must be a boolean.")))
				}
			}
			if (missing(includeMode) == FALSE && is.null(includeMode) == FALSE && includeMode != "") {
				queryParameters$includeMode <- includeMode
				if (is.character(includeMode) == FALSE) {
					return (print(paste0("Error: includeMode must be a string.")))
				}
			}
			if (missing(path) == FALSE && is.null(path) == FALSE && path != "") {
				queryParameters$path <- path
				if (is.list(path) == FALSE) {
					return (print(paste0("Error: path must be a list.")))
				}
			}
			if (missing(selectedFields) == FALSE && is.null(selectedFields) == FALSE && selectedFields != "") {
				queryParameters$selectedFields <- selectedFields
				if (is.character(selectedFields) == FALSE) {
					return (print(paste0("Error: selectedFields must be a string.")))
				}
			}
			if (missing(webId) == FALSE && is.null(webId) == FALSE && webId != "") {
				queryParameters$webId <- webId
				if (is.list(webId) == FALSE) {
					return (print(paste0("Error: webId must be a list.")))
				}
			}
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsItemPoint"
			}
			if (res$status == 207) {
				attr(contentResponse, "className") <- "piItemsItemPoint"
			}
			return (contentResponse)
		}
	)
)
