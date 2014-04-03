class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.column :name, :string
      t.column :ingredients, :string
      t.column :steps, :string
      t.column :stars, :int

      t.timestamps
    end
  end
end
