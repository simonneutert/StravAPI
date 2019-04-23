module Auth
  def get_auth_code
    redirect_uri = @redirect_uri
    url_to_strava_api_login = "http://www.strava.com/oauth/authorize?client_id=#{@client_id}&response_type=code&redirect_uri=#{redirect_uri}&approval_prompt=auto&scope=profile:read,write,activity:read,write"

    user_interaction = <<~HERE
      Please Visit this in your Browser:

      #{url_to_strava_api_login}
    HERE
    puts user_interaction

    SystemCalls::WebBrowser.open(url_to_strava_api_login)
  end

  def login
    data = {
      headers: {},
      body: {
        client_id: @client_id,
        client_secret: @client_secret,
        code: @auth_code,
        grant_type: 'authorization_code',
        response_type: 'code',
        redirect_uri: 'http://localhost/exchange_token',
        approval_prompt: 'auto',
        scope: 'profile:write,activity:read,write'
      }
    }
    @response = HTTParty.post('https://www.strava.com/oauth/token', data)
    access_token = @response.fetch('access_token', false)
    if access_token
      @bearer = "Bearer #{access_token}"
      @access_token = access_token
    else
      raise "No Access Token in Reponse! Response: #{@response}"
    end
  end
end
