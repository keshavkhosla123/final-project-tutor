class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :subject_course_num
      t.string :name
      t.string :prof_name

      t.timestamps
    end
  end
end
