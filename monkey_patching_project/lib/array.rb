# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array

    def span

        if self.length>0
           self.max - self.min
        end

    end

    def average

        return nil if self.empty?

        self.sum*1.0/self.length


        # if self.length > 0
        #     soma = self.inject {|sum,ele| sum+ele}
        #     return soma*1.0/self.length
        # end

    end

    def median

        return nil if self.empty?

        new_self = self.sort

        mid = new_self.length/2

        if self.length.odd?
            return new_self[mid]
        else
            soma = new_self[mid] + new_self[mid - 1]
            return soma/2.0
        end           
    end

    def counts

        hash = Hash.new(0)

        self.each { |x| hash[x] += 1}

        hash

    end

    def my_count(arg)

        self.counts[arg]

    end

    def my_index(arg)

        self.each_with_index { |x, i| return i if x == arg}

        return nil

    end

    def my_uniq

        new_arr = []

        self.each { |x| new_arr << x if !new_arr.include?(x)}

        new_arr

    end

    def my_transpose

        new_arr = []
        new_l = []

        tam = self.length

        (0...tam).each do |c| #percorre as colunas

            (0...tam).each do |l| #percorre as linhas

                new_l << self[l][c] 

            
            end

            new_arr << new_l
            
            
            new_l = []

        end

        new_arr


    end





    



end

