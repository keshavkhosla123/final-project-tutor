class AddReviewedToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :reviewed_id, :integer
  end
end
