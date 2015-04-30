# encoding: UTF-8

require 'commander/import'
require 'ephemeral/version'
require 'ephemeral/commands/build'

program :name, 'Ephemeral Client'
program :version, Ephemeral::VERSION
program :description, 'Eph (eph) is a command line tool to run builds on the Ephemeral.io service'

command 'build' do |c|
  c.syntax = 'eph source_url [--buildpack ...] [--framework ...]'
  c.option '--buildpack STRING', String, 'The name of the buildpace to use from https://registry.hub.docker.com/_/buildpack-deps/'
  c.option '--framework STRING', String, 'The framework to use for building the service (e.g. middleman, jekyll)'
  c.description = 'Builds the code hosted on source using the builder framework on the runtime specified'
  c.when_called Ephemeral::Commands::Build, :build
end