# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

# After seeing the solution. Much more efficient:
# ____________________________________

def coprime?(num_1, num_2)

    # return boolean saying whether in the ennumerable none of the numbers
    # between 2 and num_1 divides both num_1 AND num_2 at the same time
    (2..num_1).none? { |n| num_1 % n == 0 && num_2 % n == 0}

end


# First try (much longer):
#____________________________
# def coprime?(num_1, num_2)
    
#     div1 = dividers(num_1) #array with diveders of num_1
#     div2 = dividers(num_2) #array with dividers of num_2
#     codiv = div1.select { |num| div2.include?(num)} #array with the diveders of num_1 that are also dividers of num_2
#     codiv.length == 1 #if the length = 1 means there is one common divider - one

# end

# def dividers(num)

#     arr = []
#     (1..num).each { |n| arr << n if num % n == 0 }
#     arr

# end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
