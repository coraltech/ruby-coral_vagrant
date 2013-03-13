
home = File.dirname(__FILE__)

$:.unshift(home) unless
  $:.include?(home) || $:.include?(File.expand_path(home))
  
#-------------------------------------------------------------------------------
  
require 'rubygems'
require 'optparse'
require 'vagrant'
require 'coral_cloud'
require 'coral_plan'

#---

# Include Vagrant commands
[ :coral_base, 
  :coral_init, 
  :coral_update, 
  :coral_push, 
  :coral_run, 
].each do |name| 
  require File.join('coral_vagrant', 'commands', name.to_s + '.rb') 
end

#*******************************************************************************
# Coral Vagrant Library
#
# This provides a data model and commands that interface with Vagrant.
#
# Author::    Adrian Webb (mailto:adrian.webb@coraltech.net)
# License::   GPLv3
module Coral
    
  #-----------------------------------------------------------------------------
  # Constructor / Destructor
  
  def self.init_vagrant(directory, submodule = 'config', config_file = 'cloud.json')
    return Coral::Vagrant.init(directory, submodule, config_file)
  end
      
  #-----------------------------------------------------------------------------
  # Accessors / Modifiers
  
  def self.vagrant
    return Coral::Vagrant.get
  end 

#*******************************************************************************

module Vagrant
  
  VERSION = File.read(File.join(File.dirname(__FILE__), '..', 'VERSION'))
  
  #-----------------------------------------------------------------------------
  # Constructor / Destructor

  def self.init(directory, submodule = 'config', config_file = 'cloud.json')
    return Coral.create_cloud(:vagrant, {
      :directory   => directory, 
      :submodule   => submodule,
      :config_file => config_file,
    })
  end
  
  #-----------------------------------------------------------------------------
  # Accessors / Modifiers
  
  def self.get
    return Coral.cloud(:vagrant)  
  end 
end
end