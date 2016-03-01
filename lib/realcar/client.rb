require_relative 'connection'
require 'httparty'

module Realcar
  class Client
    include HTTParty
    include Realcar::Connection

    base_uri 'http://localhost:3000/api/v1/'
    format :json

    class << self
      attr_accessor :resource_name

      def api_url= url
        base_uri url
      end
    end

    def initialize *args
      raise "Cannot directly instantiate an #{self.class}" if self.class == Client
      self.class.base_uri self.class.superclass.base_uri
      super
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
