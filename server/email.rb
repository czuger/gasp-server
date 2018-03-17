require 'rake'

class Email

  def self.send( guid )
    p `rake email:send #{guid}`
  end

end