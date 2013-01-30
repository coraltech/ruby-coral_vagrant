
module Vagrant
module Command
module Coral
class Base < Base
    
  #-----------------------------------------------------------------------------
  # Constructor / Destructor

  def initialize(argv, env)
    super

    @main_args, @sub_command, @sub_args = split_main_and_subcommand(argv)

    @subcommands = Registry.new
    @subcommands.register(:init) { Vagrant::Command::Coral::Init }
    @subcommands.register(:update) { Vagrant::Command::Coral::Update }
    @subcommands.register(:push) { Vagrant::Command::Coral::Push }
    @subcommands.register(:run) { Vagrant::Command::Coral::Run }
  end
    
  #-----------------------------------------------------------------------------
  # Help

  def help
    opts = OptionParser.new do |opts|
      opts.banner = "Usage: vagrant coral <command> [<args>]"
      opts.separator ""
      opts.separator "Available subcommands:"

      # Add the available subcommands as separators in order to print them
      # out as well.
      keys = []
      @subcommands.each { |key, value| keys << key.to_s }

      keys.sort.each do |key|
        opts.separator "     #{key}"
      end

      opts.separator ""
      opts.separator "For help on any individual command run `vagrant coral COMMAND -h`"
    end

    @env.ui.info(opts.help, :prefix => false)
  end
      
  #-----------------------------------------------------------------------------
  # Execution

  def execute
    if @main_args.include?("-h") || @main_args.include?("--help")
      # Print the help for all the cluster commands.
      return help
    end

    # If we reached this far then we must have a subcommand. If not,
    # then we also just print the help and exit.
    command_class = @subcommands.get(@sub_command.to_sym) if @sub_command
        
    if ! command_class && @sub_command
      command_class = @subcommands.get(:run)
      @sub_args.unshift(@sub_command) 
    end
        
    return help if !command_class || !@sub_command
    @logger.debug("Invoking command class: #{command_class} #{@sub_args.inspect}")

    # Initialize and execute the command class
    command_class.new(@sub_args, @env).execute
  end
end
end
end
end

#-------------------------------------------------------------------------------

Vagrant.commands.register(:coral) { Vagrant::Command::Coral::Base }

