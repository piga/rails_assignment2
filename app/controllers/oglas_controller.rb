class OglasController < ApplicationController
  
  before_action :authorize, except: [:index, :show]
  
  before_action :set_ogla, only: %i[ show edit update destroy ]

  # GET /oglas or /oglas.json
  def index
    @oglas = Ogla.all
  end

  # GET /oglas/1 or /oglas/1.json
  def show
    @prijava = @ogla.prijavas.build
  end

  # GET /oglas/new
  def new
    @ogla = Ogla.new
  end

  # GET /oglas/1/edit
  def edit
  end

  # POST /oglas or /oglas.json
  def create
    @ogla = Ogla.new(ogla_params)

    respond_to do |format|
      if @ogla.save
        format.html { redirect_to ogla_url(@ogla), notice: "Ogla was successfully created." }
        format.json { render :show, status: :created, location: @ogla }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ogla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oglas/1 or /oglas/1.json
  def update
    respond_to do |format|
      if @ogla.update(ogla_params)
        format.html { redirect_to ogla_url(@ogla), notice: "Ogla was successfully updated." }
        format.json { render :show, status: :ok, location: @ogla }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ogla.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /oglas/1 or /oglas/1.json
  def destroy
    @ogla.destroy

    respond_to do |format|
      format.html { redirect_to oglas_url, notice: "Ogla was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  
    def user_name
      "ddd"
    end
  
    def set_ogla
      @ogla = Ogla.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ogla_params
      params.require(:ogla).permit(:naziv, :opis, :poslodavac, :email, :kategorija, :od, :do, :istekao)
      #nisam siguran jeli treba tu biti :istekao
    end
end
