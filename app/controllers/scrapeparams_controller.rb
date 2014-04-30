class ScrapeparamsController < ApplicationController
  before_action :set_scrapeparam, only: [:show, :edit, :update, :destroy]

  # GET /scrapeparams
  # GET /scrapeparams.json
  def index
    @scrapeparams = Scrapeparam.all
  end

  # GET /scrapeparams/1
  # GET /scrapeparams/1.json
  def show
  end

  # GET /scrapeparams/new
  def new
    @scrapeparam = Scrapeparam.new
  end

  # GET /scrapeparams/1/edit
  def edit
  end

  # POST /scrapeparams
  # POST /scrapeparams.json
  def create
    @scrapeparam = Scrapeparam.new(scrapeparam_params)

    respond_to do |format|
      if @scrapeparam.save
        format.html { redirect_to @scrapeparam, notice: 'Scrapeparam was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scrapeparam }
      else
        format.html { render action: 'new' }
        format.json { render json: @scrapeparam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrapeparams/1
  # PATCH/PUT /scrapeparams/1.json
  def update
    respond_to do |format|
      if @scrapeparam.update(scrapeparam_params)
        format.html { redirect_to @scrapeparam, notice: 'Scrapeparam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scrapeparam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrapeparams/1
  # DELETE /scrapeparams/1.json
  def destroy
    @scrapeparam.destroy
    respond_to do |format|
      format.html { redirect_to scrapeparams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrapeparam
      @scrapeparam = Scrapeparam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scrapeparam_params
      params.require(:scrapeparam).permit(:url, :pages)
    end
end
