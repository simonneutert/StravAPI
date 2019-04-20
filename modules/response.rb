module Response
  def to_json
    JSON.parse(@response.to_s, symbolize_names: true)
  end
end
