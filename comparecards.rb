class Comp_Cards
    def initialize(a, b)
        @a = a.to_s.chars.sort.join
        @b = b.to_s.chars.sort.join
    end

    def cards_class
        @type
        puts "#{@a}\n"
        if @a =~ /^([2-9TJQKAab])$/ then
            puts "#{@a} is type one\n#{$`} |  #{$&} |  #{$'}"
            @type = "one"
        elsif @a =~ /^([2-9TJQKAab])\1$/ then
            puts "#{@a} is type two\n#{$`} |  #{$&} |  #{$'}"
            @type = "two"
        elsif @a =~ /^([2-9TJQKAab])\1\1$/ then
            puts "#{@a} is type three\n#{$`} |  #{$&} |  #{$'}"
            @type = "three"
        elsif @a =~ /^([2-9TJQKAab])\1\1\1$/ then
            puts "#{@a} is type four\n#{$`} |  #{$&} |  #{$'}"
            @type = "four"
        elsif @a =~ 
            /^([2-9TJQKAab])\1\1([2-9TJQKAab])\2|([2-9TJQKAab])\3([2-9TJQKAab])\4\4$/ 
                then
            puts "#{@a} is type fullhouse\n#{$`} |  #{$&} |  #{$'}"
            @type = "fullhouse"
        elsif @a =~
            /^(2345A|23456|34567|45678|56789|6789T|789JT|89JQT|9JKQT|AJKQT)$/
                then
            puts "#{@a} is type straight\n#{$`} |  #{$&} |  #{$'}"
            @type = "straight"
        else
            puts "no such type\n"
        end
    end

    def cards_order
        type = @type
        case type
        when "one"
            puts comp_one
        when "two"
            puts comp_twofour
        when "three"
            puts comp_twofour
        when "four"
            puts comp_twofour
        when "fullhouse"
            puts comp_fullhouse
        when "straight"
            puts comp_straight
        else
            puts "tpye == #{tpye} no such type!!!\n"
        end
    end

    def comp_one
        order = %w{3 4 5 6 7 8 9 T J Q K A 2 b a}
        order.to_s
        order.index(@a) <=> order.index(@b)
    end

    def comp_twofour
        order = %w{3 4 5 6 7 8 9 T J Q K A 2}
        order.to_s
        order.index(@a.squeeze) <=> order.index(@b.squeeze)
    end

    def comp_fullhouse
        order = %w{3 4 5 6 7 8 9 T J Q K A 2}
        order.to_s
        @a.sub!(/.*(\w)\1\1.*/,'\1')
            puts "#{@a}"
        @b.sub!(/.*(\w)\1\1.*/,'\1')
            puts "#{@b}"
        order.index(@a) <=> order.index(@b)
    end

    def comp_straight
        order = %w{271 260 265 270 275 306 326 352 371 379}
        order.to_s
        asum = 0
        @a.each_byte {|c| asum += c}

        bsum = 0
        @b.each_byte {|c| bsum += c}
        order.index(asum.to_s) <=> order.index(bsum.to_s)
    end
end

a = Comp_Cards.new("6789T","67895")
a.cards_class
a.cards_order

