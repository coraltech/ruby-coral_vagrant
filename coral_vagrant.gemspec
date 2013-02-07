# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "coral_vagrant"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adrian Webb"]
  s.date = "2013-02-07"
  s.description = "= coral_vagrant\n\nThis library contains various commands and exposes a data model to Vagrant\nthat allows for tightly integrated management of Virtual machines that are\nlinked to remote servers.  \n\nThis also allows for custom execution plans.\n\nNote:  This library is still very early in development!\n\n== Contributing to coral_vagrant\n \n* Check out the latest master to make sure the feature hasn't been implemented \n  or the bug hasn't been fixed yet.\n* Check out the issue tracker to make sure someone already hasn't requested \n  it and/or contributed it.\n* Fork the project.\n* Start a feature/bugfix branch.\n* Commit and push until you are happy with your contribution.\n* Make sure to add tests for it. This is important so I don't break it in a \n  future version unintentionally.\n* Please try not to mess with the Rakefile, version, or history. If you want \n  to have your own version, or is otherwise necessary, that is fine, but \n  please isolate to its own commit so I can cherry-pick around it.\n\n== Copyright\n\nLicensed under GPLv3.  See LICENSE.txt for further details.\n\nCopyright (c) 2013  Adrian Webb <adrian.webb@coraltech.net>\nCoral Technology Group LLC"
  s.email = "adrian.webb@coraltech.net"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "Vagrantfile",
    "lib/coral_vagrant.rb",
    "lib/coral_vagrant/commands/coral_base.rb",
    "lib/coral_vagrant/commands/coral_init.rb",
    "lib/coral_vagrant/commands/coral_push.rb",
    "lib/coral_vagrant/commands/coral_run.rb",
    "lib/coral_vagrant/commands/coral_update.rb"
  ]
  s.homepage = "http://github.com/coraltech/ruby-coral_vagrant"
  s.licenses = ["GPLv3"]
  s.rdoc_options = ["--title", "Coral Vagrant library", "--main", "README.rdoc", "--line-numbers"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.1")
  s.rubyforge_project = "coral_vagrant"
  s.rubygems_version = "1.8.15"
  s.summary = "Provides a data model and various Coral commands for Vagrant"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<vagrant>, ["~> 1.0"])
      s.add_runtime_dependency(%q<coral_plan>, ["~> 0.1"])
      s.add_runtime_dependency(%q<coral_cloud>, ["~> 0.1"])
      s.add_development_dependency(%q<bundler>, ["~> 1.2"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_development_dependency(%q<rspec>, ["~> 2.10"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<yard>, ["~> 0.8"])
    else
      s.add_dependency(%q<vagrant>, ["~> 1.0"])
      s.add_dependency(%q<coral_plan>, ["~> 0.1"])
      s.add_dependency(%q<coral_cloud>, ["~> 0.1"])
      s.add_dependency(%q<bundler>, ["~> 1.2"])
      s.add_dependency(%q<jeweler>, ["~> 1.8"])
      s.add_dependency(%q<rspec>, ["~> 2.10"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<yard>, ["~> 0.8"])
    end
  else
    s.add_dependency(%q<vagrant>, ["~> 1.0"])
    s.add_dependency(%q<coral_plan>, ["~> 0.1"])
    s.add_dependency(%q<coral_cloud>, ["~> 0.1"])
    s.add_dependency(%q<bundler>, ["~> 1.2"])
    s.add_dependency(%q<jeweler>, ["~> 1.8"])
    s.add_dependency(%q<rspec>, ["~> 2.10"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<yard>, ["~> 0.8"])
  end
end

