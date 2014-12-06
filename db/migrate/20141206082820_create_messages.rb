class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :viewed, default: false

      t.timestamps
    end

    add_index :messages, :sender_id
    add_index :messages, :recipient_id
  end
end
