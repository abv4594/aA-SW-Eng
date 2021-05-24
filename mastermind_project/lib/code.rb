class Code

  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(chars)
    
    chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}

  end

  def self.random(n)

      chars = []
      #n.times {chars<<POSSIBLE_PEGS.keys[rand(4)]} 
      n.times {chars<<POSSIBLE_PEGS.keys.sample} 
      Code.new(chars)

  end

  def self.from_string(pegs)

    Code.new(pegs.split(""))

  end

  def initialize(chars)

    if Code.valid_pegs?(chars) 

      @pegs = chars.map(&:upcase)

    else

      raise "invalid pegs"

    end

  end
  
  def [](i)

    self.pegs[i]

  end

  def length
    self.pegs.length
  end

  def num_exact_matches(code_guess)

    num = 0

    (0...code_guess.length).each { |i| 
      num += 1 if code_guess[i] == self[i]}

    num

  end

  def num_near_matches(code_guess)

    num = 0

    (0...code_guess.length).each { |i| 
      num += 1 if self.pegs.include?(code_guess[i]) && code_guess[i]!=self[i] }

    num

  end

  def ==(other_code)

    other_code.pegs == self.pegs

    

  end

end
