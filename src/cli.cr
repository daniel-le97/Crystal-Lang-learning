require "option_parser"

module Starter
  VERSION = "0.1.0"

  OptionParser.parse do |parser|
    parser.banner = "Welcome to your first Crystal CLI!"

    parser.on "-v", "--version", "Show version" do
      puts "version 1.0"
      exit
    end
    parser.on "-h", "--help", "Show help" do
      puts parser
      exit
    end
  end

end
