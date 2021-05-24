class Bootcamp

    def initialize(name,slogan,student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, key| hash[key] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(new_teacher)
        @teachers << new_teacher
    end

    def enroll(new_student)

        if @students.length < @student_capacity
            @students << new_student
            return true
        else 
            return false
        end

    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        students.length/teachers.length
    end


    def add_grade (student, grade)
        #after watching the walkthrough:

        if self.enrolled?(student) #looks better using an already existing method
            @grades[student]<<grade
            true
        else
            return false
        end


        #first implementation:
        # return false if !@students.include?(student)
        # @grades[student] << grade
        # true
    end

    def num_grades(student)

        @grades[student].length

    end

    def average_grade(student)

        if self.num_grades(student)>0 #if student is not enrolled length will be 0 anyway
            @grades[student].sum/self.num_grades(student)
        end

    end


  
end
