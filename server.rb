require 'socket' # Provides TCPServer and TCPSocket classes

# Initialize a TCPServer object that will listen
# on localhost:2345 for incoming connections.
server = TCPServer.new 6664
p server

# loop infinitely, processing one incoming
# connection at a time.
loop do

  # Wait until a client connects, then return a TCPSocket
  # that can be used in a similar fashion to other Ruby
  # I/O objects. (In fact, TCPSocket is a subclass of IO.)
  socket = server.accept
  p socket

  # Read the first line of the request (the Request-Line)
  request = socket.gets

  # Log the request to the console for debugging
  puts request

  # Close the socket, terminating the connection
  socket.close
end