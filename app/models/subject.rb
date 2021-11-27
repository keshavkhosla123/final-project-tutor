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
end
