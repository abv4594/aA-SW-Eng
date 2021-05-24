# strange_sums
# Write a method strange_sums that accepts an array of numbers as an argument. The method should return a count of the number of distinct pairs of elements that have a sum of zero. You may assume that the input array contains unique elements.
require "byebug"

def strange_sums(arr)

    pairs(arr).count {|ele| ele.sum == 0}

end

def pairs(arr)
    new_arr = []
    (0...arr.length-1).each do |idx_1|
        (idx_1+1...arr.length).each do |idx_2|
            new_arr << [arr[idx_1],arr[idx_2]]
        end
    end
    new_arr
end

# Examples

puts
puts "Strange sums >>>>>>>>>>"
puts

p strange_sums([2, -3, 3, 4, -2])     # 2
p strange_sums([42, 3, -1, -42])      # 1
p strange_sums([-5, 5])               # 1
p strange_sums([19, 6, -3, -20])      # 0
p strange_sums([9])                   # 0

# pair_product
# Write a method pair_product that accepts an array of numbers and a product as arguments. The method should return a boolean indicating whether or not a pair of distinct elements in the array result in the product when multiplied together. You may assume that the input array contains unique elements.

def pair_product(arr, prod)

    pairs(arr).any? {|pair| pair.inject(&:*) == prod}


end

# Examples

puts
puts "Pair_product >>>>>>>>>>"
puts

p pair_product([4, 2, 5, 8], 16)    # true
p pair_product([8, 1, 9, 3], 8)     # true
p pair_product([3, 4], 12)          # true
p pair_product([3, 4, 6, 2, 5], 12) # true
p pair_product([4, 2, 5, 7], 16)    # false
p pair_product([8, 4, 9, 3], 8)     # false
p pair_product([3], 12)             # false

# rampant_repeats
# Write a method rampant_repeats that accepts a string and a hash as arguments. The method should return a new string where characters of the original string are repeated the number of times specified by the hash. If a character does not exist as a key of the hash, then it should remain unchanged.

# Examples

def rampant_repeats(str, hash)

    new_str = ""

    str.each_char { |char| new_str += char * ( hash[char] || 1) }

    new_str

end

p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

# perfect_square?
# Write a method perfect_square? that accepts a number as an argument. The method should return a boolean indicating whether or not the argument is a perfect square. A perfect square is a number that is the product of some number multiplied by itself. For example, since 64 = 8 * 8 and 144 = 12 * 12, 64 and 144 are perfect squares; 35 is not a perfect square.

def perfect_square(num)

    return true if num == 1

    (1...num).any?{|n| num == n*n}

end

# Examples

p perfect_square(1)     # true
p perfect_square(4)     # true
p perfect_square(64)    # true
p perfect_square(100)   # true
p perfect_square(169)   # true
p perfect_square(2)     # false
p perfect_square(40)    # false
p perfect_square(32)    # false
p perfect_square(50)    # false



# anti_prime?
# Write a method anti_prime? that accepts a number as an argument. The method should return true if the given number has more divisors than all positive numbers less than the given number. For example, 24 is an anti-prime because it has more divisors than any positive number less than 24. Math Fact: Numbers that meet this criteria are also known as highly composite numbers.

def count_divisors(num)

    (1..num).count {|n| num % n == 0}

end

def anti_prime?(num)

    base = count_divisors(num)

    (1...num).none? {|n| count_divisors(n) > base }



end


# Examples
puts
puts "anti-prime? >>>>>>"
puts
p anti_prime?(24)   # true
p anti_prime?(36)   # true
p anti_prime?(48)   # true
p anti_prime?(360)  # true
p anti_prime?(1260) # true
p anti_prime?(27)   # false
p anti_prime?(5)    # false
p anti_prime?(100)  # false
p anti_prime?(136)  # false
p anti_prime?(1024) # false


def matrix_addition(mat1, mat2)

    rows = mat1.length
    cols = mat1.first.length


    new_arr = Array.new (rows){ |x| x = (0...cols).to_a}

    new_arr.map.with_index do |row, idx|

        row.map do |col|

            mat1[idx][col] + mat2[idx][col]

        end

    end

end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

puts
puts "matrix_addition>>>>>>>>"
puts
p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def dividers(num)

    (1..num).select { |x| num%x == 0}

end

def mutual_factors(*arr)

    mutuals = []

    divs_ini = dividers(arr.first)

    divs_ini.select do |div|

        arr.all? { |n| n%div == 0}
    
    end
end
puts
puts "mutual factors >>>>>>>>>>"
puts
p mutual_factors(50, 30)            # [1, 2, 5, 10]
p mutual_factors(50, 30, 45, 105)   # [1, 5]
p mutual_factors(8, 4)              # [1, 2, 4]
p mutual_factors(8, 4, 10)          # [1, 2]
p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
p mutual_factors(12, 24, 64)        # [1, 2, 4]
p mutual_factors(22, 44)            # [1, 2, 11, 22]
p mutual_factors(22, 44, 11)        # [1, 11]
p mutual_factors(7)                 # [1, 7]
p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)

    return 1 if n == 1 || n == 2
    return 2 if n == 3

    tribonacci_number(n-1) + tribonacci_number(n-2) + tribonacci_number(n-3)

end

puts 
puts "Tribonacci number >>>>>>>>>"
puts

p tribonacci_number(1)  # 1
p tribonacci_number(2)  # 1
p tribonacci_number(3)  # 2
p tribonacci_number(4)  # 4
p tribonacci_number(5)  # 7
p tribonacci_number(6)  # 13
p tribonacci_number(7)  # 24
p tribonacci_number(11) # 274

puts

puts "matrix_addition_reloaded >>>>>>"

puts


def matrix_addition_reloaded(*mats)

    len = mats.first.length

    return nil if mats.any? {|mat| mat.length != len}

    mats.inject do |acc,el| 
        
        matrix_addition(acc,el)

    end

    

end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def check_line(linha)

    first = linha.first

    linha.all? {|el| el == first}

end

def squarocol?(arr)

    return true if arr.any? {|line| check_line(line)} # could have used uniq method
    return true if arr.transpose.any? {|line| check_line(line)}

    return false

end

puts 
puts "Squarocol? >>>>>>>>"
puts 

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

def squaragonal?(arr)

    i=0
    diag1 = []
    diag2 = []
    while i<arr.length
        diag1 << arr[i][i]
        diag2 << arr[i][-(1+i)] 
        i+=1
    end

    return true if check_line(diag1) || check_line(diag2)
    return false

end

puts
puts "Squaragonal? >>>>>>>>>>>"
puts
p squaragonal?([
    [:x, :y, :o],
    [:x, :x, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [:x, :y, :o],
    [:x, :o, :x],
    [:o, :o, :x],
]) # true

p squaragonal?([
    [1, 2, 2, 7],
    [1, 1, 6, 7],
    [0, 5, 1, 7],
    [4, 2, 9, 1],
]) # true

p squaragonal?([
    [1, 2, 2, 5],
    [1, 6, 5, 0],
    [0, 2, 2, 7],
    [5, 2, 9, 7],
]) # false

def pascal_line(n)

    return [1] if n == 1
    return [1,1] if n == 2
    # except from first and last element which are always 1
    # the rest is the sum of the ones up and to the left (i-1)
    arr = [1] # first element is always one
    i = 1 # start iterating from second element
    while i < n-1 # n-1 because last element is always one
        arr << (pascal_line(n-1)[i] + pascal_line(n-1)[i-1])
        i+=1
    end
    arr << 1
    arr
end

def pascals_triangle(num)

    arr = []

    i = 1

    while i <= num

        arr << pascal_line(i)

        i+=1
    end

    arr

end

puts
puts "Pascals_triangle >>>>>>>>> "
puts
p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]


def is_prime?(num)

    return false if num<2

    (2...num).none? {|factor| num%factor == 0}

end

def mersenne_prime(num)

    count = 0
    i = 1

    until count == num 

        i += 1
        count += 1 if is_prime?((2**i)-1)
        
    end

    (2**i)-1

end

def is_triangular?(num)

    i = 1

    while (i*(i+1)/2) < num
        i += 1
    end

    return (i*(i+1)/2) == num

end

def triangular_word?(word)

    alpha = ("a".."z").to_a

    indexes = (0...word.length).map {|n| (alpha.index(word[n])+1)}

    is_triangular?(indexes.sum)

end

def consecutive_collapse(arr)


    flag = true

    while flag

        idx=0

        found = false

        flag = false

        while (!found) && (idx<(arr.length-1))

            

            if arr[idx] == (arr[idx+1]-1) || arr[idx] == (arr[idx+1]+1)

                found = true # stop this interaction and start over because found one 
                flag = true # set to run all over again
                arr = arr[0...idx] + arr[idx+2..-1]

            end

            

            idx += 1 
            
        end

    end

    arr


end
            
puts
puts "Consecutive collapse >>>>>>>>>>>"
puts
p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []


def n_prime(num, n) #return the nth prime from a given number

    i = num
    count = 0 

    while count < n 

        i += 1
        if is_prime?(i)
            count += 1
        end
    end

    return i
end

def n_neg_prime(num, n)

    i = num
    count = 0

    while (i > 0) && (count < -n)

        i -= 1

        if is_prime?(i)

            count += 1

        end

    end

    return i if count == -n 

end

def pretentious_primes(arr, n)

    if n>0 
        return arr.map {|el| n_prime(el,n)}
    else
        return arr.map {|el| n_neg_prime(el,n)}
    end
end

puts
puts "Pretentious primes >>>>>>>>>>"
puts
p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]





