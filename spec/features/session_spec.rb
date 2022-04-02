require 'rails_helper'

RSpec.feature "Sessions", type: :feature do
  context "provjeravam dali postoje elementi na stranici za prijavu korisnika" do
    
    before(:each) do 
      visit oglas_path  
    end

    
    scenario "pronalazim link Prijava" do
      expect(page).to have_content("Prijava")
    end
    
    scenario "login modal je skriven" do
      expect(page).to have_css(".modal", visible: :hidden)
    end
    
    
    scenario "klik na Prijava mi otvara modal" do 
      click_on("Prijava")
      expect(page).to have_css(".modal", visible: :visible)
    end
    
    scenario "email polje u modalu ima sve potrebne atribute" do 
      click_on("Prijava")
      expect(page.has_field?("email", class: "form-control")).to eq true
      expect(page.has_css?("#emailInput")).to eq true
    end
    
    scenario "krivo ispunjavam login" do 
      click_on("Prijava")   
      expect(page).to have_content("Modal title")
    end
  end
  
  context "nemožeš se prijaviti ako si unio" do
    before(:each) do
      User.create(email: "neki@email.com", password: "lozinka")
      visit oglas_path
      click_on("Prijava")
    end
    
    after(:each) do
      click_button "Ulogiraj se"
      expect(page).to have_content("Unijeli ste pogrešan email ili lozinku.")
    end
    
    it "krivi email" do
        fill_in "Email", with: "netocni@email.com"
        fill_in "Lozinka", with: "lozinka"
    end
    
    it "netočna lozinku" do
        fill_in "Email", with: "neki@email.com"
        fill_in "Lozinka", with: "loza"
    end
    
    it "nema lozinke" do
        fill_in "Email", with: "neki@email.com"
    end
    
    it "nema emaila" do
        fill_in "Lozinka", with: "lozinka"
    end
  end
  
  context "možeš se prijaviti ako su ti" do
    it "email i lozinka točni" do
      User.create(email: "neki@email.com", password: "lozinka")
      visit oglas_path

      click_on "Prijava"
      fill_in "Email", with: "neki@email.com"
      fill_in "Lozinka", with: "lozinka"
      click_button "Ulogiraj se"

      expect(page).to have_content("Prijavili ste se!")
      expect(page.has_link?("Odjava", visible: :visible)).to eq true
    end
  end
end
