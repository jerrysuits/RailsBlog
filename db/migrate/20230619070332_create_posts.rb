class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :archive, default: false
      t.boolean :is_approved, default: false

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
