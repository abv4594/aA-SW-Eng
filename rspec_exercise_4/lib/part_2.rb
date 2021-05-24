def proper_factors(num)

   (1...num).select {|factor| num%factor == 0}

end

def aliquot_sum(num)

    proper_factors(num).sum

end

def perfect_number?(num)

    num == aliquot_sum(num)

end

def ideal_numbers(num)

    ideals = []

    ini = 6

    until ideals.length == num

        ideals << ini if perfect_number?(ini)

        ini += 1

    end

    ideals

end








