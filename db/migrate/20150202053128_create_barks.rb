class CreateBarks < ActiveRecord::Migration
  def change
    create_table :barks do |t|
      t.integer :sender_id,                             index: true, null: false
      t.integer :receiver_id,                           index: true, null: true
      t.integer :priority,                                           null: false
      t.text :preview,                                             null: false
      t.text :text,                                                null: false
      t.timestamps                                                   null: false
    end
  end
end
