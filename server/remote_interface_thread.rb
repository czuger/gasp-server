class RemoteInterfaceThread

  PLAYLISTS = {
      'battle' => ['battle/battle01.mp3','battle/battle02.mp3','battle/battle03.mp3','battle/battle04.mp3','battle/battle05.mp3','battle/battle06.mp3'],
      'sounds' => ['sounds/Forest'],
      'forest' => ['Forest/DayForest01.mp3','Forest/DayForest02.mp3','Forest/DayForest03.mp3','Forest/NightForest01.mp3','Forest/NightForest02.mp3','Forest/NightForest03.mp3','Forest/NightForest04.mp3']}

  def initialize( socket, queue )
    @queue = queue
    @thread = Thread.new{

      loop do
        command = @queue.pop
        puts "Command sent : #{PLAYLISTS[command].shuffle.to_json}"
        socket.puts PLAYLISTS[command].shuffle.to_json
      end
    }
  end

  def kill
    Thread.kill(@thread)
  end
end