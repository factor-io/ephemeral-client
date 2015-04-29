require 'rest-client'
require 'pry'

module Ephemeral
  class Client
    def build(image, repo, command)

      response = RestClient.post('ephemeral-io.herokuapp.com/api/v1/builds',
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
  end
end