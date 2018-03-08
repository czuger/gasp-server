# Preview all emails at http://localhost:3000/rails/mailers/command_link_mailer
class CommandLinkMailerPreview < ActionMailer::Preview

  def send_link
    CommandLinkMailer.send_link(FoldersList.first)
  end

end
