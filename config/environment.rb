# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
env_vars = File.join(Rails.root, 'config', 'env_variables.rb')
load(env_vars) if File.exist?(env_vars)
Rails.application.initialize!

