require 'json'
require 'socket'
require 'thread'
require_relative 'local_interface_thread'
require_relative 'remote_interface_thread'

queue = Queue.new

LocalInterfaceThread.new( queue )

music_sender = TCPServer.new 6664

# loop infinitely, processing one incoming
# connection at a time.
loop do

  # Wait until a client connects, then return a TCPSocket
  # that can be used in a similar fashion to other Ruby
  # I/O objects. (In fact, TCPSocket is a subclass of IO.)
  socket = music_sender.accept
  RemoteInterfaceThread( socket, queue )

end