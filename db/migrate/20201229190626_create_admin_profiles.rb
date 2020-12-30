class CreateAdminProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_profiles do |t|
      t.references :admin
      t.string :name
      t.string :phone

      t.timestamps
    end
  end
end
