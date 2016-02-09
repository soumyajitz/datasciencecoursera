library(httr)
myApp = oauth_app("twitter",key="XXXX",secret="XXXX")
sig = sign_oauth1.0(myApp,token="XXXX",token_secret = "XXXX")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)
json1 = content(homeTL)
json2 = jsonlite::fromJSON(jsonlite::toJSON(json1))
json2[1,1:4]
