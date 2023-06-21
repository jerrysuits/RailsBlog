class AddAnotherColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :archive, :boolean, default: false
  end
end
