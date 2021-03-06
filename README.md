PI Web API Client R package
=========

## Introduction

This is an R package that integrates the PI System with R through PI Web API. It was built with the PI Web API 2017 Swagger definition. With this package, you can retrieve PI data without having to generate the URL for each request. 

## Installation

This R package is not available on CRAN. You should download it directly from this GitHub repository by using the devtools R package. If you don't have it installed, please use the command below:

```r
install.packages("devtools")
```

Then, load the library and install the PI Web API R package with the install_github method: 

```r
library(devtools)
install_github("osimloeff/PI-Web-API-Client-R")
```

If the installation is successful, the command below will load the package:

```r
library(piwebapi)
```

If you want to uninstall this package, use the command below:

```r
remove.packages("piwebapi")
```



## Documentation

All the methods and classes from this R package are described on its documentation, which can be opened by typing on the R console:

```r
help(package="piwebapi") 
```

## Examples

Please refer to the following examples to understand how to use this library: 


### Create an intance of the piwebapi top level object.

```r
useKerberos <- TRUE
username <- "myusername"
password <- "mypassword"
validateSSL <- TRUE
debug <- TRUE
piWebApiService <- piwebapi$new("https://webserver/piwebapi", useKerberos, username, password, validateSSL, debug)
```

If you want to use basic authentication instead of Kerberos, set useKerberos to FALSE.
If you are having issues with your SSL certificate and you want to ignore this error, set validateSSL to FALSE.
If you want to receive a log about each HTTP request, set debug to TRUE.

### Retrieve data from the main PI Web API endpoint

```r
response1 = piWebApiService$home$get()
```

### Retrieving PI data to an R data frame


```r
response15 <- piWebApiService$data$getRecordedValues(path = "pi:\\\\pifitness-srv2\\sinusoid", startTime = "y-2d", endTime = "t")
response16 <- piWebApiService$data$getInterpolatedValues(path = "pi:\\\\pifitness-srv2\\sinusoid", startTime = "y-2d", endTime = "t", interval = "1h")
response17 <- piWebApiService$data$getPlotValues(path = "pi:\\\\pifitness-srv2\\sinusoid", startTime = "y-2d", endTime = "t", intervals = 30)
response18 <- piWebApiService$data$getMultipleRecordedValues(paths = c("pi:\\\\pifitness-srv2\\sinusoid", "pi:\\\\pifitness-srv2\\sinusoidu"), startTime = "y-2d", endTime = "t")
response19 <- piWebApiService$data$getMultipleInterpolatedValues(paths = c("pi:\\\\pifitness-srv2\\sinusoid", "pi:\\\\pifitness-srv2\\sinusoidu"), startTime = "y-2d", endTime = "t", interval = "1h")
response20 <- piWebApiService$data$getMultiplePlotValues(paths = c("pi:\\\\pifitness-srv2\\sinusoid", "pi:\\\\pifitness-srv2\\sinusoidu"), startTime = "y-2d", endTime = "t", intervals = 30)
```

The path from the methods above should start with "pi:" (if your stream is a PI Point) or "af:" (if your stream is an AF attribute).



### Get the PI Data Archive WebId

```r
response2 = piWebApiService$dataServer$getByPath("\\\\piservername", "WebId")
```

### Create a PI Point

```r
newPoint <- piPoint(NULL, NULL, "SINUSOIDR", NULL, "12 Hour Sine Wave", "classic", "Float32", NULL, NULL, NULL, NULL, NULL)
response3 = piWebApiService$dataServer$createPoint("s0TJVKOA0Ws0KihcA8rM1GogUElGSVRORVNTLVNSVjI", newPoint)
```



### Get current values in bulk using the StreamSet/GetValuesAdHoc

```r
response4 = piWebApiService$streamSet$getValuesAdHoc(webIds)
```

### Send values in bulk using the StreamSet/UpdateValuesAdHoc

```r
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


### Update the description from a PI Point


```r
createdPoint <- piWebApiService$point$getByPath("\\\\PIFITNESS-SRV2\\SINUSOIDR")
updatePoint <- piPoint()
updatePoint$Descriptor <- "12 Hour Sine Wave for R"
response8 <- piWebApiService$point$update(createdPoint$WebId, updatePoint)
```


### Delete a PI Point

```r
response9 <- piWebApiService$point$delete(createdPoint$WebId)
```



### Using PI Batch to increase performance

```r
getSinReq <- list(Method = "GET", Resource = "https://cross-platform-lab-uc2017.osisoft.com/piwebapi/points?path=\\\\pifitness-srv2\\sinusoid")
getCdtReq <- list(Method = "GET", Resource = "https://cross-platform-lab-uc2017.osisoft.com/piwebapi/points?path=\\\\pifitness-srv2\\cdt158")
getData <- list(Method = "GET", Resource = "https://cross-platform-lab-uc2017.osisoft.com/piwebapi/streamsets/value?webid={0}&webid={1}")
getData$Parameters <- c("$.sinu.Content.WebId", "$.cdt.Content.WebId")
getData$ParentIds <- c("sinu", "cdt")
batch <- list(sinu = getSinReq, cdt = getCdtReq, data = getData);
response11 <- piWebApiService$batch$execute(batch)
content(response11)
```



### Create a SecurityEntry on an element
```r
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


### Get a SecurityEntry of an element

```r
response13 <- piWebApiService$element$getSecurityEntries(elementWebId)
```


### Update a SecurityEntry of an element

```r
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



## Licensing
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
