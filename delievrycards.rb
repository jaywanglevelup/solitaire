require 'xmlsimple'
xml_file = File.open("cards1.xml", "r")
xml_data = XmlSimple.xml_in(xml_file)

xml_data['cards'].shuffle! # wash cards

players = 1
start_with = 5
a = Array.new
0.upto(players) do
    |num| a[num] = { 'handcard' => xml_data['cards'].shift(start_with) }
    puts a[num]['handcard'].inspect
end

