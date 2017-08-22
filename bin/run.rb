require_relative '../config/environment'
require 'pry'

ActiveRecord::Base.logger = nil

new_cli = CommandLineInterface.new

new_cli.run
