class RemoteInterfaceThread

  def initialize( socket, queue )
    @queue = queue
    @playlists = JSON.parse( File.open('data/sounds.json','r').read )

    @thread = Thread.new{

      loop do
        command = @queue.pop
        puts "Command sent : #{@playlists[command].shuffle.to_json}"
        STDOUT.flush
        socket.write @playlists[command].shuffle.to_json
      end
    }
  end

  def kill
    Thread.kill(@thread)
  end
end