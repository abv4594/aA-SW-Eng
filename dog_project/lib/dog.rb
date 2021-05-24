class Dog
    def initialize (name,breed,age,bark,favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end

    def breed
        @breed
    end

    def age
        @age
    end

    def bark
        if @age>3
            @bark.upcase
        else
            @bark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end

    def name=(str)
        @name = str
    end

    def breed=(str)
        @breed = str
    end

    def age=(num)
        @age = num
    end

    def bark=(str)
        @bark = str  
    end

    def favorite_foods=(arr)
        @favorite_foods = arr
    end

    def favorite_food?(str)
        # first try: @favorite_foods.include?(str.capitalize) not so future-proof
        # after watching:

        @favorite_foods.map(&:upcase).include?(str.upcase) # genial!

    end

end


