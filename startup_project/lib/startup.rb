require "employee"

class Startup

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def name
        @name
    end
    
    def funding
        @funding
    end

    def salaries
        @salaries
    end

    def employees
        @employees
    end

    def valid_title?(title)
        @salaries.each do |titles, salaries|
            if @salaries.has_key?(title)
                return true
            else
                return false
            end
        end
    end

    def >(other_startup)
        if self.funding > other_startup.funding 
            return true
        else
            return false
        end
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise
        end
    end

    def size
        @employees.length
    end


    def pay_employee(employee)
        payment = @salaries[employee.title]
        if @funding >= payment
            employee.pay(payment)
            @funding -= payment
        else
            raise
        end 
    end

    def payday
        @employees.each do |employee|
            self.pay_employee(employee)
        end
    end 


    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end

        avg = sum / @employees.length 
    end

    def close
        @employees = []
        @funding = 0
    end

    
    def acquire(another_startup)
        @funding += another_startup.funding

        another_startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end

        @employees += another_startup.employees

        another_startup.close 
    end



end
