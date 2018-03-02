class AmbiantController < ApplicationController
  def show
    @sounds_keys = JSON.parse( File.open('data/sounds.json','r').read ).keys
  end

  def change
    command_reciever = UNIXSocket.new('/tmp/send_music_command')
    command_reciever.write params[:ambiant]
    command_reciever.close()

    redirect_to ambiant_show_path
  end

end
