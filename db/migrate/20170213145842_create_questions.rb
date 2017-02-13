class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :question, null: false

      t.timestamps
    end
  end
end
