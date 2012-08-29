class Client < ActiveRecord::Base
  attr_accessible :adresse, :code, :nom, :pays, :province, :ville, :code_postal, :email, :telephone
  has_many :feuilles
  @clients = Client.all
end
