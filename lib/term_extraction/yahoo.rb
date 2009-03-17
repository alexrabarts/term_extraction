require 'nokogiri'
require 'addressable/uri'
require 'open-uri'

class TermExtraction
  class Yahoo < TermExtraction
    def terms
      terms = []
      data  = Nokogiri::XML.parse(remote_xml)

      unless data.nil?
        data.search('//s:Result', ns).each do |n|
          terms << n.text
        end
      end

      terms
    end

    def uri
      api_uri = Addressable::URI.parse(gateway)
      api_uri.query_values = {
         'appid'   => @api_key,
         'output'  => 'xml',
         'context' => @context
      }
      api_uri
    end

    class << self
      def canonical_name
        'yahoo'
      end
    end

    private
      def ns
        {'s' => 'urn:yahoo:cate'}
      end

      def gateway
        'http://search.yahooapis.com/ContentAnalysisService/V1/termExtraction'
      end

      def remote_xml
        begin
          open(uri).read
        rescue => e
          $stderr.puts "Couldn't fetch from API: #{e.message}" if $VERBOSE
          nil
        end
      end
  end
end