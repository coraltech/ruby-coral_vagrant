
module Vagrant
module Command
module Coral
class Run < Base
      
  #-----------------------------------------------------------------------------
  # Execution
  
  def execute
    options = {}
    success = true
        
    opts = OptionParser.new do |opts|
      opts.banner = "Usage: vagrant cloud run [plan-name]... [-h] ..."
      opts.separator ""          
          
      options[:repo] = 'config'        
      opts.on("-r", "--repo REPO_DIR", "Local directories of repositories (relative to the Vagrantfile root)") do |r|
        options[:repo] = r
      end     
          
      options[:directory] = 'plans'
      opts.on("-d", "--directory DIR", "Local directory that contains the plan(s) being executed") do |d|
        options[:directory] = d
      end         
    end
        
    #---
        
    plans = parse_options(opts)
    return if ! plans
        
    plans.each do |plan_name|
      @logger.debug("Running plan: #{plan_name}")
                   
      success = ::Coral.create_plan(plan_name, {
        :home        => ::Coral.vagrant, 
        :submodule   => options[:repo], 
        :config_file => "#{options[:directory]}/#{plan_name}.json",
        :logger      => @logger,
        :ui          => @env.ui,
      }).run(options)
          
      break unless success
    end
             
    exit success ? 0 : 1
  end
end
end
end
end
