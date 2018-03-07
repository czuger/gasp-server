require 'json'
require 'socket'
require 'thread'
require 'pp'

Thread.abort_on_exception = true

class FoldersListener

  def wait
    folders_receiver = TCPServer.new 6663
    p folders_receiver

    loop do

      socket = folders_receiver.accept
      p socket

      Thread.new{
          data = socket.read
          data = JSON.parse(data)
          p data
      }
    end
  end
end