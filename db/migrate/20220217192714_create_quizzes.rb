class CreateQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.integer :duration
      t.text :description
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
