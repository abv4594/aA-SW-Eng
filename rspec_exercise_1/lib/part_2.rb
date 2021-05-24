def hipsterfy(word)

    vws = "aeiou"
    foundvw = false
    i = word.length-1

    while !foundvw && i>=0
        if vws.include?(word[i])
            word[i] = ""
            foundvw = true
        end
        i -= 1
    end
    word
end

def vowel_counts(str)

    vws = "aeiou"
    hash = Hash.new(0)
    str.downcase.each_char do |char|
        hash[char] += 1 if vws.include?(char)
    end

    hash

end

def caesar_cipher(str, n)
    alpha = "abcdefghijklmnopqrstuvwxyz" #26 letter
    arr = [] 
    arr = str.split("").map do |ele|

        if alpha.include?(ele)
            alpha[(alpha.index(ele)+n)%26]
        else 
            ele
        end
    end
    arr.join("")

end
