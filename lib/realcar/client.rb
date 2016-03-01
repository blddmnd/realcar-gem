require_relative 'connection'
require 'httparty'

module Realcar
  class Client
    include HTTParty
    include Realcar::Connection

    @@api_url = 'http://localhost:3000/api/v1/'
    base_uri @@api_url

    class << self
      attr_accessor :resource_name

      def set_api_url url
        @@api_url = url
        base_uri url
      end
    end

    format :json

    def initialize
      if self.class < Realcar::Client
        self.class.base_uri self.class.superclass.base_uri
      end
    end

    def index options = {}
      response = get "/#{self.class.resource_name}.json", options
      response.values.first
    end

    def collection action, options = {}
      response = get "/#{self.class.resource_name}/#{action.to_s}.json", options
      response.values.first
    end

    def show id, options = {}
      response = get "/#{self.class.resource_name}/#{id}.json", options
      response.values.first
    end

    def member id, action, options = {}
      response = get "/#{self.class.resource_name}/#{id}/#{action.to_s}.json", options
      response.values.first
    end

  end

end
