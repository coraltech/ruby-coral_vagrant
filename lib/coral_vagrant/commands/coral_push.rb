
module Vagrant
module Command
module Coral
class Push < Base
      
  #-----------------------------------------------------------------------------
  # Execution

  def execute
    options = {}
    success = true
        
    opts = OptionParser.new do |opts|
      opts.banner = "Usage: vagrant coral push [server-name]... [-h] ..."
      opts.separator ""
       
      opts.on("-c", "--commit", "Commit any uncommitted changes before pushing to remotes") do |c|
        options[:commit] = c
      end
        
      opts.on("-e", "--allow_empty", "Allow commits with no changes") do |e|
        options[:allow_empty] = e
      end
        
      opts.on("-t", "--tags", "Push all local tags with selected branch") do |t|
        options[:tags] = t
      end
        
      #---
        
      options[:message] = ''
      opts.on("-m", "--message MESSAGE", "Commit message") do |m|
        options[:message] = m
      end
        
      options[:author] = ''        
      opts.on("-a", "--author AUTHOR", "Author of the changes being committed if different from the committer") do |a|
        options[:author] = a
      end
        
      options[:branch] = ''        
      opts.on("-b", "--branch BRANCH", "Local branch of the remotes to push") do |b|
        options[:branch] = b
      end
          
      options[:repos] = ''        
      opts.on("-r", "--repos REPO_DIRS,...", "Local directories of repositories to push (relative to the Vagrantfile root)") do |r|
        options[:repos] = r
      end
    end
        
    options[:auth] = true
        
    #---
        
    remotes = parse_options(opts)
    return if ! remotes
        
    if remotes.empty?
      remotes = [ 'all' ]
    end
                
    remotes.each do |remote_name|
      @env.ui.info("Starting push for: #{remote_name}")
          
      server = ::Coral::Cloud::Server.new({
        :cloud   => ::Coral.vagrant,
        :machine => remote_name,
        :logger  => @logger,
        :ui      => @env.ui,
      })
          
      if options[:commit]
        success = server.commit(options) if success
      end
      success = server.push(options) if success
    end
    exit success ? 0 : 1 
  end
end
end
end
end
