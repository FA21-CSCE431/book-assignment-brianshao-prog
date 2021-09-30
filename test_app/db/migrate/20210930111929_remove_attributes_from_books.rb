class RemoveAttributesFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :price, :float
    remove_column :books, :published_date, :date
  end
end
