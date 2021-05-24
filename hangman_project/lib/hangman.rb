class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word

    DICTIONARY.sample

  end

  def initialize

    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5

  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end
  
  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)

    attempted_chars.include?(char)

  end

  def get_matching_indices(char)

    temp_arr = []
    @secret_word.each_char.with_index {|x,i| temp_arr << i if x == char}
    temp_arr
    # remember we can also iterate over a string with each_char
    # @secret_word.split("").each_with_index.inject ([]) {|acc, (letter,i)| acc << i if letter == char}

  end

  def fill_indices (char, arr)

    arr.each {|x| @guess_word[x]=char}

  end

  def try_guess (char)
    
    if self.already_attempted?(char) 
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << char

    matching_indices = self.get_matching_indices(char)

    @remaining_incorrect_guesses -= 1 if matching_indices.empty?
    #remember to use method empty? instead of == []

    self.fill_indices(char,matching_indices)

    true
    
  end

  def ask_user_for_guess

    puts "Enter a char:"

    self.try_guess (gets.chomp) #remember gets.chomp as argument
 
  end




  def win?

    if @guess_word.join("") == @secret_word

      puts "WIN!"

      return true
    else
      return false
    end

  end

  def lose?

    if @remaining_incorrect_guesses == 0

      print "LOSE"

      return true

    else

      return false

    end 
  end

  def game_over?

    if self.lose? or self.win?
      puts @secret_word
      return true
    else
      return false
    end
  end


end



