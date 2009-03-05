require 'net/http'
require 'nokogiri'

class TermExtraction
  class Zemanta < TermExtraction
    def terms
      terms = []
      data  = Nokogiri::XML.parse(remote_xml)

      data.search('//name').each do |n|
        terms << n.text
      end

      terms
    end

    class << self
      def canonical_name
        'zemanta'
      end
    end

    private
      def gateway
        'http://api.zemanta.com/services/rest/0.0/'
      end

      def url
        URI.parse(gateway)
      end

      def post_params
        {
          'method'        =>'zemanta.suggest',
          'api_key'       => @api_key,
          'return_images' => 0,
          'text'          => @context,
          'format'        => 'xml'
        }
      end

      def remote_xml
        Net::HTTP.post_form(url, post_params).body
      end
  end
end
