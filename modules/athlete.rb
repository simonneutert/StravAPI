module Athlete
  def athlete_api_endpoint
    "#{@api_endpoint}/athlete"
  end

  def some_athlete_api_endpoint(athlete_id)
    "#{@api_endpoint}/athletes/#{athlete_id}"
  end

  def get_athlete
    data = {
      headers: {"Authorization" => @bearer}
    }
    @response = HTTParty.get("#{athlete_api_endpoint}", data)
  end

  # :before and :after need to be Epoch Timestamp
  def get_list_of_athlete_activities(page: nil, per_page: 30, before: nil, after: nil)
    data = {
      headers: {"Authorization" => @bearer},
      body: {
        client_id: @client_id,
        client_secret: @client_secret,
        code: @auth_code,
        grant_type: 'authorization_code',
        response_type: 'code',
        approval_prompt: 'auto',
        page: page,
        per_page: per_page,
        before: before,
        after: after
      }
    }
    @response = HTTParty.get("#{athlete_api_endpoint}/activities", data)
  end

  def get_athlete_by(id:)
    data = {
      headers: {"Authorization" => @bearer},
      body: {
      }.merge(@main_body)
    }
    url = "#{some_athlete_api_endpoint(id)}/stats"
    @response = HTTParty.get(url, data)
  end
end
