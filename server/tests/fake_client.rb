require 'socket'

s = nil

loop do
  begin
    sleep( 0.5 )
    s = TCPSocket.new 'localhost', 6664
    break if s
  rescue => e
  end

end

p 'Out the loop'
p s
puts 'About to write SET'
s.puts 'SET'
puts 'About to send JSON'
s.puts '{"foo":"bar"}'

STDOUT.flush

puts 'Blocking on read'
p s.read

# s.close