class AddImageField < ActiveRecord::Migration
  def change
    change_table :posts  do |t|
    t.string :photo
  end
  end
end
