# no_dupes?
# Write a method no_dupes?(arr) that accepts an array as an arg and returns an new array containing the elements that were not repeated in the array.

# # Examples
# no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# no_dupes?([true, true, true])            # => []

def no_dupes?(arr)

    counter = Hash.new(0)

    arr.each { |ele| counter[ele]+=1}

    counter.select! {|k,v| v==1}

    counter.keys

end
puts "no_dupes?"
puts "---------"
p no_dupes?([1, 1, 2, 1, 3, 2, 4])
p no_dupes?(['x', 'x', 'y', 'z', 'z'])
p no_dupes?([true, true, true]) 
puts "---------"

# no_consecutive_repeats?
# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. The method should return true if an element never appears consecutively in the array; it should return false otherwise.

# # Examples
# no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# no_consecutive_repeats?(['x'])                              # => true

def no_consecutive_repeats?(arr)

    (0...arr.length - 1).each do |idx|

        return false if arr[idx] == arr[idx+1]

    end

    return true

end

puts "no_consecutive_repeats?"
puts "-----------------------"

p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
p no_consecutive_repeats?(['x'])                              # => true

# char_indices
# Write a method char_indices(str) that takes in a string as an arg. The method should return a hash containing characters as keys. The value associated with each key should be an array containing the indices where that character is found.

def char_indices(str)

    my_hash = Hash.new { |hash,k| hash[k] = []}

    str.each_char.with_index do |char,idx|

        my_hash[char] << idx 

    end

    my_hash

end
# Examples
puts ">>>> char_indices"
p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}
puts "-----------------"


# longest_streak
# Write a method longest_streak(str) that accepts a string as an arg. The method should return the longest streak of 
# consecutive characters in the string. If there are any ties, return the streak that occurs later in the string.

def longest_streak(str)

    streak = ""
    streak_cand = ""

    str.each_char do |char|

        if !streak_cand.include?(char)
            if streak_cand.length >= streak.length
                streak = streak_cand
            end
            streak_cand = char
            
        else
            streak_cand += char
        end
    end

    return streak_cand if streak_cand.length >= streak.length

    streak

    # longest_candidate = str[0]
    # longest = str[0]
    # idx = 1
    
    # until idx==str.length+1

    #     if str[idx]==longest_candidate[-1] # next letter is part of the streak
    #         longest_candidate += str[idx]
    #     else 
    #         longest = longest_candidate if longest_candidate.length >= longest.length    
    #         longest_candidate = str[idx]
    #     end

    #     idx += 1

    # end

    # longest


end


# Examples
p longest_streak('a')           # => 'a'
p longest_streak('accccbbb')    # => 'cccc'
p longest_streak('aaaxyyyyyzz') # => 'yyyyy
p longest_streak('aaabbb')      # => 'bbb'
p longest_streak('abc')         # => 'c'

# bi_prime?
# Write a method bi_prime?(num) that accepts a number as an arg and returns a boolean indicating whether or not the number is a bi-prime. A bi-prime is a positive integer that can be obtained by multiplying two prime numbers.

# For Example:

# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24

def bi_prime?(num)

    prime_dividers = 0
    i = 2
    while num>1 
        if num % i == 0 && isprime?(i)
            prime_dividers += 1
            num /= i
        else
            i += 1
        end
    end
    prime_dividers == 2
end

def isprime?(num)

    return false if num<2

    (2...num).each do |factor|
        return false if num % factor == 0
    end

    return true

    # remember to use (2...num).none? {....}

end

# Examples
p bi_prime?(14)   # => true
p bi_prime?(22)   # => true
p bi_prime?(25)   # => true
p bi_prime?(94)   # => true
p bi_prime?(24)   # => false
p bi_prime?(64)   # => false

# vigenere_cipher
# A Caesar cipher takes a word and encrypts it by offsetting each letter in the word by a fixed number, called the key. Given a key of 3, for example: a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence of keys is used. For example, if we encrypt "bananasinpajamas" with the key sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# # Message:  b a n a n a s i n p a j a m a s
# # Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# # Result:   c c q b p d t k q q c m b o d t
# Write a method vigenere_cipher(message, keys) that accepts a string and a key-sequence as args, returning the encrypted message. Assume that the message consists of only lowercase alphabetic characters.

def vigenere_cipher(msg,keys)

    alpha = ("a".."z").to_a

    new_msg = ""

    msg.each_char.with_index do |char, ind|

        idx = alpha.index(char)

        key_idx = ind % keys.length

        key = keys[key_idx]

        new_idx = (idx + key)%26

        new_msg += alpha[new_idx]

    end

    new_msg

end

# Examples
puts
puts "vigenere_cipher"
puts "_______________"
puts
p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
p vigenere_cipher("yawn", [5, 1])             # => "dbbo"


# vowel_rotate
# Write a method vowel_rotate(str) that accepts a string as an arg and returns the string where every vowel is replaced with the vowel the appears before it sequentially in the original string. The first vowel of the string should be replaced with the last vowel.

def vowel_rotate(msg)

    new_msg = msg[0..-1] #otherwise we copy the reference

    #get vowel indices
    vowels = "aeiou"
    vwidxs = (0...msg.length).select {|i| vowels.include?(msg[i])}
    #rotate it

    vwidxs.rotate!(-1)
     

    i = -1 # tricky to allow be incremented inside the map

    answer = new_msg.split("").map do |char|
        # to iterate over the vwidxs array
        if vowels.include?(char) # is a vowel
            i+=1
            msg[vwidxs[i]]
        else
            char
        end
    end

    answer.join("")

end








    # vowels = "aeiou"
    # new_msg = ""
    # vowels_in_msg = vowels_extractor (msg)
    # last = vowels_in_msg.pop
    # vowels_in_msg.insert(0,last)

    # i = 0

    # msg.each_char do |char|

    #     if vowels.include?(char)

    #         new_msg += vowels_in_msg[i]
    #         i+=1
    #     else
    #         new_msg += char
    #     end

    # end

    # new_msg


def vowels_extractor(msg)

    arr = []
    vowels = "aeiou"
    msg.each_char do |char|
        arr << char if vowels.include?(char)
    end
    arr
end


# Examples
puts
puts "Vowel_rotate"
puts "____________"
puts
p vowel_rotate('computer')      # => "cempotur"
p vowel_rotate('oranges')       # => "erongas"
p vowel_rotate('headphones')    # => "heedphanos"
p vowel_rotate('bootcamp')      # => "baotcomp"
p vowel_rotate('awesome')       # => "ewasemo"

