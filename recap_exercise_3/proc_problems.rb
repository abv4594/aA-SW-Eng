class String

    def select (&prc)

        return "" if prc == nil

        new_str = ""

        self.each_char do |char| 
            new_str += char if prc.call(char)
        end

        new_str
    end

    def map! (&prc)

        self.each_char.with_index do |char,idx|

            self[idx] = prc.call(char,idx)

        end
    end




end

# Examples
puts "Select"
puts "_______"
puts

p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
p "HELLOworld".select          # => ""

puts
puts "Map"
puts "___"
puts
# Examples
word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
p word_2        # => "DiJkStRa"


