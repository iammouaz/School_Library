require_relative 'person'

class Teacher < Person
    def initialize(age:, Name: 'Unknown', parent_permission: true, specialization:)
        @specialization = specialization
    end

    def can_use_services
        true
    end