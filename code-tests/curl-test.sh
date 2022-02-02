#!/usr/bin/env bash

#!/usr/bin/env bash

if [[ "$#" -ne 1 ]]; then
    echo provide an url.
    exit 1
fi
echo ------------------------------------
#hostUrl="http://localhost:7071/api/httpTrigger"
hostUrl="$1"
Points=0
calculateExpectTrue() {
    Tests=$((Tests + 1))
    if [[ $(curl -s "$hostUrl?a=$1&b=$2") == $3 ]]; then
        Points=$((Points + 1))
    else
        echo calculateExpectTrue: error with vals: $1 $2 $3
        local message=$(curl -s "$hostUrl?a=$1&b=$2")
        local statusCode=$(curl -s -o /dev/null -w "%{http_code}" "$hostUrl?a=$1&b=$2")
        echo expected: $3 actual: $message statuscode: $statusCode
    fi
}
ExpectStatusCode() {
    local statusCode=$(curl -s -o /dev/null -w "%{http_code}" "$hostUrl?$1")
    Tests=$((Tests + 1))
    if [[ "$statusCode" == "$2" ]]; then
        Points=$((Points + 1))
    else
        echo ExpectStatusCode error with val: $1
        echo expected statuscode "$2" actual $statusCode
        echo Message:
        curl "$hostUrl?'$1'"
    fi
}
calculateExpect400() {
    local statusCode=$(curl -s -o /dev/null -w "%{http_code}" "$hostUrl?a=$1&b=$2")
    Tests=$((Tests + 1))
    if [[ "$statusCode" == "400" ]]; then
        Points=$((Points + 1))
    else
        echo Expect400 error with val: $1 $2
        echo expected statuscode 400 actual $statusCode
        echo Message:
        echo $(curl -isb "$hostUrl?a=$1&b=$2")
    fi
}
calculateExpectTrue 1 2 3
calculateExpectTrue 1. 2. 3
calculateExpectTrue 1.0 2.00 3.00
calculateExpectTrue 0.1 -2 -1.9
calculateExpectTrue 0.1 -1000 -999.9
calculateExpect400 "100000000000000000000000000000000000000000000000000000000000000000000000000" "1"
calculateExpect400 ".1" ".2"
calculateExpect400 "'" "'"
calculateExpect400 "\"" "\""
calculateExpect400 "🚀" "🚀"
ExpectStatusCode "\[" "400"
ExpectStatusCode "'" "400"
ExpectStatusCode "\"" "400"
ExpectStatusCode "\{" "400"
ExpectStatusCode "$" "400"
ExpectStatusCode "a=1&b=2" "200"

echo $Points/$Tests
if [[ "$Points" -ne $Tests ]]; then
    exit 1
fi
# echo $http_code
# curl -X POST -d 'name=robin' $hostUrl
### simple post

# # curl -X POST -d 'name=robin&alias=bob' $hostUrl
# curl -X POST -d 'name=robin' -d 'alias=bobby' $hostUrl?try=ett
# ### post request
# echo
