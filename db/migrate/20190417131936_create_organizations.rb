class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :domain
      t.boolean :ipv6
      t.boolean :httpv6
      t.boolean :httpsv6
      t.boolean :http2v6
      t.boolean :ipv4
      t.boolean :httpv4
      t.boolean :httpsv4
      t.boolean :http2v4
      t.integer :score
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :province
      t.string :city
      t.string :area
      t.string :telephone

      t.timestamps
    end
  end
end
