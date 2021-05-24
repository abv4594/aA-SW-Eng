class Item

    attr_accessor :title, :description
    attr_reader :deadline, :done

    def self.valid_date?(date_string)
        # more elegant:
        check = date_string.split('-').map(&:to_i)
        ano, mes, dia = check
        return false if check.length!=3
        return false if !(0..12).include?(mes)
        return false if !(1..31).include?(dia)
        true
        # the first version below:
        # if check.length!=3 || check.first.length!=4 || check[1].to_i<1 || check[1].to_i>12 || check[2].to_i > 31 || check[2].to_i < 1
        #     return false
        # else
        #     return true
        # end
    end

    def initialize(title, deadline, description)
        raise "Please format de date as YYYY-MM-DD" if !Item.valid_date?(deadline)
        @title = title
        @deadline = deadline
        @description = description
        @done = false
    end

    def deadline=(new_deadline)
        raise "Please format de date as YYYY-MM-DD" if !Item.valid_date?(new_deadline)
        @deadline = new_deadline
    end

    def toggle
        @done = !@done
    end
end
