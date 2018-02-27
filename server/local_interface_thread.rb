class LocalInterfaceThread

  def initialize( queue )
    @queue = queue
    Thread.new{

      `rm /tmp/send_music_command`
      command_reciever = UNIXServer.open('/tmp/send_music_command')

      loop do
        cr = command_reciever.accept
        command = cr.gets.chomp
        puts "Command received : #{command.inspect}"
        @queue << command
      end
    }
  end
end