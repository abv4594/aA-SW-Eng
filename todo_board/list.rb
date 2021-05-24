require_relative './item.rb'

class List

    attr_accessor :label

    def initialize(label)

        @label = label
        @items = []

    end

    def [](index)
        return nil if !valid_index?(index)
        @items[index]
    end

    def []=(index,value)
        @items[index] = value
    end

    def add_item(title, deadline, description='')
        return false if !Item.valid_date?(deadline)
        @items << Item.new(title,deadline,description)
        true
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0 || index > self.size
        true
    end

    def swap(index_1,index_2)
        return false if !(valid_index?(index_1) && valid_index?(index_2))
        self[index_1],self[index_2] = self[index_2], self[index_1]
        return true
    end

    def priority
        self[0]
    end

    def print

        puts '-------------------------------------------------' #50
        puts ''.ljust(25-(label.length/2)) + label.upcase 
        puts '-------------------------------------------------' #50
        puts 'Index'.ljust(6) + '| ' + 'Item'.ljust(22) + '| ' + 'Deadline'.ljust(11)+'| Done'
        puts '-------------------------------------------------' #50
        (0...size).each do |i|
            if self[i].done
                mark = '✓'
            else
                mark = ' ' 
            end
            puts "#{i.to_s.ljust(6)}| #{self[i].title.ljust(22)}| #{self[i].deadline} | [#{mark}] "
        end
        puts '-------------------------------------------------' #50
    end

    def print_full_item(index)
        
        if self.valid_index?(index)

            if self[index].done
                mark = '✓'
            else
                mark = ' ' 
            end

            puts "-------------------------------------------------"
            puts "#{self[index].title.ljust(32)}#{self[index].deadline.ljust(14)}[#{mark}]"
            puts self[index].description
            puts "-------------------------------------------------"
        end
    end

    def print_priority

        print_full_item(0)

    end

    def up(index, amount=1)

        return false if !self.valid_index?(index)

        i = index

        while i>0 && amount>0
            self[i], self[i-1] = self[i-1], self[i]
            i -= 1
            amount -= 1
        end

        true
    end
    
    def down(index,amount=1)

        return false if !self.valid_index?(index)

        i = index

        while i<(self.size - 1) && amount>0
            self[i],self[i+1] = self[i+1],self[i]
            i += 1
            amount -= 1
        end
        true
    end

    def sort_by_date!

        @items.sort_by! {|item| item.deadline}

    end

    def toggle_item(index)

        return false if !self.valid_index?(index)

        self[index].toggle 

    end
    
    def remove_item(index)

        return false if !self.valid_index?(index)

        @items.delete_at(index)

        true

    end

    def purge

        @items.uniq.each {|item| @items.delete(item) if item.done}

    end


end
