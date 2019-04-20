# StravApi

1. [Create a Strava Developer API Account / App](https://developers.strava.com/)
2. have Ruby 2.5.x installed and run a `$ bundle install`
3. create a clean `.env` file in the root of this project and set your strava credentials there
4. run `$ irb -r ./strav_api.rb`

### Example 
run `$ irb -r ./strav_api.rb`

``` ruby
strava = StravApi.new
strava.login
strave.get_athlete
```  

## What helped me in taked baby steps towards this projects

Official Strava Api Docs  
http://developers.strava.com/docs/reference/#api-Activities-createActivity

This blog post from Yi Zeng  
https://yizeng.me/2017/01/11/get-a-strava-api-access-token-with-write-permission/
