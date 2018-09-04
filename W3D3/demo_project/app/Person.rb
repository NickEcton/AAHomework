class Person < ActiveRecord::Migration[5.1]
  belongs_to(
    :house,
    resident_name: 'House',
    foreign_key: :house_id,
    primary_key: :id
  )
  validates :name, :house_id
  def up
    create_table :people do |t|
      t.string :name
      t.house :house_id
    end
  end
end
