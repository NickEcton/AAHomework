class Person < ActiveRecord::Base
  belongs_to :house, 
    class_name: 'House',
    foreign_key: :house_id,
    primary_key: :id,
    optional: true

  # validates :name, :house_id
  # def up
  #   create_table :people do |t|
  #     t.string :name
  #     t.house :house_id
  #   end
  # end
end
