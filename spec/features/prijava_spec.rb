require 'rails_helper'

RSpec.feature "Prijavas", type: :feature do
  
  context "interakcija s formom" do
    before(:each) do
      @o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow) 
      visit ogla_path(@o)  
      within("form") do
        fill_in("Ime i prezime", with: "Darko Vulin")
        fill_in("Dat rodenja", with: Date.today)
        fill_in("Email", with: "darko@gmail.com")
        fill_in("Telefon", with: 2380422)
        fill_in("Boraviste", with: 2380422)
        select("SSS", from: "Str sprema")
      end
    end
    
    
    scenario "pronalazim formu tako da pronađem npr. telefon polje" do
      expect(page).to have_content("Telefon")
    end
    
    
    scenario "pravilno popunjavam" do   
      click_on("Create")   
      expect(page).to have_content("prijava was successfully created.")
    end
    
    scenario "krivo popunjavam" do
      within("form") do
        #krivo ću popuniti ovo polje
        fill_in("Ime i prezime", with: "")
      end   
      click_on("Create")   
      expect(page).to have_content("error")
    end
  end
  
end
