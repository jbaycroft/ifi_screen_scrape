class CaseinfosController < ApplicationController
  before_action :set_caseinfo, only: [:show, :edit, :update, :destroy]

  # GET /caseinfos
  # GET /caseinfos.json
  def index
    @caseinfos = Caseinfo.all.order(invno: :asc)
    respond_to do |format|
      format.html
      format.csv { send_data @caseinfos.to_csv}
    end
  end

  # GET /caseinfos/1
  # GET /caseinfos/1.json
  def show
  end

  # GET /caseinfos/new
  def new
    @caseinfo = Caseinfo.new
  end

  # GET /caseinfos/1/edit
  def edit
  end

  # POST /caseinfos
  # POST /caseinfos.json
  def create
    @caseinfo = Caseinfo.new(caseinfo_params)

    respond_to do |format|
      if @caseinfo.save
        format.html { redirect_to @caseinfo, notice: 'Caseinfo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @caseinfo }
      else
        format.html { render action: 'new' }
        format.json { render json: @caseinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caseinfos/1
  # PATCH/PUT /caseinfos/1.json
  def update
    respond_to do |format|
      if @caseinfo.update(caseinfo_params)
        format.html { redirect_to @caseinfo, notice: 'Caseinfo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @caseinfo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caseinfos/1
  # DELETE /caseinfos/1.json
  def destroy
    @caseinfo.destroy
    respond_to do |format|
      format.html { redirect_to caseinfos_url }
      format.json { head :no_content }
    end
  end

  # Run Screenscrape Script from Model
  def scrape
    Scrapeparam::Scrapeparam.screen_scrape
    redirect_to caseinfos_url
  end
  # Run Index Patent Numbers Script from Model
  def index_patents
    Scrapeparam::Scrapeparam.index_patents
    redirect_to caseinfos_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caseinfo
      @caseinfo = Caseinfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caseinfo_params
      params.require(:caseinfo).permit(:invno, :itmoc, :uain, :patno, :country, :respondents, :alj, :ouiiattorney, :gcattorney, :statusbeforecommission, :noticeofinv, :proceedtype, :currentphase, :invtermdate, :publishopinion, :relatedcourtdecision, :appealstatus, :disposition, :unfairactsfound, :notes, :activeexpiredremedial, :exclusioncdorders, :targetdate, :violationfinalduedate, :beginenddates, :archivist)
    end
end
