require 'socket'

command_reciever = UNIXSocket.new('/tmp/send_music_command')
command_reciever.puts ARGV[0]
command_reciever.close()
