class UpdateClientsTmp < ActiveRecord::Migration
  def change
    change_table :clients do |t|
      t.time :tmp_debut
      t.time :tmp_fin
    end
  end
end
