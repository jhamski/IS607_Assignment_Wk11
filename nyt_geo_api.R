# HW Week 11 | IS607 Data Acquisition and Management | CUNY MSDA
# Access the New York Times API
 
library(RCurl)
library(jsonlite)
library(XML)
library(magrittr)

key <- scan("geo_key.txt", what="character")

# Example from dev page: 
# Query to return up to 20 geocodes of feature_class P (populated) in the United States with population greater than 50,000 people.
query1 <- paste("http://api.nytimes.com/svc/semantic/v2/geocodes/query.json?feature_class=P&country_code=US&population=50000_&api-key=",key, sep="")

response <- query1 %>% 
  getURL() %>% 
  fromJSON() 

pop50K <- as.data.frame(response[5])
pop50K$results.concept_name
str(pop50K$results.geocode)