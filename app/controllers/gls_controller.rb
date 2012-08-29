class GlsController < ApplicationController
  # GET /gls
  # GET /gls.json
  def index
    @gls = Gl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @gls }
    end
  end

  # GET /gls/1
  # GET /gls/1.json
  def show
    @gl = Gl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gl }
    end
  end

  # GET /gls/new
  # GET /gls/new.json
  def new
    @gl = Gl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @gl }
    end
  end

  # GET /gls/1/edit
  def edit
    @gl = Gl.find(params[:id])
  end

  # POST /gls
  # POST /gls.json
  def create
    @gl = Gl.new(params[:gl])

    respond_to do |format|
      if @gl.save
        format.html { redirect_to @gl, notice: 'Gl was successfully created.' }
        format.json { render json: @gl, status: :created, location: @gl }
      else
        format.html { render action: "new" }
        format.json { render json: @gl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /gls/1
  # PUT /gls/1.json
  def update
    @gl = Gl.find(params[:id])

    respond_to do |format|
      if @gl.update_attributes(params[:gl])
        format.html { redirect_to @gl, notice: 'Gl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gls/1
  # DELETE /gls/1.json
  def destroy
    @gl = Gl.find(params[:id])
    @gl.destroy

    respond_to do |format|
      format.html { redirect_to gls_url }
      format.json { head :no_content }
    end
  end
end
