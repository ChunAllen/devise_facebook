class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.string :title
      t.string :company
      t.string :location
      t.string :from_month
      t.integer :from_year
      t.integer :to_month
      t.integer :to_year
      t.text :description

      t.timestamps
    end
  end
end
