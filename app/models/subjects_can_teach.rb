# == Schema Information
#
# Table name: subjects_can_teaches
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#  user_id    :integer
#
class SubjectsCanTeach < ApplicationRecord
end
