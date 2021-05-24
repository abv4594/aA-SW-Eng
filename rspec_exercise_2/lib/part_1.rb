def partition(arr, n)

    arr1 = arr.select {|i| i < n}
    arr.select! {|i| i >= n}
    
    [arr1, arr]

end 

def merge (h1, h2)
    h3 = {}
    h1.each { |k,v| h3[k]=v}
    h2.each { |k,v| h3[k]=v}
    h3
end

def censor (sent, arr)
    new_sent = []
    vws = "aeiouAEIOU"

    new_sent = sent.split.map do |word|

        if arr.include? (word.downcase)
            word.each_char.with_index { |char,i| word[i]="*" if vws.include?(char)}
        end
        word
    end

    new_sent.join(" ")


end

def power_of_two? (n)
    i=0
    while 2**i <= n

       return true if 2**i == n 

       i += 1
    end
   false
end


