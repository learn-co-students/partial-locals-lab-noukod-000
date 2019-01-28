class ClassroomsController < ApplicationController
  def show

    @classroom = Classroom.find(params[:id])
    @student = @classroom.oldest_student
    puts @student.inspect
  end

  def index
    Classroom.all.each_with_index do |classroom, i|
      classroom.students << [Student.limit(8).offset(i*2)]
    end
    @classrooms = Classroom.all
  end
end
