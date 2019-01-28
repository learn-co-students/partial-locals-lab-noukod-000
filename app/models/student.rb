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

  def self.search(p)
    if p.present?
      where('NAME LIKE ?', "%#{p}%")
    else
      self.all
    end
  end

  # def self.search(params)
  #   if params.gsub("r").present?
  #    where('NAME LIKE ?', "%#{r}%")
  #   else
  #     self.all
  #   end
  # end
end
