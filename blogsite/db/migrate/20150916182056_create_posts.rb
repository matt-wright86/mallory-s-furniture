class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :blog
      t.text    :Body
      t.timestamps null: false
    end
  end
end
