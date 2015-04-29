require 'rest-client'
require 'pry'

module Ephemeral
  class Client
    def build(image, repo, command)

      response = RestClient.post('http://ephemeral.io/build',
        {
          image:   image,
          repo:    repo,
          command: command
        }.to_json,
        content_type: :json,
        accept: :json
      )
    end
  end
end