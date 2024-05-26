# TODO: Write documentation for `Starter`
require "http/server"

module Starter
  VERSION = "0.1.0"

  # TODO: Put your code here

  server = HTTP::Server.new do |context|
    context.response.content_type = "text/plain"
    context.response.print "Hello world! The time is #{Time.local}"
  end

  address = server.bind_tcp 8080
  puts "Listening on http://#{address}"
  server.listen
  puts "Hello World!"
end
