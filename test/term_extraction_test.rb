require File.dirname(__FILE__) + '/test_helper'

class TermExtractionTest < Test::Unit::TestCase
  should 'return correct terms from Yahoo!' do
    yahoo = TermExtraction::Yahoo.new
    fake_uri(:get, yahoo.uri, 'yahoo.xml')
    assert_equal yahoo.terms, correct_yahoo_terms
  end
  
  should 'return correct terms from Zemanta' do
    zemanta = TermExtraction::Zemanta.new
    fake_uri(:post, zemanta.uri, 'zemanta.xml')
    assert_equal zemanta.terms, correct_zemanta_terms
  end

  should 'be able to set the context after initialization' do
    yahoo         = TermExtraction::Yahoo.new
    context       = 'foo'
    yahoo.context = context
    assert_equal yahoo.context, context
  end

  should 'be able to set the api key after initialization' do
    zemanta         = TermExtraction::Zemanta.new
    context         = 'bar'
    zemanta.context = context
    assert_equal zemanta.context, context
  end

  should 'return different response on subsequent calls when different data is returned from Yahoo!' do
    yahoo = TermExtraction::Yahoo.new
    fake_uri(:get, yahoo.uri, 'yahoo.xml')
    original_terms = yahoo.terms
    fake_uri(:get, yahoo.uri, 'yahoo2.xml')
    assert_not_equal original_terms, yahoo.terms
  end

  should 'return different response on subsequent calls when different data is returned from Zemanta' do
    zemanta = TermExtraction::Zemanta.new
    fake_uri(:post, zemanta.uri, 'zemanta.xml')
    original_terms = zemanta.terms
    fake_uri(:post, zemanta.uri, 'zemanta2.xml')
    assert_not_equal original_terms, zemanta.terms
  end

  context 'Yahoo!' do
    should 'be able to handle a context with "%" in it' do
      yahoo = TermExtraction::Yahoo.new(:context => '%')
      fake_uri(:get, yahoo.uri, 'yahoo.xml')
      assert_nothing_thrown{ yahoo.terms }
    end
  end

  private
    def correct_yahoo_terms
      ['gears of war', 'gears']
    end

    def correct_zemanta_terms
      ['Apple', 'IMac', 'Rumor', 'Hardware', 'Nvidia', 'Macintosh', 'Desktops', 'AllInOne']
    end
end