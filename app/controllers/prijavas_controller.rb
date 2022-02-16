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
    @prijava = @ogla.prijavas.build(prijava_params)
    
    respond_to do |format|
      if @prijava.save
        PrijavaMailer.with(prijava: @prijava, oglas: @ogla).nova.deliver_later
        
        format.html { redirect_to ogla_path(@ogla), notice: "prijava was successfully created." }
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

    # Only allow a list of trusted parameters through.
    def prijava_params
      params.require(:prijava).permit(:ime_i_prezime, :dat_rodenja, :email, :telefon, :boraviste, :str_sprema, :ogla_id)
    end
  
end
