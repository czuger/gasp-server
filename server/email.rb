require 'rake'

class Email

  def self.send( guid )
    p `RAILS_ENV=production exec rake email:send #{guid}`
  end

end