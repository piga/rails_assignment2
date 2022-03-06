require 'rails_helper'

RSpec.feature "Oglas", type: :feature do
  feature "ne trebam autentifikaciju" do
    before(:all) do
      User.create(email: "neki@email.com", password: "secret") 
      @o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
    end
  
    scenario ":index" do
      visit root_path
      expect(page).to have_content "Oglas"
    end
    
    scenario ":show" do
      visit ogla_path(@o)
      expect(page).to have_content "Email"
    end
    
    scenario ":index preko :show" do
      visit ogla_path(@o)
      click_link "Back"
      expect(page).to_not have_content "Email"
    end
  end
  
  
  feature "trebam autentifikaciju" do
    before(:all) do
      User.create(email: "neki@email.com", password: "secret") 
      @o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
    end
    
    scenario ":edit vodi na login stranicu" do
      visit edit_ogla_path(@o)
      expect(page).to have_content "Lozinka"
    end
    
    scenario ":edit pa se logiramo i onda dobijemo root stranicursa " do
      visit edit_ogla_path(@o)
      fill_in "Email", with: "neki@email.com"
      fill_in "Lozinka", with: "secret"
      click_button "Log in"
      expect(page).to have_content "Tražimo radnika koji zna ..."
    end
      
  end
end
