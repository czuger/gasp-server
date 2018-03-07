require 'json'
require 'socket'
require 'thread'
require 'pp'
require 'fileutils'
require 'securerandom'

Thread.abort_on_exception = true

class FoldersListener

  COMMUNICATION_PATH = '/tmp/gasp/'

  def wait
    folders_receiver = TCPServer.new 6663
    p folders_receiver
    FileUtils.mkpath( COMMUNICATION_PATH ) unless Dir.exist? ( COMMUNICATION_PATH )

    loop do

      socket = folders_receiver.accept
      p socket

      Thread.new{

          data = socket.read
          filename = SecureRandom.hex(16) + '.json'

          File.open( COMMUNICATION_PATH + filename ) do |f|
            f.write( data )
          end

          `bundle exec rake folders:set #{filename}`
      }
    end
  end
end