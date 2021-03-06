systemApi <- R6Class("systemApi",
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
		landing = function() {
			queryParameters <- list()
			localVarPath <- paste(c(self$serviceBase, '/system'), collapse = "")
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piSystemLanding"
			}
			return (contentResponse)
		},
		cacheInstances = function() {
			queryParameters <- list()
			localVarPath <- paste(c(self$serviceBase, '/system/cacheinstances'), collapse = "")
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piItemsCacheInstance"
			}
			return (contentResponse)
		},
		status = function() {
			queryParameters <- list()
			localVarPath <- paste(c(self$serviceBase, '/system/status'), collapse = "")
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piSystemStatus"
			}
			return (contentResponse)
		},
		userInfo = function() {
			queryParameters <- list()
			localVarPath <- paste(c(self$serviceBase, '/system/userinfo'), collapse = "")
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
				attr(contentResponse, "className") <- "piUserInfo"
			}
			if (res$status == 204) {
				attr(contentResponse, "className") <- "piUserInfo"
			}
			return (contentResponse)
		},
		versions = function() {
			queryParameters <- list()
			localVarPath <- paste(c(self$serviceBase, '/system/versions'), collapse = "")
			res <- getHttpRequest(localVarPath, queryParameters, self$username, self$password, self$authType, self$validateSSL, self$debug)
			contentResponse <- content(res)
			if (res$status == 200) {
			}
			return (contentResponse)
		}
	)
)
