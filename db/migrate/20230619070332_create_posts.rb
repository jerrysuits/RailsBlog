class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      # t.boolean :archive

      t.timestamps
    end
  end
end
