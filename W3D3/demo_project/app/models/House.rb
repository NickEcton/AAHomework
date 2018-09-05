class House < ActiveRecord::Base
  has_many :people, {
    class_name: 'Person',
    foreign_key: :house_id,
    primary_key: :id
  }
  # validates :address
  # def up
  #   create_table :houses do |t|
  #     t.address :address
  #   end
  # end
end
