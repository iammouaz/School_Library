class Person
    attr_accessor :name, :age
    attr_reader :id

    def initialize(name: "Unknown", age:, parent_permission: true)
    end

    def can_use_services? 
        is_of_age? || @parent_permission
    end
    

    def is_of_age?
        if @age >= 18
        end
    end
