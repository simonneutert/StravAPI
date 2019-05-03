module Auth
  def get_auth_code
    url_to_strava_api_login = "https://www.strava.com/oauth/authorize?client_id=#{@client_id}&response_type=code&redirect_uri=#{@redirect_uri}&approval_prompt=force&scope=read_all,write,profile:write,activity:write,profile:read_all,activity:read_all"

    user_interaction = <<~HERE
      Please Visit this in your Browser:

      #{url_to_strava_api_login}
    HERE
    puts user_interaction

    SystemCalls::WebBrowser.open(url_to_strava_api_login)
  end

  def login
    get_auth_code unless @auth_code

    @main_body = {
      client_id: @client_id,
      client_secret: @client_secret,
      code: @auth_code,
      grant_type: 'authorization_code',
      response_type: 'code',
      redirect_uri: 'http://localhost/exchange_token',
      approval_prompt: 'auto',
      scope: 'read_all,write,profile:write,activity:write,profile:read_all,activity:read_all'
    }

    data = {
      headers: {},
      body: {
      }.merge(@main_body)
    }

    @response = HTTParty.post('https://www.strava.com/oauth/token', data)
    access_token = @response.fetch('access_token', false)
    if access_token
      @bearer = "Bearer #{access_token}"
      @access_token = access_token
    else
      raise "No Access Token in Reponse! Response: #{@response}"
    end
    get_athlete
    @user_id = @response["id"]
    return "user_id: #{@user_id}"
  end
end
