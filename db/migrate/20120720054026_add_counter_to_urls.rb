class AddCounterToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :counter, :integer
    change_column_default(:urls, :counter, 0)
  end
end
