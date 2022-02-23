class CreateFileUploadQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :file_upload_questions do |t|
      t.string :name

      t.timestamps
    end
  end
end
