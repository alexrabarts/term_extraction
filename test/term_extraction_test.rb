require File.dirname(__FILE__) + '/test_helper'

class TermExtractionTest < Test::Unit::TestCase
  should 'return correct terms from Yahoo!' do
    yahoo = TermExtraction::Yahoo.new
    yahoo.stubs(:remote_xml).returns(read_xml_fixture('yahoo'))
    assert_equal yahoo.terms, ['gears of war', 'gears']
  end
  
  should 'return correct terms from Zemanta' do
    zemanta = TermExtraction::Zemanta.new
    zemanta.stubs(:remote_xml).returns(read_xml_fixture('zemanta'))
    assert_equal zemanta.terms, ['Apple', 'IMac', 'Rumor', 'Hardware', 'Nvidia', 'Macintosh', 'Desktops', 'AllInOne']
  end
end