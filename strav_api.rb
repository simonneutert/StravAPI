require 'pry' unless ENV['RACK_ENV'] == 'production'
require 'httparty'
require 'dotenv/load'

Dir["./system_calls/*.rb"].each {|file| require file }
Dir["./modules/*.rb"].each {|file| require file }

class StravApi
  include ApiDebugger
  include Auth
  include Response
  include Activities
  include Athlete

  attr_accessor :client_id, :client_secret, :auth_code, :access_token, :response
  attr_reader :user_id

  def initialize
    @api_endpoint = 'https://www.strava.com/api/v3'
    @redirect_uri = 'http://localhost:9292/exchange_token'
    @client_id = ENV['STRAVA_CLIENT_ID']
    @client_secret = ENV['STRAVA_CLIENT_SECRET']
    @auth_code = ENV['STRAVA_AUTH_CODE_TOKEN']
    @response = ''
    # credentials_valid?
  end

  def credentials_valid?
    unless @client_id && @client_secret && @auth_code
      raise 'No Credentials set in your .env file!'
    end
  end
end
