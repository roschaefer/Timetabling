class EctsModulesController < ApplicationController
  before_action :set_ects_module, only: [:show, :edit, :update, :destroy]

  # GET /ects_modules
  # GET /ects_modules.json
  def index
    @ects_modules = EctsModule.all
  end

  # GET /ects_modules/1
  # GET /ects_modules/1.json
  def show
  end

  # GET /ects_modules/new
  def new
    @ects_module = EctsModule.new
  end

  # GET /ects_modules/1/edit
  def edit
  end

  # POST /ects_modules
  # POST /ects_modules.json
  def create
    @ects_module = EctsModule.new(ects_module_params)
    @ects_module.course_ids = params[:ects_module][:course_ids]

    respond_to do |format|
      if @ects_module.save
        format.html { redirect_to @ects_module, notice: 'ects module was successfully created.' }
        format.json { render :show, status: :created, location: @ects_module }
      else
        format.html { render :new }
        format.json { render json: @ects_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ects_modules/1
  # PATCH/PUT /ects_modules/1.json
  def update
    @ects_module.course_ids = params[:ects_module][:course_ids]
    
    respond_to do |format|
      if @ects_module.update(ects_module_params)
        format.html { redirect_to @ects_module, notice: 'ects module was successfully updated.' }
        format.json { render :show, status: :ok, location: @ects_module }
      else
        format.html { render :edit }
        format.json { render json: @ects_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ects_modules/1
  # DELETE /ects_modules/1.json
  def destroy
    @ects_module.destroy
    respond_to do |format|
      format.html { redirect_to ects_modules_url, notice: 'ects module was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ects_module
      @ects_module = EctsModule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ects_module_params
      params.require(:ects_module).permit(:name,:course_ids)
    end
end
