class House < ActiveRecord::Migration[5.1]
  has_many(
    :residents,
    resident_name: 'Person',
    foreign_key: :house_id,
    primary_key: :id
  )
  validates :address
  def up
    create_table :houses do |t|
      t.address :address
    end
  end
end
