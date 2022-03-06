require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  
  describe "provjeravam rade li rute" do

    it "login success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  
   
    it "logout success" do
      get "/logout"
      follow_redirect!
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "provjeravam jeli login ruta prikazuje login stranicu" do
    subject {get "/login"}
    
    it "new.html.erb" do
      expect(subject).to render_template("sessions/new")
    end
    
    it "ne prikazuje neku drugu, krivu stranicu" do
      expect(subject).to_not render_template("sessions/create")
    end
  end
  
  
  describe "create" do
    before(:all) do
      User.create(email: "neki@email.com", password: "lozinka")
    end
    
    let(:params) {{email: "neki@email.com", password: "lozinka"}}
    
    it "uspješno" do
      post "/sessions", params: params 
      expect(response).to redirect_to(root_url)
      follow_redirect!
      expect(response).to render_template(:index)
    end
    
    it "kriva lozinka nas vodi do login stranice" do
      params[:password] = "krivalozinka"
      post "/sessions", params: params 
      expect(response).to render_template(:new)
      expect(response.body).to include("Log In")
    end
  end

end
