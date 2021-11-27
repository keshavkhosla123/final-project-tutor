class CreateSubjectNeedHelpIns < ActiveRecord::Migration[6.0]
  def change
    create_table :subject_need_help_ins do |t|
      t.integer :user_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
