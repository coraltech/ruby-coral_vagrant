
module Vagrant
module Command
module Coral
class Update < Base
      
  #-----------------------------------------------------------------------------
  # Execution
  
  def execute
    options = {}
    success = true
        
    opts = OptionParser.new do |opts|
      opts.banner = "Usage: vagrant coral update [server-name]... [-h] ..."
      opts.separator ""
          
      options[:min] = 1
      opts.on("-m", "--min TRIES", "Minimum number of provision runs") do |m|
        options[:min] = m
      end
          
      options[:tries] = 5        
      opts.on("-t", "--tries TRIES", "Number of provision attempts before stopping with an error.") do |t|
        options[:tries] = t
      end
          
      options[:exit] = ''
      opts.on("-e", "--exit CONDITIONS", "Conditions on which to exit in the format (separated by comma): 'User[git]:ensure:created'") do |e|
        options[:exit] = e
      end
        
      options[:repos] = ''        
      opts.on("-r", "--repos REPO_DIRS,...'", "Local directories of repositories to push (relative to the Vagrantfile root)") do |r|
        options[:repos] = r
      end
    end
        
    options[:auth] = true

    #---
        
    servers = parse_options(opts)
    return if ! servers       
        
    with_target_vms(servers) do |vm|
      @env.ui.info("Starting update run for: #{vm.name}")
          
      success = ::Coral::Cloud::Server.new({
        :cloud   => ::Coral.vagrant,
        :machine => vm,
        :logger  => @logger,
        :ui      => @env.ui,
      }).update(options) if success
    end        
    exit success ? 0 : 1
  end
end
end
end
end
