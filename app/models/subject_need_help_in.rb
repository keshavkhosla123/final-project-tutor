# == Schema Information
#
# Table name: subject_need_help_ins
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  subject_id :integer
#  user_id    :integer
#
class SubjectNeedHelpIn < ApplicationRecord
end
