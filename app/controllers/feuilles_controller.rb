# encoding: utf-8
class FeuillesController < ApplicationController
  # GET /feuilles
  # GET /feuilles.json
  def index
    @feuilles = Feuille.all
    @clients = Client.all
    @titre_de_la_fenetre = "Feuille de temps des clients"
    @last_path = "feuilles_des_clients"
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feuilles }
    end
  end
  # GET /feuilles/1
  # GET /feuilles/1.json
  def show
    @feuille = Feuille.find(params[:id])
    @nom_client = Client.find(@feuille.client_id).nom
    @titre_de_la_fenetre = "Feuille de temps"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feuille }
    end
  end

  # GET /feuilles/new
  # GET /feuilles/new.json
  def new
    @feuille = Feuille.new
    @feuille.surtemps = 0.00
    @feuille.voyagement = 0.00
    @feuille.nc = 0.00
    #@clients = Client.all
    #@feuille.client_id = params[client][id]
    #@feuille.client_id = params[@clients][:id]
    @titre_de_la_fenetre = "Nouvelle feuille de temps"
    @last_path = request.fullpath
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feuille }
    end

  end

  # GET /feuilles/1/edit
  def edit
    @feuille = Feuille.find(params[:id])
    #@client = Client.find(params[:id])
    @titre_de_la_fenetre = "Feuille de temps"
  end

  # POST /feuilles
  # POST /feuilles.json

  def create
    @feuille = Feuille.new(params[:feuille])
    @client = Client.find(@feuille.client_id)
    if @feuille.fin == @feuille.debut
      @feuille.fin = Time.now
    end
    respond_to do |format|
      if @feuille.save
        format.html { redirect_to show_feuilles_client_path(@client), notice: "Une nouvelle feuille a été créé" }
        format.json { render json: @feuille, status: :created, location: @feuille }
      else
        format.html { render action: "new" }
        format.json { render json: @feuille.errors, status: :unprocessable_entity }
      end
    end
  end
  # PUT /feuilles/1
  # PUT /feuilles/1.json
  def update
    @feuille = Feuille.find(params[:id])
    @client = Client.find(@feuille.client_id)
    @titre_de_la_fenetre = "Feuille de temps"
    respond_to do |format|
      if @feuille.update_attributes(params[:feuille])
        format.html { redirect_to show_feuilles_client_path(@client), notice: "La feuille du (#{@feuille.debut.strftime("%Y/%m/%d")}) été mis à jour" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feuille.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feuilles/1
  # DELETE /feuilles/1.json
  def destroy
    @feuille = Feuille.find(params[:id])
    @client = Client.find(@feuille.client_id)
    @titre_de_la_fenetre = "Feuille de temps"
    feuille = @feuille
    @feuille.destroy
    respond_to do |format|
        format.html { redirect_to (:back), notice: "La feuille du client ***#{@client.nom} au #{feuille.debut.strftime("%Y/%m/%d")}*** a été DÉTRUITE" }
        format.json { head :no_content }
    end
  end

end # class FeuillesController
