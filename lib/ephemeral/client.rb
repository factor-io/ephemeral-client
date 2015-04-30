require 'rest-client'
require 'uri'
require 'json'

module Ephemeral

  # The primary client library for the Ephemeral.io service
  class Client
    BASE = 'http://api.ephemeral.io/'

    # Starts a build on the Ephemeryl service
    # @param image [String] The Docker image from https://github.com/docker-library/docs
    # @param repo [String] The URL containing the source to build
    # @param build_type [String] The framework to use (e.g. `jekyll`, `middleman`)
    # @return [Hash] The hash containing basic information about the build (e.g. id)
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
      content
    end

    def gen_uri(resource)
      uri = URI.parse(BASE)
      uri.path = "/v1/#{resource}"
      uri.to_s
    end
  end
end