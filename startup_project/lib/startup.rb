require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)

        @salaries.has_key?(title)

    end

    def >(another_startup)

        self.funding > another_startup.funding

    end

    def hire(employee_name, title)

        if self.valid_title?(title)

            @employees << Employee.new(employee_name, title)

        else

            raise "title is invalid" 

        end

    end

    def size

        @employees.length

    end

    def pay_employee (employee)

        salary = @salaries[employee.title]

        if self.funding>= salary

            employee.pay(salary)

            @funding -= salary

        else

            raise "not enough funding!"

        end

    end    

    def payday

        @employees.each {|employee| pay_employee(employee)}
        
    end

    def average_salary

        sum = 0

        @employees.each {|employee| sum += @salaries[employee.title]}

        sum*1.0/@employees.length

    end

    def close

        @employees = []

        @funding = 0

    end

    def acquire(another_startup)

        # add funding
        @funding += another_startup.funding

        # merge salaries
        another_startup.salaries.each { |title, salary| 
            @salaries[title]=salary if !@salaries.has_key?(title)}

        #@salaries = @salaries.merge(another_startup.salaries) { |key, oldval, newval| oldval}


        @employees += another_startup.employees 

        another_startup.close

        
    end




end


            


