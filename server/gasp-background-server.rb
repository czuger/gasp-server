require 'json'
require 'socket'
require 'thread'
require_relative 'local_interface_thread'
require_relative 'remote_interface_thread'
require 'pp'

Thread.abort_on_exception = true

queue = Queue.new
LocalInterfaceThread.new( queue )

music_sender = TCPServer.new 6664
p music_sender

remote_interface_thread = nil

# loop infinitely, processing one incoming
# connection at a time.
loop do

  # Wait until a client connects, then return a TCPSocket
  # that can be used in a similar fashion to other Ruby
  # I/O objects. (In fact, TCPSocket is a subclass of IO.)
  socket = music_sender.accept
  p socket
  if remote_interface_thread
    puts "Killing #{remote_interface_thread}"
    remote_interface_thread.kill
    pp remote_interface_thread
  end

  remote_interface_thread = RemoteInterfaceThread.new( socket, queue )

end