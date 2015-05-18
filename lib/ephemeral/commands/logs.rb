require 'rainbow'
require 'ephemeral/client'

module Ephemeral
  module Commands

    class Logs

      def logs(args, options)
        client = Ephemeral::Client.new
        id     = args[0]
        fail 'Ephemeral build id is required' unless id

        response = client.getLogs(id)
        success "Retrieved logs for build #{id}:\n#{response}"
      end

      private
      
      def fail(message)
        abort(Rainbow("Error: #{message}").red)
      end

      def success(message)
        puts Rainbow(message).green
      end
    end
  end
end