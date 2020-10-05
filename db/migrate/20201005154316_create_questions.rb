class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :statement
      t.text :text
      t.string :answer
      t.integer :daily_access
      t.string :discipline

      t.timestamps
    end
  end
end
