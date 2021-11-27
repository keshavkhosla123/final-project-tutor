class CreateSubjectsCanTeaches < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects_can_teaches do |t|
      t.integer :user_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
