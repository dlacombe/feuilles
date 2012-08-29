class Feuille < ActiveRecord::Base
  attr_accessible :client_id, :debut, :fin, :nc, :surtemps, :travail_effectuer, :voyagement
  belongs_to :client
end
