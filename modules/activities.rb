module Activities
  def acitivies_api_endpoint
    "#{@api_endpoint}/activities"
  end

  def create_activity_by_type(type, name: "Created with StravAPI", start_date_local: Time.now.to_s, elapsed_time: 0, description: '', distance: 0, trainer: 0, commute: 0, private: true)
    data = {
      headers: {"Authorization" => @bearer},
      body: {
        client_id: @client_id,
        client_secret: @client_secret,
        code: @auth_code,
        grant_type: 'authorization_code',
        response_type: 'code',
        redirect_uri: 'http://localhost/exchange_token',
        approval_prompt: 'auto',
        scope: 'profile:write,activity:write',
        type: type,
        name: name,
        start_date_local: start_date_local,
        elapsed_time: elapsed_time,
        description: description,
        distance: distance,
        trainer: trainer,
        commute: commute
      }
    }
    begin
       @response = HTTParty.post(acitivies_api_endpoint, data)
    rescue => e
      puts "#{e}"
      puts 'Error when calling API.'
    end
  end
end
