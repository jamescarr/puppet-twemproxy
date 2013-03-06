dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift File.join(dir, 'lib')

require 'puppet'
require 'rspec-puppet'

RSpec.configure do |c|
  c.module_path = File.expand_path(File.join(__FILE__, '..', 'fixtures', 'modules'))
  c.manifest_dir = File.expand_path(File.join(__FILE__, '..', 'fixtures', 'manifests'))
end
