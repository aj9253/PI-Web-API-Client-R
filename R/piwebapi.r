library(R6)
library(httr)
library(rjson)
source("httpRequests.r")
source("piAnalysis.r")
source("piAnalysisCategory.r")
source("piAnalysisRule.r")
source("piAnalysisRulePlugIn.r")
source("piAnalysisTemplate.r")
source("piAnnotation.r")
source("piAssetDatabase.r")
source("piAssetServer.r")
source("piAttribute.r")
source("piAttributeCategory.r")
source("piAttributeTemplate.r")
source("piAttributeTrait.r")
source("piCacheInstance.r")
source("piDataServer.r")
source("piElement.r")
source("piElementCategory.r")
source("piElementTemplate.r")
source("piEnumerationSet.r")
source("piEnumerationValue.r")
source("piErrors.r")
source("piEventFrame.r")
source("piItemAttribute.r")
source("piItemElement.r")
source("piItemEventFrame.r")
source("piItemPoint.r")
source("piItemsAnalysis.r")
source("piItemsAnalysisCategory.r")
source("piItemsAnalysisRule.r")
source("piItemsAnalysisRulePlugIn.r")
source("piItemsAnalysisTemplate.r")
source("piItemsAnnotation.r")
source("piItemsAssetDatabase.r")
source("piItemsAssetServer.r")
source("piItemsAttribute.r")
source("piItemsAttributeCategory.r")
source("piItemsAttributeTemplate.r")
source("piItemsAttributeTrait.r")
source("piItemsCacheInstance.r")
source("piItemsDataServer.r")
source("piItemsElement.r")
source("piItemsElementCategory.r")
source("piItemsElementTemplate.r")
source("piItemsEnumerationSet.r")
source("piItemsEnumerationValue.r")
source("piItemsEventFrame.r")
source("piItemsItemAttribute.r")
source("piItemsItemElement.r")
source("piItemsItemEventFrame.r")
source("piItemsItemPoint.r")
source("piItemsItemsSubstatus.r")
source("piItemsPoint.r")
source("piItemsPointAttribute.r")
source("piItemsSecurityEntry.r")
source("piItemsSecurityIdentity.r")
source("piItemsSecurityMapping.r")
source("piItemsSecurityRights.r")
source("piItemsStreamSummaries.r")
source("piItemsStreamValue.r")
source("piItemsStreamValues.r")
source("piItemsSubstatus.r")
source("piItemsSummaryValue.r")
source("piItemsTable.r")
source("piItemsTableCategory.r")
source("piItemsTimeRulePlugIn.r")
source("piItemsUnitClass.r")
source("piLanding.r")
source("piPoint.r")
source("piPointAttribute.r")
source("piRequest.r")
source("piRequestTemplate.r")
source("piResponse.r")
source("piSecurity.r")
source("piSecurityEntry.r")
source("piSecurityIdentity.r")
source("piSecurityMapping.r")
source("piSecurityRights.r")
source("piStreamSummaries.r")
source("piStreamValue.r")
source("piStreamValues.r")
source("piSubstatus.r")
source("piSummaryValue.r")
source("piSystemLanding.r")
source("piSystemStatus.r")
source("piTable.r")
source("piTableCategory.r")
source("piTableData.r")
source("piTimedValue.r")
source("piTimedValues.r")
source("piTimeRule.r")
source("piTimeRulePlugIn.r")
source("piUnit.r")
source("piUnitClass.r")
source("piUserInfo.r")
source("piValue.r")
source("piVersion.r")
source("dataApi.r")
source("homeApi.r")
source("analysisApi.r")
source("analysisCategoryApi.r")
source("analysisRulePlugInApi.r")
source("analysisRuleApi.r")
source("analysisTemplateApi.r")
source("assetDatabaseApi.r")
source("assetServerApi.r")
source("attributeCategoryApi.r")
source("attributeApi.r")
source("attributeTemplateApi.r")
source("attributeTraitApi.r")
source("batchApi.r")
source("calculationApi.r")
source("channelApi.r")
source("dataServerApi.r")
source("elementCategoryApi.r")
source("elementApi.r")
source("elementTemplateApi.r")
source("enumerationSetApi.r")
source("enumerationValueApi.r")
source("eventFrameApi.r")
source("pointApi.r")
source("securityIdentityApi.r")
source("securityMappingApi.r")
source("streamApi.r")
source("streamSetApi.r")
source("systemApi.r")
source("configurationApi.r")
source("tableCategoryApi.r")
source("tableApi.r")
source("timeRulePlugInApi.r")
source("timeRuleApi.r")
source("unitClassApi.r")
source("unitApi.r")
piwebapi <- R6Class("piwebapi",
	private = list(),
	public = list(
		serviceBase = NULL,
		authType = NULL,
		username = NULL,
		password = NULL,
		validateSSL = NULL,
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
		data = NULL,
		initialize = function(baseUrl, useKerberos, username, password, validateSSL = TRUE, debug = FALSE) {
			self$serviceBase <- baseUrl
			self$username <- username
			self$password <- password
			self$validateSSL <- validateSSL
			self$debug <- debug
			if (useKerberos == FALSE) {
				self$authType <- "basic"
			}
			else {
				self$authType <- "gssnegotiate"
			}
			self$home = homeApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$analysis = analysisApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$analysisCategory = analysisCategoryApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$analysisRulePlugIn = analysisRulePlugInApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$analysisRule = analysisRuleApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$analysisTemplate = analysisTemplateApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$assetDatabase = assetDatabaseApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$assetServer = assetServerApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$attributeCategory = attributeCategoryApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$attribute = attributeApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$attributeTemplate = attributeTemplateApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$attributeTrait = attributeTraitApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$batch = batchApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$calculation = calculationApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$channel = channelApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$dataServer = dataServerApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$elementCategory = elementCategoryApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$element = elementApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$elementTemplate = elementTemplateApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$enumerationSet = enumerationSetApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$enumerationValue = enumerationValueApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$eventFrame = eventFrameApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$point = pointApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$securityIdentity = securityIdentityApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$securityMapping = securityMappingApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$stream = streamApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$streamSet = streamSetApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$system = systemApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$configuration = configurationApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$tableCategory = tableCategoryApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$table = tableApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$timeRulePlugIn = timeRulePlugInApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$timeRule = timeRuleApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$unitClass = unitClassApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$unit = unitApi$new(self$serviceBase, self$authType, self$username, self$password, self$validateSSL, self$debug)
			self$data = dataApi$new(self$attribute, self$point, self$stream, self$streamSet)
		}
	)
)
