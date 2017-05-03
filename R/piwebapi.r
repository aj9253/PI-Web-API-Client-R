library(R6)
library(httr)
library(rjson)
piwebapi <- R6Class("piwebapi",
	private = list(),
	public = list(
		serviceBase = NULL,
		authType = NULL,
		username = NULL,
		password = NULL,
		debug = NULL,
		home = NULL,
		analysis = NULL,
		analysisCategory = NULL,
		analysisRulePlugIn = NULL,
		analysisRule = NULL,
		analysisTemplate = NULL,
		assetDatabase = NULL,
		assetServer = NULL,
		attributeCategory = NULL,
		attribute = NULL,
		attributeTemplate = NULL,
		attributeTrait = NULL,
		batch = NULL,
		calculation = NULL,
		channel = NULL,
		dataServer = NULL,
		elementCategory = NULL,
		element = NULL,
		elementTemplate = NULL,
		enumerationSet = NULL,
		enumerationValue = NULL,
		eventFrame = NULL,
		point = NULL,
		securityIdentity = NULL,
		securityMapping = NULL,
		stream = NULL,
		streamSet = NULL,
		system = NULL,
		configuration = NULL,
		tableCategory = NULL,
		table = NULL,
		timeRulePlugIn = NULL,
		timeRule = NULL,
		unitClass = NULL,
		unit = NULL,
		initialize = function(baseUrl, useKerberos, username, password, debug) {
			self$serviceBase <- baseUrl
			self$username <- username
			self$password <- password
			self$debug <- debug
			if (useKerberos == FALSE) {
				self$authType <- "basic"
			}
			else {
				self$authType <- "gssnegotiate"
			}
			self$home = homeApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$analysis = analysisApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$analysisCategory = analysisCategoryApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$analysisRulePlugIn = analysisRulePlugInApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$analysisRule = analysisRuleApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$analysisTemplate = analysisTemplateApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$assetDatabase = assetDatabaseApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$assetServer = assetServerApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$attributeCategory = attributeCategoryApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$attribute = attributeApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$attributeTemplate = attributeTemplateApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$attributeTrait = attributeTraitApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$batch = batchApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$calculation = calculationApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$channel = channelApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$dataServer = dataServerApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$elementCategory = elementCategoryApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$element = elementApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$elementTemplate = elementTemplateApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$enumerationSet = enumerationSetApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$enumerationValue = enumerationValueApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$eventFrame = eventFrameApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$point = pointApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$securityIdentity = securityIdentityApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$securityMapping = securityMappingApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$stream = streamApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$streamSet = streamSetApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$system = systemApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$configuration = configurationApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$tableCategory = tableCategoryApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$table = tableApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$timeRulePlugIn = timeRulePlugInApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$timeRule = timeRuleApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$unitClass = unitClassApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
			self$unit = unitApi$new(self$serviceBase, self$authType, self$username, self$password, self$debug)
		}
	)
)
