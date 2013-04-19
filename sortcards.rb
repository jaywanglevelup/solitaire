require 'xmlsimple'
xml_file = File.open("cards.xml", "r")
xml_data = XmlSimple.xml_in(xml_file)

xml_data['cards'].shuffle! # wash cards

players = 0
start_with = 5
a = Array.new
b = []
0.upto(players) do
    |num| a[num] = { 'handcard' => xml_data['cards'].shift(start_with) }
    #    puts a[num]['handcard'].inspect
    puts "\n sorts cards \n"

    a[num]['handcard'].each do
        |x| 
        puts x
        b << x['num'] 
    end
    puts b.sort
end



