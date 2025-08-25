class CreateFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :facilities do |t|
      t.string :name, null: false, default: ""
      t.string :slug, null: false, default: ""
      t.string :headline, null: false, default: ""
      t.string :description, null: false, default: ""
      t.string :description1, null: false, default: ""
      t.string :description2, null: false, default: ""
      t.timestamps
    end
    add_index :facilities, :name, unique: true
    add_index :facilities, :slug, unique: true
  end
end
