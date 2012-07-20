class AddVanityColumnToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :vanity, :string
  end
end
