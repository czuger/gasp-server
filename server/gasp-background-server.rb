require 'json'
require 'socket'
require 'thread'
require 'pp'
require_relative 'db'
require_relative 'local_interface_thread'
require_relative 'remote_interface_thread'
require_relative 'tasks_dispatcher'

Thread.abort_on_exception = true

queue = Queue.new
LocalInterfaceThread.new( queue )

listener = TCPServer.new 6664
p listener

# loop infinitely, processing one incoming
# connection at a time.
loop do

  # Wait until a client connects, then return a TCPSocket
  # that can be used in a similar fashion to other Ruby
  # I/O objects. (In fact, TCPSocket is a subclass of IO.)
  socket = listener.accept
  TasksDispatcher.process_connection( socket )

  # if remote_interface_thread
  #   puts "Killing #{remote_interface_thread}"
  #   remote_interface_thread.kill
  #   # pp remote_interface_thread
  # end
  #
  # remote_interface_thread = RemoteInterfaceThread.new( socket, queue )

end
