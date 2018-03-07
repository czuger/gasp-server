require_relative 'folders'

class TasksDispatcher

  def self.process_connection( socket )
    Thread.new{
      command, _ =  socket.recvfrom( 3 )

      case command
        when 'SET'
          Folders.set( socket )
        when 'MUS'
          Folders.set( socket )
      end
    }
  end

end