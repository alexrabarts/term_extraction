# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{term_extraction}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["alex"]
  s.date = %q{2009-03-05}
  s.description = %q{Term extraction library}
  s.email = %q{alexrabarts@gmail.com}
  s.files = ["VERSION.yml", "lib/term_extraction", "lib/term_extraction/yahoo.rb", "lib/term_extraction/zemanta.rb", "lib/term_extraction.rb", "test/fixtures", "test/fixtures/yahoo.xml", "test/fixtures/zemanta.xml", "test/term_extraction_test.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/alexrabarts/term_extraction}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Provides access to term extraction APIs such as Yahoo! Term Extraction API and Zemanta.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.0.7"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.0.7"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.0.7"])
  end
end
