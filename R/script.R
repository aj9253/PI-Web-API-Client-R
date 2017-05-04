#install.packages("devtools")
#library(devtools)
#install_github("osimloeff/PI-Web-API-Client-R")
#help(package="piwebapi") 
#library(piwebapi)

rm(list = ls())
source("piwebapi.r")
piWebApiService <- piwebapi$new("https://cross-platform-lab-uc2017.osisoft.com/piwebapi", FALSE, "pilabuser", "PIWebAPI2015", TRUE, TRUE)
webIds <- array(1:2)
webIds[1] <- "P0TJVKOA0Ws0KihcA8rM1GogAQAAAAUElGSVRORVNTLVNSVjJcU0lOVVNPSUQ"
webIds[2] <- "P0TJVKOA0Ws0KihcA8rM1GogAgAAAAUElGSVRORVNTLVNSVjJcU0lOVVNPSURV"
webIdsList <- as.list(webIds)
elementWebId <- "E0HJkbZVV7j02k8EkENnzFvAoC0PJrmP5hGAxgANOjLi4QUElGSVRORVNTLVNSVjJcV0VBVEhFUlxBTEJBTlk"

#Request 1 - Main PI Web API endpoint
response1 = piWebApiService$home$get()

#Request 2 - Get PI Data Archive
response2 = piWebApiService$dataServer$getByPath("\\\\pifitness-srv2", "name")

#Request 3 - Create a PI Point
newPoint <- piPoint(NULL, NULL, "SINUSOIDR", NULL, "12 Hour Sine Wave", "classic", "Float32", NULL, NULL, NULL, NULL, NULL)
response3 = piWebApiService$dataServer$createPoint("s0TJVKOA0Ws0KihcA8rM1GogUElGSVRORVNTLVNSVjI", newPoint)

#Request 4 - Get values in bulk
response4 = piWebApiService$streamSet$getValuesAdHoc(as.list(webIds))

#Request 5 - UpdateValues in bulk
timedValue1 <- piTimedValue(timestamp = "2017-04-26T17:40:54Z", value = 30)
timedValue2 <- piTimedValue(timestamp = "2017-04-27T17:40:54Z", value = 31)
timedValue3 <- piTimedValue(timestamp = "2017-04-26T17:40:54Z", value = 32)
timedValue4 <- piTimedValue(timestamp = "2017-04-27T17:40:54Z", value = 33)
t1 <- list(timedValue1, timedValue2)
t2 <- list(timedValue3, timedValue4)
s1 <- piStreamValues(webId = webIds[1], items = t1);
s2 <- piStreamValues(webId = webIds[2], items = t2);
values <- list(s1, s2)

response5 <- piWebApiService$streamSet$updateValuesAdHoc(values, "BufferIfPossible", "Replace");

#Request 6 - Get recorded values in bulk
response6 <- piWebApiService$streamSet$getRecordedAdHoc(webId = webIdsList, startTime = "t-6h", endTime = "t")

#Request 7 - Get value from a stream
response7 <- piWebApiService$stream$getValue(webIds[1])

#Request 8 - Update PI Point
createdPoint <- piWebApiService$point$getByPath("\\\\PIFITNESS-SRV2\\SINUSOIDR")
updatePoint <- piPoint()
updatePoint$Descriptor <- "12 Hour Sine Wave for R"
response8 <- piWebApiService$point$update(createdPoint$WebId, updatePoint)

#Request 9 - Delete PI Point
response9 <- piWebApiService$point$delete(createdPoint$WebId)

time <- array(1:4)
time[1] = "t"
time[2] = "t-1d"
time[3] = "t-2d"
time[4] = "t-3d"


#Request 10 - StreamSet getInterpolatedAtTimesAdHoc
response10 <- piWebApiService$streamSet$getInterpolatedAtTimesAdHoc(webId = webIdsList, time = as.list(time))


#Request 11 -Batch
getSinReq <- list(Method = "GET", Resource = "https://cross-platform-lab-uc2017.osisoft.com/piwebapi/points?path=\\\\pifitness-srv2\\sinusoid")
getCdtReq <- list(Method = "GET", Resource = "https://cross-platform-lab-uc2017.osisoft.com/piwebapi/points?path=\\\\pifitness-srv2\\cdt158")
getData <- list(Method = "GET", Resource = "https://cross-platform-lab-uc2017.osisoft.com/piwebapi/streamsets/value?webid={0}&webid={1}")
getData$Parameters <- c("$.sinu.Content.WebId", "$.cdt.Content.WebId")
getData$ParentIds <- c("sinu", "cdt")
batch <- list(sinu = getSinReq, cdt = getCdtReq, data = getData);
response11 <- piWebApiService$batch$execute(batch)
content(response11)



#Request 12 - CreateSecurityEntry
#allowRight <- array(1:2)
#allowRight[1] = "Read"
#allowRight[2] = "ReadData"

#denyRights <- array(1:3)
#denyRights[1] = "Write"
#denyRights[2] = "Execute"
#denyRights[3] = "Admin"

#securityEntry <- piSecurityEntry(securityIdentityName = "SwaggerIdentity", allowRights = as.list(allowRight), denyRights = as.list(denyRights))
#response12 <- piWebApiService$element$createSecurityEntry(elementWebId, securityEntry, TRUE);

#Request 13- GetSecurityEntry
response13 <- piWebApiService$element$getSecurityEntries(elementWebId)


#Request 14- UpdateSecurityEntry
allowRight <- array(1)
allowRight[1] = "Read"


denyRights <- array(1:4)
denyRights[1] = "Write"
denyRights[2] = "Execute"
denyRights[3] = "Admin"
denyRights[4] = "ReadData"
securityEntry <- piSecurityEntry(allowRights = as.list(allowRight), denyRights = as.list(denyRights))
response14 <- piWebApiService$element$updateSecurityEntry("SwaggerIdentity", elementWebId, securityEntry, TRUE)
