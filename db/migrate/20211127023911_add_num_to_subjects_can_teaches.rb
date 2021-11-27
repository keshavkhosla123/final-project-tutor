class AddNumToSubjectsCanTeaches < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects_can_teach, :num, :string
  end
end
