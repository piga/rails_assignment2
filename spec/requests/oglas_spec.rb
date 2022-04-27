require 'rails_helper'

RSpec.describe "Oglas", type: :request do
  
  describe "index" do
    it "uspješno" do
      get oglas_path
      expect(response).to be_successful
    end
  end
  
  describe "show" do
    it "uspješno" do
      o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
      get oglas_path(o)
      expect(response).to be_successful
    end
  end
  
  
  describe "new" do
    before(:each) do
      get new_ogla_path
    end
    
    it "nismo autentificirani pa nećemo dobiti new template" do
      follow_redirect!
      expect(response).to_not render_template("oglas/new")
    end
    
    it "nismo autentificirali pa će nas vratiti na index stranicu" do
      follow_redirect!
      expect(response).to render_template("index")
    end
  end
  
  describe "create" do
    before(:each) do
      User.create(email: "neki@email.com", password: "lozinka")
    end
    
    let(:params_session) {{email: "neki@email.com", password: "lozinka"}}
    
    it "nismo autentificirani pa nas vraća na index" do
      post "/oglas", :params => {:ogla => {naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki10@domena.com", od: Date.today, do: Date.tomorrow}}
      follow_redirect!
      expect(response).to render_template("index")
    end
    
    it "autentificirali smo se pa moežmo CREATE i dobijemo show" do
      post "/sessions", params: params_session
      post "/oglas", :params => {:ogla => {naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki10@domena.com", od: Date.today, do: Date.tomorrow}}
      follow_redirect!
      expect(response).to render_template(:show)    
      expect(response.body).to include "Ogla was successfully created."
    end
    
    it "neuspješno jer je krivi email" do
      post "/sessions", params: params_session
      post "/oglas", :params => {:ogla => {naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki10@domena", od: Date.today, do: Date.tomorrow}}
      expect(response).to render_template(:new)    
    end
  end
  
  describe "edit" do
    before(:all) do
      @o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
    end
    before(:each) do
      get edit_ogla_path(@o)
    end
        
    it "nećemo dobiti edit.html" do
      expect(response).to_not render_template("oglas/edit")
    end
    
    it "nema autentifikacije pa nas vraća na index" do
      follow_redirect!
      expect(response).to render_template("index")   
    end
  end
  
  describe "update" do
    before(:all) do
      User.create(email: "neki@email.com", password: "lozinka")
      @o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
    end
    
    let(:params_session) {{email: "neki@email.com", password: "lozinka"}}
    
    it "nema autentifikacije pa nas vraća na index" do
      patch ogla_url(@o), params: {ogla: {naziv: "novo ime"}}
      follow_redirect!
      expect(response).to render_template("index")
    end
    
    it "sa uspješnom autentifikacijom i točnim update podacima dobijemo show" do
      post "/sessions", params: params_session
      patch ogla_url(@o), :params => {:ogla => {naziv: "neko novo ime"}}
      follow_redirect!
      expect(response).to render_template(:show)
      expect(response.body).to include "Oglas was successfully updated."
    end
    
    it "krivi email nas ne vodi do npr. show" do
      post "/sessions", params: params_session
      patch ogla_url(@o), :params => {:ogla => {email:"krivi@email"}}
      expect(response).to_not render_template(:show)    
    end
    
    it "krivi email nas vodi do edit" do
      post "/sessions", params: params_session
      patch ogla_url(@o), :params => {:ogla => {email:"krivi@email"}}
      expect(response).to_not render_template(:edi)    
    end
  end
  
  describe "destroy" do
    before(:all) do
      User.create(email: "neki@email.com", password: "lozinka")
      @o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
    end
    
    let(:params_session) {{email: "neki@email.com", password: "lozinka"}}
    
    it "nema autentifikacije pa nas vraća na index" do
      delete "/oglas/#{@o.id}"  #neznam zašto mi tu nije params uspjelo  
      follow_redirect!
      expect(response).to render_template("index")
    end
    
    it "sa autentifikacijom možemo delete i dobijemo index stranicu" do
      post "/sessions", params: params_session
      delete "/oglas/#{@o.id}"  #neznam zašto mi tu nije params uspjelo  
      follow_redirect!
      expect(response).to render_template(:index)
      expect(response.body).to include "Ogla was successfully destroyed."
    end
  end
end
