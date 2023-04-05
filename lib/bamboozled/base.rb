module Bamboozled
  class Base
    attr_reader :request

    def initialize(subdomain: nil, api_key: nil, httparty_options: {}, api_url: nil)
      @subdomain, @api_key = subdomain
      @api_key = api_key
      @httparty_options = httparty_options
      @api_url = api_url
    end

    def employee
      @employee ||= Bamboozled::API::Employee.new(@subdomain, @api_key, @httparty_options, @api_url)
    end

    def report
      @report ||= Bamboozled::API::Report.new(@subdomain, @api_key, @httparty_options, @api_url)
    end

    def meta
      @meta ||= Bamboozled::API::Meta.new(@subdomain, @api_key, @httparty_options, @api_url)
    end

    def time_off
      @time_off ||= Bamboozled::API::TimeOff.new(@subdomain, @api_key, @httparty_options, @api_url)
    end

    def time_tracking
      @time_tracking ||= Bamboozled::API::TimeTracking.new(@subdomain, @api_key, @httparty_options, @api_url)
    end

    def applicant_tracking
      @applicant_tracking ||= Bamboozled::API::ApplicantTracking.new(@subdomain, @api_key, @httparty_options, @api_url)
    end
  end
end
