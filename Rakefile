require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "term_extraction"
    s.summary = %Q{
      Provides access to term extraction APIs such as Yahoo! Term Extraction API and
      Zemanta.
    }
    s.email = "alexrabarts@gmail.com"
    s.homepage = "http://github.com/alexrabarts/term_extraction"
    s.description = "Term extraction library"
    s.authors = ["alex"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test
