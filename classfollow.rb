class FollowMe
    attr_reader :num
    def initialize(num)
        @num = num
    end

    def follow_me
        print "start follow me!\n"
        foo = Random.new
        success = 0
        failure = 0

        while 1
            bar = foo.rand(@num)
            puts "#{bar}"

            get = gets.chomp

            if bar == get.to_i then
                puts "O.K!"
                success += 1
            else
                puts "no"
                failure += 1

                if failure == 3 then
                    puts "Failure 3 times game is over, success is #{success}"
                    break
                end
            end
        end
    end
end

new_game = FollowMe.new(30)
new_game.follow_me


