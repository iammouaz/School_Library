require_relative 'person'

class Student < Person
    attr_reader :classroom

    def initialize(age:, Name: 'Unknown', parent_permission: true, classroom: 'None')
        @classroom = classroom
    end

    def play_hooky 
        "¯\(ツ)/¯"
    end