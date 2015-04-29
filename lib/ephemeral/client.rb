require 'rest-client'
require 'uri'
require 'json'
require 'pry'

module Ephemeral
  class Client
    BASE = 'http://api.ephemeral.io/'

    def build(image, repo, build_type)
      resource = "builds"

      post(resource, {
        image: image,
        repo: repo,
        build_type: build_type
        })
    end

    private

    def post(resource, options)
      uri = gen_uri(resource)
      response = RestClient.post(uri, options)
      content = JSON.parse(response)
    end

    def gen_uri(resource)
      uri = URI.parse(BASE)
      uri.path = "/api/v1/#{resource}"
      uri.to_s
    end
  end
end