require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'
require 'fake_web'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'term_extraction'

class Test::Unit::TestCase
  def fake_uri(method, uri, fixture)
    FakeWeb.clean_registry
    FakeWeb.allow_net_connect = false
    response = File.open(File.join(File.dirname(__FILE__), 'fixtures', fixture)).read
    FakeWeb.register_uri(method, uri.to_s, :string => response)
  end

  def teardown
    FakeWeb.allow_net_connect = true
    FakeWeb.clean_registry
  end
end
