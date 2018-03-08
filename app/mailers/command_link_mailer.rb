class CommandLinkMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def send_link(folders)
    @link = 'http://gasp.ieroe.com' + ambiant_url( folders.url_hash, only_path: true )
    mail(to: folders.email, subject: 'Your link')
  end

end
