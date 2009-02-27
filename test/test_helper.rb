require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'mocha'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'term_extraction'

class Test::Unit::TestCase
  def read_xml_fixture(name)
    File.read("test/fixtures/#{name}.xml")
  end
end
