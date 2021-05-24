# Write a method, max_inject(arr), that accepts any amount of numbers arguments and returns
# the largest number. Solve this using the built-in inject.

# 16.01.2020 - got it right at first, after reviewing the syntax.

def max_inject (*args)
    
    args.inject do |acc, n| 

        if n>acc
           n
        else
            acc 
        end
    end
end



p max_inject(1, -4, 0, 7, 5)  # => 7
p max_inject(30, 28, 18)      # => 30
