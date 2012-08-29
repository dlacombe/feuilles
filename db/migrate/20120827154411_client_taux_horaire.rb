class ClientTauxHoraire < ActiveRecord::Migration
  def change
    change_table :clients do |t|
      t.decimal :taux_horaire, :precision => 8, :scale => 2
    end
  end
end
