class PrijavasController < ApplicationController
  before_action :get_ogla
  
  #ova metoda je možda i nepotrebna jer se prijavi pristupa preko ogla/show
=begin
  def new
    @prijava = @ogla.prijavas.build
  end
=end
  def get
  end

  def create
    @prijava = @ogla.prijavas.build(prijava_params.except(:zivotopis))
    
    respond_to do |format|
      if @prijava.save
        PrijavaMailer.with(prijava: @prijava, oglas: @ogla).nova.deliver_later
        #upload
        flash[:success] = "prijava was successfully created."
        format.html { redirect_to ogla_path(@ogla) }
        format.json { render :show, status: :created, location: @prijava }
      else
        format.html { render "oglas/show", status: :unprocessable_entity }
        format.json { render json: @prijava.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
  
    def get_ogla
      @ogla = Ogla.find(params[:ogla_id])
    end
=begin
    def upload
      uploaded_file = params[:prijava][:zivotopis]
      File.open(Rails.root.join("public", "uploads", uploaded_file.original_filename), "wb") do |file|
        file.write(uploaded_file.read)
      end
    end
=end
    # Only allow a list of trusted parameters through.
    def prijava_params
      params.require(:prijava).permit(:ime_i_prezime, :dat_rodenja, :email, :telefon, :boraviste, :str_sprema, :ogla_id, :zivotopis)
    end
  
    
end
