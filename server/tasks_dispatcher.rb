require_relative 'folders'

class TasksDispatcher

  def self.process_connection( socket )
    Thread.new{
      command, _ =  socket.recvfrom( 3 )

      case when command
             'SFO'
             Folders.set( socket )
      end
    }
  end

end