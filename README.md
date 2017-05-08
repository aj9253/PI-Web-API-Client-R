PI Web API Swagger client R package
=========

###Introduction

This is an R package that integrates the PI System with R through PI Web API. This package was build with the Swagger definition of PI Web API available on version 2017. 

###Installation

This R package is not available on CRAN yet. Nevertheless, you can download it directly from this GitHub repository using the devtools R package. If you don't have it installed, please use the command below:

```r
install.packages("devtools")
```

Then, load the library and install the R package by download it directly from GitHub: 

```r
library(devtools)
install_github("osimloeff/PI-Web-API-Client-R")
```

If the installation is successfull, the command below will load the package:

```r
library(piwebapi)
```

###Documentation

All the methods and classes are described on the package documentation, which can be opened by typing:

```r
help(package="piwebapi") 
```

###Examples

Please refer to the following examples to understand how to use this library: 

#Create an intance of the piwebapi top level object.

```r
piWebApiService <- piwebapi$new("https://webserver/piwebapi", useKerberos, username, password, validateSSL, debug)
```
#Request 1 - Main PI Web API endpoint

```r
#Request 1 - Main PI Web API endpoint
response1 = piWebApiService$home$get()
```



```r
#Request 2 - Get PI Data Archive
response2 = piWebApiService$dataServer$getByPath("\\\\pifitness-srv2", "name")
```


```r
#Request 3 - Create a PI Point
newPoint <- piPoint(NULL, NULL, "SINUSOIDR", NULL, "12 Hour Sine Wave", "classic", "Float32", NULL, NULL, NULL, NULL, NULL)
response3 = piWebApiService$dataServer$createPoint("s0TJVKOA0Ws0KihcA8rM1GogUElGSVRORVNTLVNSVjI", newPoint)
```

```r
#Request 4 - Get values in bulk
response4 = piWebApiService$streamSet$getValuesAdHoc(webIds)
```



```r
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
```


```r
#Request 6 - Get recorded values in bulk
response6 <- piWebApiService$streamSet$getRecordedAdHoc(webId = webIds, startTime = "t-6h", endTime = "t")
```

```r
#Request 7 - Get value from a stream
response7 <- piWebApiService$stream$getValue(webIds[1])
```

```r
#Request 8 - Update PI Point
createdPoint <- piWebApiService$point$getByPath("\\\\PIFITNESS-SRV2\\SINUSOIDR")
updatePoint <- piPoint()
updatePoint$Descriptor <- "12 Hour Sine Wave for R"
response8 <- piWebApiService$point$update(createdPoint$WebId, updatePoint)
```




```r
#Request 9 - Delete PI Point
response9 <- piWebApiService$point$delete(createdPoint$WebId)
```





```r
#Request 10 - StreamSet getInterpolatedAtTimesAdHoc
time <- c("t", "t-1d", "t-2d", "t-3d")
response10 <- piWebApiService$streamSet$getInterpolatedAtTimesAdHoc(webId = webIds, time = time)
```



```r
#Request 11 -Batch
getSinReq <- list(Method = "GET", Resource = "https://cross-platform-lab-uc2017.osisoft.com/piwebapi/points?path=\\\\pifitness-srv2\\sinusoid")
getCdtReq <- list(Method = "GET", Resource = "https://cross-platform-lab-uc2017.osisoft.com/piwebapi/points?path=\\\\pifitness-srv2\\cdt158")
getData <- list(Method = "GET", Resource = "https://cross-platform-lab-uc2017.osisoft.com/piwebapi/streamsets/value?webid={0}&webid={1}")
getData$Parameters <- c("$.sinu.Content.WebId", "$.cdt.Content.WebId")
getData$ParentIds <- c("sinu", "cdt")
batch <- list(sinu = getSinReq, cdt = getCdtReq, data = getData);
response11 <- piWebApiService$batch$execute(batch)
content(response11)
```



```r
#Request 12 - CreateSecurityEntry
allowRight <- array(1:2)
allowRight[1] = "Read"
allowRight[2] = "ReadData"
denyRights <- array(1:3)
denyRights[1] = "Write"
denyRights[2] = "Execute"
denyRights[3] = "Admin"

securityEntry <- piSecurityEntry(securityIdentityName = "SwaggerIdentity", allowRights = as.list(allowRight), denyRights = as.list(denyRights))
response12 <- piWebApiService$element$createSecurityEntry(elementWebId, securityEntry, TRUE);
```


```r
#Request 13- GetSecurityEntry
response13 <- piWebApiService$element$getSecurityEntries(elementWebId)
```




```r
#Request 14- UpdateSecurityEntry
allowRight <- array(1)
allowRight[1] = "Read"


denyRights <- array(1:4)
denyRights[1] = "Write"
denyRights[2] = "Execute"
denyRights[3] = "Admin"
denyRights[4] = "ReadData"
securityEntry <- piSecurityEntry(allowRights = allowRight, denyRights = denyRights)
response14 <- piWebApiService$element$updateSecurityEntry("SwaggerIdentity", elementWebId, securityEntry, TRUE)
```



```r
response15 <- piWebApiService$data$getRecordedValues(path = "pi:\\\\pifitness-srv2\\sinusoid", startTime = "y-2d", endTime = "t")
```


```r
response16 <- piWebApiService$data$getInterpolatedValues(path = "pi:\\\\pifitness-srv2\\sinusoid", startTime = "y-2d", endTime = "t", interval = "1h")
```

```r
response17 <- piWebApiService$data$getPlotValues(path = "pi:\\\\pifitness-srv2\\sinusoid", startTime = "y-2d", endTime = "t", intervals = 30)
```

```r
response18 <- piWebApiService$data$getMultipleRecordedValues(paths = c("pi:\\\\pifitness-srv2\\sinusoid", "pi:\\\\pifitness-srv2\\sinusoidu"), startTime = "y-2d", endTime = "t")
```

```r
response19 <- piWebApiService$data$getMultipleInterpolatedValues(paths = c("pi:\\\\pifitness-srv2\\sinusoid", "pi:\\\\pifitness-srv2\\sinusoidu"), startTime = "y-2d", endTime = "t", interval = "1h")
```

```r
response20 <- piWebApiService$data$getMultiplePlotValues(paths = c("pi:\\\\pifitness-srv2\\sinusoid", "pi:\\\\pifitness-srv2\\sinusoidu"), startTime = "y-2d", endTime = "t", intervals = 30)
```





##Organization
This repository has the sample application from the blog post published on PI Square:
https://pisquare.osisoft.com/community/developers-club/blog/2015/11/27/using-pi-web-api-on-html5-with-angularjs


##Licensing
Copyright 2017 OSIsoft, LLC.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
   
Please see the file named [LICENSE.md](LICENSE.md).
