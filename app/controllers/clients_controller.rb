# encoding: utf-8
class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.json
  @titre_de_la_fenetre = "Feuille de temps"
  def index
    @titre_de_la_fenetre = "Menu Client"
    @clients = Client.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end
  def demare_compteur
    @toggle_temps = 1
    @tmp_debut_temps = Time.now
    @client = Client.find(params[:id])
    @feuille = Feuille.new(params[:client])
    respond_to do |format|
      @feuille.client_id = @client.id
      format.html {render new_feuille.html.erb }
      format.json { render json: @client }
    end
  end
  def arrete_compteur
    @toggle_temps = 0
    @tmp_fin_temps = Time.now
    @client = Client.find(params[:id])
    @feuille = Feuille.new(params[:client])
    @feuille.nc += (@tmp_fin_temps - @tmp_debut_temps)
    respond_to do |format|
      @feuille.client_id = @client.id
      format.html {render new_feuille.html.erb }
      format.json { render json: @client }
    end
  end
  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
    @titre_de_la_fenetre = "Édition"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end
  def show_feuilles
    @client = Client.find(params[:id])
    @titre_de_la_fenetre = "Feuille de temps"
    if @client.feuilles.empty?
      redirect_to clients_path, notice: "Il n'y a pas de feuilles pour le client #{@client.nom}"
     return
    end
    @titre_de_la_fenetre = "Les feuilles de #{@client.nom} "
    @last_path = "feuilles_du_client"
    respond_to do |format|
      format.html # show_feuilles.html.erb
      format.json { render json: @client }
    end
  end
  def new_feuille
    @client = Client.find(params[:id])
    @feuille = Feuille.new(params[:client])
    @titre_de_la_fenetre = "Nouvelle feuille de #{@client.nom}"
    @toggle_temps = 0 if @toggle_temps == nil
    respond_to do |format|
      @feuille.client_id = @client.id
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end
  def edit_feuille
    @client = Client.find(params[:client_id])
    @feuille = Feuille.find(params[:id])
    @titre_de_la_fenetre = "Feuille de temps"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
    @titre_de_la_fenetre = "Feuille de temps"
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to show_feuilles_client_path, notice: 'Le client a été mis à jour.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    @titre_de_la_fenetre = "Feuille de temps"
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end
  def suivant

  end
  def precedant

  end
end
