class Person < ActiveRecord::Migration[5.1]
  validates :name, :house_id
  def change
    create_table :people do |t|
      t.string :name
      t.integer :house_id
    end
  end
end
