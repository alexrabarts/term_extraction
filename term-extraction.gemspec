# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = 'term-extraction'
  s.version = File.read('VERSION').strip
  s.authors = ["Alex Rabarts"]
  s.description = "Provides access to term extraction APIs such as Yahoo! Term Extraction API and
      Zemanta."
  s.summary = "Provides access to term extraction APIs such as Yahoo! Term Extraction API and Zemanta."
  s.homepage = %q{http://github.com/alexrabarts/term_extraction}
  s.email = 'alexrabarts@gmail.com'
  s.extra_rdoc_files = ['README.rdoc']
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.rdoc_options = ['--charset=UTF-8']
  s.require_paths = ['lib']

  ['bundler', 'shoulda', 'mocha'].each do |gem|
    s.add_development_dependency *gem.split(' ')
  end

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency('rake', ['>= 0'])
      s.add_runtime_dependency('rdoc', ['>= 0'])
      s.add_runtime_dependency('nokogiri', ['>= 1.0.7'])
      s.add_runtime_dependency('addressable', ['>= 0'])
    else
      s.add_dependency('rake', ['>= 0'])
      s.add_dependency('rdoc', ['>= 0'])
      s.add_dependency('nokogiri', ['>= 1.0.7'])
      s.add_dependency('addressable', ['>= 0'])
    end
  else
    s.add_dependency('rake', ['>= 0'])
    s.add_dependency('rdoc', ['>= 0'])
    s.add_dependency('nokogiri', ['>= 1.0.7'])
    s.add_dependency('addressable', ['>= 0'])
  end
end
