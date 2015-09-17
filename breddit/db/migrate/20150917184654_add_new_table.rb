class AddNewTable < ActiveRecord::Migration
  def change
      change_table :posts do |t|
      t.string :name
      t.text :description
    end
  end
end
