# Managed by modulesync - DO NOT EDIT
# https://voxpupuli.org/docs/updating-files-managed-with-modulesync/

RSpec.configure do |c|
  c.mock_with :mocha
end

# puppetlabs_spec_helper will set up coverage if the env variable is set.
# We want to do this if lib exists and it hasn't been explicitly set.
ENV['COVERAGE'] ||= 'yes' if Dir.exist?(File.expand_path('../../lib', __FILE__))

require 'voxpupuli/test/spec_helper'

if File.exist?(File.join(__dir__, 'default_module_facts.yml'))
  facts = YAML.safe_load(File.read(File.join(__dir__, 'default_module_facts.yml')))
  if facts
    facts.each do |name, value|
      add_custom_fact name.to_sym, value
    end
  end
end

require 'support/acceptance/supported_versions'
require 'spec_helper_methods'
