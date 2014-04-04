require_relative 'spec_helper'
require 'template'
require 'json'

require 'pipely/shared_examples'

describe Template do

  CONFIG = File.join(File.dirname(__FILE__), '..', 'config', 'config.yml')

  it_behaves_like "a renderable template", 'staging', CONFIG
  it_behaves_like "a renderable template", 'production', CONFIG

end
