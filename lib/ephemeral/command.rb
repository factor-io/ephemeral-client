# encoding: UTF-8

require 'thor'

module Ephemeral
  class Command < Thor
    desc 'exec NAME', 'Say Hello'
    def exec(name)
      puts "Hello: #{name}"
    end
  end

end

Ephemeral::Command.start(ARGV)