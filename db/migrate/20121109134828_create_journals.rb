class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :name
      t.string :gender
      t.date :birthdate
      t.integer :user_id

      t.timestamps
    end
  end
end
