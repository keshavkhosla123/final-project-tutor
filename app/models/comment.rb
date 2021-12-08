# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  body        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  reviewed_id :integer
#  user_id     :integer
#
class Comment < ApplicationRecord
  #validates(:commenter {:presence=> true})
   
  def commenter 
    my_user_id = self.user_id
    matching users = User.where({:id => my_user_id})
    the_user = matching_users.at(0)
  end

end
