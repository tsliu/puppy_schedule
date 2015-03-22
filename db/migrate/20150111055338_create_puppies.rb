class CreatePuppies < ActiveRecord::Migration
  def change
    create_table :puppies do |t|
      t.belongs_to :user,                               index: true
      t.string :name,                      null: false
      t.date   :dob,                       null: false, index: true
      t.string :breed,                     null: false, index: true
      t.timestamps null: false
    end
  end
end
