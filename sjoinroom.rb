require 'socket'

@room = TCPServer.new 'localhost', 2000
@seats = 2
@player_ready = 0
@players = []
def open_room
    catch (:done) do
        while player = @room.accept
            @players << player
            p @players

            player.puts "Are you ready to play?(y|yes)"
            while true
                case reply = player.gets
                when /^y|yes$/i
                    @player_ready += 1
                    room_broadcast("#{player} #{@player_ready} is ready")
                    puts "#{@player_ready} is ready!\n"

                    player.puts "please wait for other plays or quit!(q|quit)\n"
                    while true
                        throw :done if @player_ready == @seats
                        case reply = player.gets
                        when /^q|quit$/i
                            @player_ready -= 1
                            room_broadcast("#{player} #{@player_ready} is ready")
                            puts "#{@player_ready} is ready!\n"
                            break
                        else
                            puts reply
                            player.puts "#{@player_ready} Room Received1!\n"
                        end
                    end
                    break

                else
                    puts reply
                    player.puts "#{@player_ready} Room Received2!\n"
                end
            end
            puts 'break'
        end
    end
    room_broadcast("All players are ready")
    puts "All players are ready!\n"
    room_broadcast("Game Start")
    puts "Game Start\n"
end

def room_broadcast(context)
    @players.each do |broadcast|
        broadcast.puts "#{context}!\n"
    end
end

threadA = Thread.fork do
    open_room
    puts 'ggg'
end
threadB = Thread.fork do
    open_room
    puts 'aaa'
end

threadA.join
threadB.join
