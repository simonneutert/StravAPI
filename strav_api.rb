require 'pry' if ENV['RACK_ENV'] == 'development'
require 'httparty'
require 'dotenv/load'

require_relative './modules/api_debugger'
require_relative './modules/auth'
require_relative './modules/response'
require_relative './modules/activities'
require_relative './modules/athlete'

class StravApi
  include ApiDebugger
  include Auth
  include Response
  include Activities
  include Athlete

  attr_accessor :client_id, :client_secret, :auth_code, :access_token, :response

  def initialize
    @api_endpoint = 'https://www.strava.com/api/v3'
    @client_id = ENV['CLIENT_ID']
    @client_secret = ENV['CLIENT_SECRET']
    @auth_code = ENV['AUTH_CODE_TOKEN']
    @response = ''
    credentials_valid?
  end

  def credentials_valid?
    unless @client_id && @client_secret && @auth_code
      raise 'No Credentials set in your .env file!'
    end
  end
end
