require 'socket'

room = TCPSocket.new 'localhost', 2000
fork do
    while line = room.gets
        puts line
    end
end

while line = gets
    room.puts line
end
