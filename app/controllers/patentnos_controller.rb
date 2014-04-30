class PatentnosController < ApplicationController
  before_action :set_patentno, only: [:show, :edit, :update, :destroy]

  # GET /patentnos
  # GET /patentnos.json
  def index
    @patentnos = Patentno.all
    respond_to do |format|
      format.html
      format.csv { send_data @patentnos.to_csv}
    end
  end

  # GET /patentnos/1
  # GET /patentnos/1.json
  def show
  end

  # GET /patentnos/new
  def new
    @patentno = Patentno.new
  end

  # GET /patentnos/1/edit
  def edit
  end

  # POST /patentnos
  # POST /patentnos.json
  def create
    @patentno = Patentno.new(patentno_params)

    respond_to do |format|
      if @patentno.save
        format.html { redirect_to @patentno, notice: 'Patentno was successfully created.' }
        format.json { render action: 'show', status: :created, location: @patentno }
      else
        format.html { render action: 'new' }
        format.json { render json: @patentno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patentnos/1
  # PATCH/PUT /patentnos/1.json
  def update
    respond_to do |format|
      if @patentno.update(patentno_params)
        format.html { redirect_to @patentno, notice: 'Patentno was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @patentno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patentnos/1
  # DELETE /patentnos/1.json
  def destroy
    @patentno.destroy
    respond_to do |format|
      format.html { redirect_to patentnos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patentno
      @patentno = Patentno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patentno_params
      params.require(:patentno).permit(:patno)
    end
end
