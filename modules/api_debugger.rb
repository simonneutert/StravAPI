module ApiDebugger
  def debug_response
    if @response
      puts 'Response Body'
      puts response.body
      puts ''
      puts 'Response Code'
      response.code
      puts ''
      puts 'Response Message'
      response.message
      puts ''
      puts 'Response Headers'
      response.headers.inspect
    else
      'No response received, yet! Heads up, sport!'
    end
  end
end
