class AddNumToSubjectNeedHelpIns < ActiveRecord::Migration[6.0]
  def change
    add_column :subject_need_help_ins, :num, :string
  end
end
