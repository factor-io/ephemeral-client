# encoding: UTF-8

require 'spec_helper'
require 'ephemeral/commands/build'
require 'ephemeral/commands/logs'
require 'commander'
require 'securerandom'

describe Ephemeral::Commands do
  describe Ephemeral::Commands::Build do
    it 'can run command' do
      args = ["https://github.com/skierkowski/hello-middleman"]
      options = Commander::Command::Options.new
      options.buildpack = 'ruby:2.1'
      options.framework = 'middleman'
      build_command = Ephemeral::Commands::Build.new
      expect{build_command.build(args,options)}.to output(/Starting build/).to_stdout
    end

    it 'fails without all params' do
      args = ["https://github.com/skierkowski/hello-middleman"]
      options = Commander::Command::Options.new
      options.buildpack = 'ruby:2.1'
      build_command = Ephemeral::Commands::Build.new
      expect{
        build_command.build(args,options)
      }.to output(/framework is required/).to_stderr.and raise_error(SystemExit)
    end
  end

  describe Ephemeral::Commands::Logs do

    it 'can run command' do
      args         = ["testid1234"]
      options      = Commander::Command::Options.new
      logs_command = Ephemeral::Commands::Logs.new
      expect{logs_command.logs(args,options)}.to output(/Retrieving logs/).to_stdout. and raise_error(RestClient::InternalServerError)
    end

    it 'fails without all params' do
      args         = []
      options      = Commander::Command::Options.new
      logs_command = Ephemeral::Commands::Logs.new
      expect{
        logs_command.logs(args,options)
      }.to output(/id is required/).to_stderr.and raise_error(SystemExit)
    end
  end
end