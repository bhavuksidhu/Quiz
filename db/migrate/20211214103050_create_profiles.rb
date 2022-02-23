class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :phone_no
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
