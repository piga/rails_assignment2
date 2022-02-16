require 'rails_helper'

RSpec.describe "Prijavas", type: :request do
=begin
  describe "GET /new" do
    
    before(:each) do
      o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
    end
    
  end
=end

  describe "some routes" do 
    let (:params) {{ime_i_prezime: "Darko Vulin", dat_rodenja: Date.today, email: "fwioj@wef.j", telefon: "582092453", boraviste: "Zagreb ulica Slavojie 43", str_sprema: "SSS"}}
    
    before(:each) do
      @o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)   
      #params[:ogla_id] = @o.to_param
      params.merge(ogla_id: @o.to_param)
    end
        
    it "new" do
      #get "/oglas/:id", params: {id: @o.to_param}  neznam zašto ovo ne radi
      get ogla_path(@o)
      expect(response).to have_http_status(200)
    end
    
    it "get" do
     
      expect(:get => "/prijavas/get").not_to be_routable
    end
    
    it "create" do
      #post create_prijava_path(@o), params: {prijava: {ime_i_prezime: "Darko Vulin", dat_rodenja: Date.today, email: "fwioj@wef.j", telefon: "582092453", boraviste: "Zagreb ulica Slavojie 43", str_sprema: "SSS", ogla_id: @o.to_param}}
      post create_prijava_path(@o), params: {prijava: :params}
      follow_redirect!
      expect(response.body).to include "prijava was successfully created."
    end
    
    
    
    it "create, stavio sam krivi email" do
      post create_prijava_path(@o), params: :params
      expect(response.body).to include "prohibited this prijavas from being saved:"
    end
  end


end
