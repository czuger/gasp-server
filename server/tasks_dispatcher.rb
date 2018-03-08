require_relative 'folders'

class TasksDispatcher

  def self.process_connection( socket )
    Thread.new{
      command =  socket.gets.chomp

      puts 'Command = ' + command.inspect
      case command
        when 'SET'
          Folders.set( socket )
        when 'MUS'
          Folders.set( socket )
      end
    }
  end

end