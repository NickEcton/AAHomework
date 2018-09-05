class House < ActiveRecord::Migration[5.1]
  validates :address
  def change
    create_table :houses do |t|
      t.string :address
    end
  end
end
