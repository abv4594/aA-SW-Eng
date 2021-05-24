def pp(str)

    puts
    puts str + ">>>>>>>>>>"
    puts

end

def duos(str)

    reps = 0
    i = 0
    while i<str.length - 1
        reps += 1 if str[i] == str[i+1]
        i+=1
    end

    reps

end

pp("duos")
p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0

def sentence_swap(sent,ahash)

    new_sent = sent.split(" ").map do |word|
        ahash[word] || word
    end

    new_sent.join(" ")

end

pp("sentence_swap")

p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'

def hash_mapped(ahash,prc,&blc)

    new_hash = {}
    ahash.each do |k,v|
        new_hash[blc.call(k)]=prc.call(v)
    end
    new_hash

end

pp("hash_mapped")

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}

def counted_characters(str)

    letters = str.split("")

    rep_letters = letters.select {|letter| letters.count(letter)>2}

    rep_letters.uniq

end

pp("counted_characters")

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []

def triplet_true?(str)

    reps = 0
    triplets = 0

    (0...str.length-1).each do |idx|
        this_letter = str[idx]
        next_letter = str[idx+1]
        

        if next_letter == this_letter
            reps += 1
            return true if reps >= 2 # 2 repetitions means at least 3 letters 
        else 
            reps=0
        end
    end
    
    false
end

pp("triplet_true?")

p triplet_true?('caaabb')        # true
p triplet_true?('terrrrrible')   # true
p triplet_true?('runninggg')     # true
p triplet_true?('bootcamp')      # false
p triplet_true?('e')             # false

def energetic_encoding(str,ahash)
    new_str = str.split("")
    new_str.map! do |letter|
        if letter == " " 
            " "
        else
            ahash[letter] || "?"
        end
    end
    new_str.join("")
end

pp("energetic_encoding")

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'

def uncompress(str)

    new_str=""

    idx = 0

    while idx < (str.length - 1)

        new_str += str[idx]*(str[idx+1].to_i)

        idx += 2

        

    end

    new_str

end

pp("uncompress")

p uncompress('a2b4c1') # 'aabbbbc'
p uncompress('b1o2t1') # 'boot'
p uncompress('x3y1x2z4') # 'xxxyxxzzzz'
        
def conjunct_select(arr, *prcs)

    arr.select do |el|
        prcs.all? { |prc| prc.call(el)}
    end

end

pp("conjunct_select")

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]


def convert_pig_latin(sent)
    new_sent = sent.split(" ")
    vws = "aeiouAEIOU"
    new_sent.map! do |word|
        if word.length<3 
            word
        elsif vws.include?(word[0])
            word + "yay"
        else moveletters(word)

        end
    end

    new_sent.join(" ")

end

def first_vowel_index(word)
    vws = "aeiouAEIOU"
    vowelfound = false
    idx = -1
    until vowelfound
        idx += 1
        vowelfound = true if vws.include?(word[idx])
    end
    idx
end


def moveletters(word)

   idx = first_vowel_index(word) 

    if word[0].upcase == word[0] 
        word[idx] = word[idx].upcase 
        word[0] = word[0].downcase
    end


    word[idx..-1] + word[0...idx] + "ay"

end

pp("convert_pig_latin")

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)

    new_sent = sent.split(" ")

    vws = "aeiouAEIOU"

    new_sent.map! do |word|

        if word.length<3 
            word
        elsif vws.include?(word[-1])
            word + word.downcase
        else moveletters2(word)

        end
    end

    new_sent.join(" ")

end

def last_vowel_index(word)

    vws = "aeiouAEIOU"

    vowelfound = false

    idx = word.length

    until vowelfound

        idx -= 1
        
        vowelfound = true if vws.include?(word[idx])

    end

    idx
end


def moveletters2(word)

    idx = last_vowel_index(word)

    word + word[idx..-1]

end

pp ("reverberate")

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(arr,*prcs)

    arr.select do |el|
        prcs.any? do |prc|
            prc.call(el)
        end
    end

end

pp ("disjunct_select")

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel(sent)

    vws = "aeiouAEIOU"

    new_sent = sent.split(" ").map.with_index do |word, ind|

        idx = -1

        if word.split("").any? {|char| vws.include?(char) }
            if ind.even? 
                idx = first_vowel_index(word)
            else
                idx = last_vowel_index(word)
            end
        end

        word[idx] = "" if idx > -1

        word
        
    end

    new_sent.join(" ")
end

pp("alternating_vowel")

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk(sent)

    vws = "aeiouAEIOU"

    new_sent = sent.split(" ").map do |word|

        if vws.include?(word[-1])
            word + word[-1]
        else
            code_word(word)
        end

    end

    new_sent.join(" ")

end

def code_word(word)

    new_word = ""

    vws = "aeiouAEIOU"

    word.each_char.with_index do |char,idx|

        if vws.include?(char)
            new_word += char + "b" + char.downcase 
        else
            new_word += char
        end    
    end

    new_word

end

pp ("silly_talk")

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(str)
    new_str = ""
    idx = 0

    while idx < str.length
        letter_change = false
        next_idx = idx

        until letter_change do
            next_idx += 1
            letter_change = true if str[next_idx]!=str[idx]
        end

        if next_idx == (idx + 1) #no streak case
            new_str += str[idx]
            idx += 1 # move one to next index
        else # streak case
            new_str += str[idx] + (next_idx - idx).to_s
            idx = next_idx #reposition the cursor 
        end

    
    end

    new_str

end

pp("compress")

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"





