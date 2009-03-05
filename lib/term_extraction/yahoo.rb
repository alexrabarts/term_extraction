require 'nokogiri'

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

      def url
        uri = Addressable::URI.parse(gateway)
        uri.query_values = {
           # TODO: Change appid to the BMP one
           'appid'   => @api_key,
           'output'  => 'xml',
           'context' => @context
        }
        uri
      end

      def remote_xml
        open(url).read
      end
  end
end