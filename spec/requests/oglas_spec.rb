require 'rails_helper'

RSpec.describe "Oglas", type: :request do
  
  context "testovi pregledavanja oglasa" do
=begin
iz nekog razloga mi ovo ne radi
  before(:each) do
    o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
  end
=end
  
    it "zahtjevam listu svih oglasa" do
      get oglas_path
      expect(response).to be_successful
    end

    it "uspješno možemo pogledati pojedini oglas" do
      o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
      get oglas_path(o)
      expect(response).to be_successful
    end


    it "stvara oglas i usmjerava nas na index stranicu" do
      get new_ogla_path
      expect(response).to render_template(:new)

      post "/oglas", :params => {:ogla => {naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki10@domena.com", od: Date.today, do: Date.tomorrow}}

      expect(response).to redirect_to(assigns(:ogla))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("Ogla was successfully created.")
    end

    it "uništavanje oglasa" do
      o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
      delete "/oglas/#{o.id}"  #neznam zašto mi tu nije params uspjelo  
      expect(response).to redirect_to(oglas_url)
    end

    it "editiranje i update" do
      o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
      get edit_ogla_path(o)
      expect(response).to be_successful
=begin
      patch ogla_url(o), params: {ogla: {naziv: "novo ime"}}

      expect(response).to redirect_to(assigns(:ogla))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to include("Ogla was successfully updated.")
=end
    end
  end
end
