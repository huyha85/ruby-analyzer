# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "ruby-analyzer"
  gem.homepage = "http://github.com/huyha85/ruby-analyzer"
  gem.license = "MIT"
  gem.summary = %Q{A box of multiple tools to help you analyze and refactor your code.}
  gem.description = %Q{A box of multiple tools to help you analyze and refactor your code. You can analyze for code duplication, or find out methods with top code complexity.}
  gem.email = "hhuy424@gmail.com"
  gem.authors = ["Huy Ha"]
  # dependencies defined in Gemfile
  gem.files = FileList['app/**/*.*', 'config/**/*.rb', 'lib/**/*.rb']
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "ruby-analyzer #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
