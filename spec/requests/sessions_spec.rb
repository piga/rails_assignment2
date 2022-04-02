require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  
=begin
Nema potreba za ovim jer mi je login unutar modala inema rute ali zanimljivo je vidjeti ovaj subject
  describe "provjeravam jeli login ruta prikazuje login stranicu" do
    subject {get "/login"}
    
    it "new.html.erb" do
      expect(subject).to render_template("sessions/new")
    end
    
    it "ne prikazuje neku drugu, krivu stranicu" do
      expect(subject).to_not render_template("sessions/create")
    end
  end
=end
  
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
      expect(response).to redirect_to(root_url)
    end
  end

end
