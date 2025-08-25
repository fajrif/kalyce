class CreateSpecialists < ActiveRecord::Migration[7.1]
  def change
    create_table :specialists do |t|
      t.string :name, null: false, default: ""
      t.string :slug, null: false, default: ""
      t.string :headline, null: false, default: ""
      t.string :description, null: false, default: ""
    end
    add_index :specialists, :name, unique: true
    add_index :specialists, :slug, unique: true
  end
end
