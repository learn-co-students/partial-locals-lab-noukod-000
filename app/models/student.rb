# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)
    results=nil
    if(query.strip.empty?)
      results=Student.all
    else
      results=Student.where("name LIKE '%#{query}%'")
    end
    results
  end
 end
