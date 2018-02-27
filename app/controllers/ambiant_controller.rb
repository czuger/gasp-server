class AmbiantController < ApplicationController
  def show
  end

  def change
    command_reciever = UNIXSocket.new('/tmp/send_music_command')
    command_reciever.puts params[:ambiant]
    command_reciever.close()

    redirect_to ambiant_show_path
  end

end
