# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)

    #find the greater 

    check = (num_1<=>num_2)

    greater = num_1
    smaller = num_2

    if check == -1
        greater,smaller = smaller,greater
    elsif check == 0
        return num_1
    end

    i = 1
    until (greater*i) % smaller == 0
        i += 1
    end

    greater*i


end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)

    #generate all bigrams

    bigrams = []

    (0...(str.length)-1).each do |ind|
        bigrams << str[ind..ind+1]
    end

    #count bigrams

    counter = Hash.new(0)
    bigrams.each do |bigram|
        counter[bigram]+=1
    end

    #sort counter based on the values

    sorted = counter.sort_by {|k,v| v}

    #return the one with highest v

    sorted[-1][0]

end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse

        new_hash = {}

        self.each do |k,v|
            new_hash[v]=k
        end

        new_hash

    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)

        # generate pairs

        pairs = []

        count = 0

        (0...self.length-1).each do |slow|
            (slow+1...self.length).each do |fast|
                count+=1 if (self[slow]+self[fast])==num
            end
        end

        count

        # select the pairs which the sum = num

        # pairs.select! do |pair|
        #     pair.sum == num
        # end

        # pairs.count


    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)

        prc ||= Proc.new {|e1,e2| e1<=>e2}

        
        sorted=false

        until sorted
            sorted=true
            i=0
            while i<(self.length-1)
                if (prc.call(self[i],self[i+1]))==1
                    sorted=false
                    self[i],self[i+1] = self[i+1],self[i]
                end
                i+=1
            end
        end
        self
    end






    
end
