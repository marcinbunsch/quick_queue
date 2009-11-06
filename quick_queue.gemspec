# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{quick_queue}
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcin Bunsch"]
  s.date = %q{2009-11-06}
  s.email = %q{marcin@applicake.com}
  s.executables = ["qq", "qqc"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/qq",
     "bin/qqc",
     "lib/quick_queue.rb",
     "lib/quick_queue/client.rb",
     "lib/quick_queue/console.rb",
     "lib/quick_queue/server.rb",
     "quick_queue.gemspec",
     "test_server.rb"
  ]
  s.homepage = %q{http://github.com/marcinbunsch/quick_queue}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{quick_queue is a mix of Ruby's Queue and drb to produce an extremely simple to use queue system in pure Ruby.}
  s.test_files = [
    "test/quick_queue_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

