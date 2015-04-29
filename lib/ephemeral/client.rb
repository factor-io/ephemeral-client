require 'rest-client'
require 'uri'
require 'json'

module Ephemeral
  class Client
    BASE = 'http://api.ehpemeral.io/'

    def build(image, repo, command)

      response = RestClient.post('api.ehpemeral.io/v1/builds',
        {
          image:   image,
          repo:    repo,
          build_type: command
        }.to_json,
        content_type: :json,
        accept: :json
      )

      parsed_response = JSON.parse(response)
    end

    private

    def post(resource, options)
      uri = gen_uri(resource)

      response = RestClient.post(uri, options)

      content = JSON.parse(response)
    end

    def gen_uri(resource)
      uri = URI.parse(BASE)
      uri.path = "/v1/#{resource}"
      uri.to_s
    end
  end
end