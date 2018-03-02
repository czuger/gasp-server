class AdminController < ApplicationController
  def show
    @server_running = `ps aux | grep gasp-background-server.r[b]` != ''
  end

  def start
    start_process
    redirect_to admin_show_path
  end

  def restart
    stop_process
    start_process
    redirect_to admin_show_path
  end

  def stop
    stop_process
    redirect_to admin_show_path
  end

  private

  def get_background_process_pid
    `ps aux | grep gasp-background-server.r[b] | awk '{ print $2 }'`.to_i
  end

  def start_process
    spawn('nohup ruby server/gasp-background-server.rb &')
  end

  def stop_process
    pid = get_background_process_pid
    Process.kill('KILL', pid) if pid > 0
  end

end
