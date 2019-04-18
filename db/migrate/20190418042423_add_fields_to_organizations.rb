class AddFieldsToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :category, :string
    add_column :organizations, :founder, :string
    add_column :organizations, :url, :string
  end
end
