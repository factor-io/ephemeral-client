require 'rainbow'
require 'ephemeral/client'

module Ephemeral
  module Commands
    
    # The Commander command to start the build command
    class Build

      # This starts the build. Don't use this directly, this is for use by Commander CLI
      # @param args [Array[String]] Should be an array of strings with the source, but length must be 1
      # @param [Commander::Command::Options.new] Required command line options for framework and buildpack
      # @return [Boolean] always returns true
      def build(args, options)
        client    = Ephemeral::Client.new
        source    = args[0]
        fail 'Source URL is required' unless source
        fail '--framework is required' unless options.framework
        fail '--buildpack is required' unless options.buildpack

        info 'Starting build, this may take a moment...'
        response = client.build(options.buildpack,source,options.framework)
        success "Build started with id: #{response['id']}"
      end

      private 

      def fail(message)
        abort(Rainbow("Error: #{message}").red)
      end

      def success(message)
        puts Rainbow(message).green
      end

      def info(message)
        puts Rainbow(message).bright
      end
    end
  end
end
