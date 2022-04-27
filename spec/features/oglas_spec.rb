require 'rails_helper'

RSpec.feature "Oglas", type: :feature do
  
  feature "ne trebam autentifikaciju" do
    before(:all) do
      User.create(email: "neki@email.com", password: "secret") 
      @o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
    end
  
    scenario ":index" do
      visit root_path
      expect(page).to have_content "Popis oglasa"
    end
    
    scenario ":show" do
      visit ogla_path(@o)
      expect(page).to have_content "Nazad"
    end
    
    scenario ":index preko :show" do
      visit ogla_path(@o)
      click_link "Nazad"
      expect(page).to_not have_content "Nazad"
    end
  end
  
  
  feature "trebam autentifikaciju" do
    #ovdje ne razumijem zašto ne može ići :all, a ne mora :each
    before(:each) do
      User.create(email: "neki@email.com", password: "secret") 
      @o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
    end
    
    scenario ":edit vodi na index stranicu" do
      visit edit_ogla_path(@o)
      expect(page).to have_content "Prijava"
    end
    
    scenario ":edit pa se logiramo i onda dobijemo root stranicu. Neznam zašto ne radi ovaj test. Ne uspjevam se logirati i zbog toga ne mogu testirariti ni stvaranje novog oglasa" do
      visit edit_ogla_path(@o)    
      within "form" do
        fill_in "email", with: "neki@email.com"
        fill_in "password", with: "secret"  
        click_button "Ulogiraj se"
      end
      #expect(page).to have_content "Email"
      expect(page).to have_content "Prijavili ste se!"
    end
      
  end
end
