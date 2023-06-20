class AddNewColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :username, :string
  end
end
