require 'json'
require 'socket' # Provides TCPServer and TCPSocket classes

playlists = {
    "battle":["battle/battle01.mp3","battle/battle02.mp3","battle/battle03.mp3","battle/battle04.mp3","battle/battle05.mp3","battle/battle06.mp3"],
    "sounds":["sounds/Forest"],
    "Forest":["Forest/DayForest01.mp3","Forest/DayForest02.mp3","Forest/DayForest03.mp3","Forest/NightForest01.mp3","Forest/NightForest02.mp3","Forest/NightForest03.mp3","Forest/NightForest04.mp3"]}

# p playlists[:Forest].to_json

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

  socket.puts playlists[:Forest].shuffle.to_json

  # Close the socket, terminating the connection
  socket.close
end