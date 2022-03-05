require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  context "interakcija s Log In botunom na root stranici" do

    before(:each) do 
      visit oglas_path  
    end

    
    scenario "pronalazim log in botun" do
      expect(page).to have_content("Log In")
    end
    
    
    scenario "log in me vodi do stranice sa emailom" do 
      click_on("Log In")   
      expect(page).to have_content("Email")
    end
    
    scenario "log in me vodi do stranice sa lozinkom" do 
      click_on("Log In")   
      expect(page).to have_content("Lozinka")
    end
  end
  
  context "neuspješno logiranje" do
    before(:each) do
      User.create(email: "neki@email.com", password: "lozinka")
      visit "/login"
    end
    
    after(:each) do
      expect(page).to have_content("Unijeli ste pogrešan email ili lozinku.")
    end
    
    it "krivi email" do
        fill_in "Email", with: "netocni@email.com"
        fill_in "Lozinka", with: "lozinka"
        click_button "Log in"
    end
    
    it "netočna lozinku" do
        fill_in "Email", with: "neki@email.com"
        fill_in "Lozinka", with: "loza"
        click_button "Log in"
    end
    
    it "nema lozinke" do
        fill_in "Email", with: "neki@email.com"
        click_button "Log in"
    end
    
    it "nema emaila" do
        fill_in "Lozinka", with: "lozinka"
        click_button "Log in"
    end
  end
  
  context "uspješno logiranje" do
    it "email i lozinka točni" do
      User.create(email: "neki@email.com", password: "lozinka")
      visit "/login"
      
      fill_in "Email", with: "neki@email.com"
      fill_in "Lozinka", with: "lozinka"
      click_button "Log in"
          
      expect(page).to have_content("Prijavili ste se!")
    end
  end
end
