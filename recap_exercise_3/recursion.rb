def multiply (a,b)

    #base cases
    return 0 if a == 0 || b == 0
    return a if b == 1

    #special cases
    return multiply(b,a) if (a>0) && (b<0)
    return multiply(a.abs, b.abs) if (a<0) && (b<0)

    #regular case
    a + multiply(a,b-1)

end

# Examples
puts 
puts "Multiply"
puts "________"
puts
p multiply(3, 5)        # => 15
p multiply(5, 3)        # => 15
p multiply(2, 4)        # => 8
p multiply(0, 10)       # => 0
p multiply(-3, -6)      # => 18
p multiply(3, -6)       # => -18
p multiply(-3, 6)       # => -18
# m (-5,3) = -5 + m (-5,2) ...
# m (5, -3) = m ( -3, 5)
# m (-5, -3) = m (5,3)
def lucas_sequence(num)

    return [] if num==0

    return [2] if num==1

    return [2,1] if num == 2

    lucas_sequence(num-1)+ [lucas_sequence(num-1)[-1]+lucas_sequence(num-1)[-2]] 

end

# Examples
puts
puts "Lucas sequence"
puts "______________"
puts
p lucas_sequence(0)   # => []
p lucas_sequence(1)   # => [2]    
p lucas_sequence(2)   # => [2, 1]
p lucas_sequence(3)   # => [2, 1, 3]
p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def isprime?(num)

    return false if num<2

    (2...num).each do |factor|
        return false if num % factor == 0
    end

    return true

end

def prime_factorization(num)


    (2...num).each do |factor|
        if num % factor  == 0
            return prime_factorization(factor)+prime_factorization(num/factor)
        end
    end

    [num]

#     return [num] if isprime?(num)

#     first_prime = 0

#     (2...num).each do |n|
#         first_prime = n if num%n == 0 && isprime?(n)
#     end

#    prime_factorization(num/first_prime) + prime_factorization(first_prime) 

end



# Examples
puts
puts "Prime factorization"
puts "___________________"
puts

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]


