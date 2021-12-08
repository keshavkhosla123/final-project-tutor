# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  bio             :text
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:subjects_can_teaches, { :class_name => "SubjectsCanTeach", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:subject_need_help_ins, { :class_name => "SubjectNeedHelpIn", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:messages_recieved, { :class_name => "Message", :foreign_key => "recipient_id", :dependent => :destroy })
  has_many(:messages_sent, { :class_name => "Message", :foreign_key => "sender_id", :dependent => :destroy })
  has_many(:looking_for_help_subjects, { :through => :subject_need_help_ins, :source => :subject })
  has_many(:interests, { :through => :subject_need_help_ins, :source => :subject })
  has_many(:reviews, {:class_name =>"Comment", :foreign_key=>"reviewed_id"})




end
