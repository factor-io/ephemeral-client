require 'rest-client'

module Ephemeral
  class Client
    def build(image, repo, command)

      response = RestClient.post('http://ephemeral.io/build',
        {
          image:   image,
          repo:    repo,
          command: command
      })
    end
  end
end