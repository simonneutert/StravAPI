module Athlete
  def athlete_api_endpoint
    "#{@api_endpoint}/athlete"
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
      headers: {"Authorization" => @bearer}
    }
    @response = HTTParty.get("#{athlete_id_endpoint}/#{id}", data)
  end
end
