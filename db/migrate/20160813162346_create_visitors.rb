class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.integer :visitor_id
      t.integer :user_id
      t.date :visited_at

      t.timestamps null: false
    end

    add_index :visitors, [:visitor_id, :user_id, :visited_at], unique: true
    add_index :visitors, [:user_id, :updated_at]
  end
end
