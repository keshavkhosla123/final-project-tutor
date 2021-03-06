# == Schema Information
#
# Table name: subjects_can_teaches
#
#  id         :integer          not null, primary key
#  num        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#  user_id    :integer
#
class SubjectsCanTeach < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:subject, { :required => true, :class_name => "Subject", :foreign_key => "subject_id" })
  validate :can_teach_competence 
  def can_teach_competence
    if SubjectNeedHelpIn.where(:user_id => self.id).count > 0
      errors.add(:user,"You can't teach something you need help in!")
    end
    
  end


end
