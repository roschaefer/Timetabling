class CurriculaController < ApplicationController
  before_action :set_curriculum, only: [:show, :edit, :update, :destroy]

  # GET /curricula
  # GET /curricula.json
  def index
    @curricula = Curriculum.all
  end

  # GET /curricula/1
  # GET /curricula/1.json
  def show
  end

  # GET /curricula/new
  def new
    @curriculum = Curriculum.new
  end

  # GET /curricula/1/edit
  def edit
  end

  # POST /curricula
  # POST /curricula.json
  def create
    @curriculum = Curriculum.new(curriculum_params)

    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to @curriculum, notice: 'Curriculum was successfully created.' }
        format.json { render :show, status: :created, location: @curriculum }
      else
        format.html { render :new }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curricula/1
  # PATCH/PUT /curricula/1.json
  def update
    respond_to do |format|
      if @curriculum.update(curriculum_params)
        format.html { redirect_to @curriculum, notice: 'Curriculum was successfully updated.' }
        format.json { render :show, status: :ok, location: @curriculum }
      else
        format.html { render :edit }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curricula/1
  # DELETE /curricula/1.json
  def destroy
    @curriculum.destroy
    respond_to do |format|
      format.html { redirect_to curricula_url, notice: 'Curriculum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curriculum_params
      params.require(:curriculum).permit(:name, :ects_module_ids => [])
    end
end
