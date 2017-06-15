module V1
  class Api::V1::DoctorsController < ApplicationController
    caches_action :search,
      expires_in: 30.minutes,
      cache_path: (Proc.new do
        api_v1_doctors_search_url(params[:name])
      end)

    def search
      render json: fetch_doctors
    end

    private
    def fetch_doctors
      uri = doctors_search_uri
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(uri.request_uri)
      request['Cache-Control'] = 'no-cache'
      request['Accept'] = 'application/json'
      http.use_ssl = (uri.scheme == "https")
      response = http.request(request)
      response.body
    end

    def doctors_search_uri
      uri = URI.parse(doctors_search_url)
      uri.query = search_query
      uri
    end

    def search_query
      URI.encode_www_form(
        user_key: BETTER_DOCTOR_USER_KEY,
        limit: 1,
        name: params[:name]
      )
    end

    def doctors_search_url
      BETTER_DOCTOR_BASE_URL + BETTER_DOCTOR_DOCTORS_PATH
    end
  end
end
