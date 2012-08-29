class CreateFeuilles < ActiveRecord::Migration
  def change
    create_table :feuilles do |t|
      t.integer :client_id
      t.datetime :debut
      t.datetime :fin
      t.text :travail_effectuer
      t.float :surtemps,   :default => 0.00
      t.float :voyagement,   :default => 0.00
      t.float :nc,      :default => 0.00

      t.timestamps
    end
  end
end
