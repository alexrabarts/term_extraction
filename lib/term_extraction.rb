class TermExtraction
  attr_accessor :context, :api_key

  def initialize(options={})
    @context = options[:context]
    @api_key = options[:api_key]
  end

  def canonical_name
    self.class.canonical_name
  end
end

%w{yahoo zemanta}.each{|t| require "term_extraction/#{t}"}