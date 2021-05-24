require_relative './list.rb'

class TodoBoard

    def initialize

        #@list = List.new(label)
        @lists = {}

    end

    def get_command

        print "\nEnter a command: "

        cmd, list_label, *args = gets.chomp.split(' ')

        if cmd != 'mktodo'  # needs to convert args to integers
            args.map! {|arg| arg.to_i}
        end


        case cmd

        when 'mklist'
            @lists[list_label] = List.new(list_label)
        when 'ls'
            @lists.keys.each {|label| print "\n#{label}"}
        when 'showall'
            @lists.values.each(&:print)
        when 'mktodo'
            @lists[list_label].add_item(*args)
        when 'up'
            @lists[list_label].up(*args)
        when 'down'
            @lists[list_label].down(*args)            
        when 'swap'
            @lists[list_label].swap(*args)
        when 'sort'
            @lists[list_label].sort_by_date!
        when 'priority'
            @lists[list_label].print_priority
        when 'toggle'
            @lists[list_label].toggle_item(*args)
        when 'rm'
            @lists[list_label].remove_item(*args)
        when 'purge'
            lists[list_label].purge
        when 'print'
            if args.length == 0
                @lists[list_label].print
            else
                @lists[list_label].print_full_item(*args)
            end
        when 'quit'
            return false
        else 
            print "Sorry, that command is not recognized"

        end

        true

    end


    def run 
        while self.get_command
        end
    end




end

board = TodoBoard.new

board.run
