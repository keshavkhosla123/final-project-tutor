# == Schema Information
#
# Table name: subjects
#
#  id                 :integer          not null, primary key
#  name               :string
#  prof_name          :string
#  subject_course_num :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class Subject < ApplicationRecord
  has_many(:subjects_can_teaches, { :class_name => "SubjectsCanTeach", :foreign_key => "subject_id", :dependent => :destroy })
  has_many(:subject_need_help_ins, { :class_name => "SubjectNeedHelpIn", :foreign_key => "subject_id", :dependent => :destroy })
  has_many(:students, { :through => :subject_need_help_ins, :source => :user })
  has_many(:mentees, { :through => :subject_need_help_ins, :source => :user })

end
