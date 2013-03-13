
module Vagrant
module Command
module Coral
class Init < Base
      
  #-----------------------------------------------------------------------------
  # Execution
  
  def execute
    options = {}
    success = true
        
    opts = OptionParser.new do |opts|
      opts.banner = "Usage: vagrant coral init [server-name]... [-h] ..."
      opts.separator ""
        
      opts.on("-d", "--destroy", "Remove existing servers and start from scratch") do |d|
        options[:destroy] = d
      end         
        
      opts.on("-f", "--force", "Destroy without confirmation") do |f|
        options[:force] = f
      end
        
      #---
         
      options[:min] = 1
      opts.on("-m", "--min TRIES", "Minimum number of provision runs") do |m|
        options[:min] = m
      end     
          
      options[:tries] = 5
      opts.on("-t", "--tries TRIES", "Number of provision attempts before stopping with an error") do |t|
        options[:tries] = t
      end
          
      options[:exit] = ''
      opts.on("-e", "--exit CONDITIONS", "Conditions on which to exit in the format (separated by comma): 'User[git]:ensure:created'") do |e|
        options[:exit] = e
      end
        
      options[:repos] = ''        
      opts.on("-r", "--repos REPO_DIRS,...'", "Local directories of repositories to syncronize remotes (relative to the Vagrantfile root)") do |r|
        options[:repos] = r
      end
    end
        
    options[:min]  = 1
    options[:auth] = true
        
    #---
        
    servers = parse_options(opts)
    return if ! servers
        
    with_target_vms(servers) do |vm|
      @env.ui.info("Starting initialization run for: #{vm.name}")
          
      server = ::Coral::Cloud::Server.new({
        :cloud   => ::Coral.vagrant,
        :machine => vm,
        :logger  => @logger,
        :ui      => @env.ui,
      })
          
      if options[:destroy]
        success = server.destroy(options) if success
      end          
      success = server.start(options) if success
      success = server.update(options) if success
    end        
    exit success ? 0 : 1
  end
end
end
end
end
