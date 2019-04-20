module Athlete
  def athlete_api_endpoint
    "#{@api_endpoint}/athlete"
  end

  def get_athlete
    @response = HTTParty.get("#{athlete_api_endpoint}", headers: {"Authorization" => @bearer})
  end

  def get_athlete_by(id:)
    athlete_id_endpoint = "#{athlete_api_endpoint}/#{id}"
    @response = HTTParty.get(athlete_id_endpoint, headers: {"Authorization" => @bearer})
  end
end
