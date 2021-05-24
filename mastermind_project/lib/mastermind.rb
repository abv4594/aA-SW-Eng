require_relative "code"

class Mastermind

    def initialize(len)

        @secret_code = Code.random(len)

    end

    def print_matches(a_code)

        puts "exact matches: #{@secret_code.num_exact_matches(a_code)}"
        puts "near matches: #{@secret_code.num_near_matches(a_code)}"


    end

    def ask_user_for_guess

        puts "Enter a code"
        guess = Code.from_string(gets.chomp)
        print_matches(guess)
        guess == @secret_code

    end


end
