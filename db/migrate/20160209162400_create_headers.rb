class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.string :title
      t.text :description
      t.text :used_at
      t.timestamps
    end

     add_attachment :headers, :photo
  end
end
