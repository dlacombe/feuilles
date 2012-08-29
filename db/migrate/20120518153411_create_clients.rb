class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :code
      t.string :nom
      t.string :adresse
      t.string :ville
      t.string :province
      t.string :pays

      t.timestamps
    end
  end
end
