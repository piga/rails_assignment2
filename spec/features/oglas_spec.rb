require 'rails_helper'

RSpec.feature "Oglas", type: :feature do
  before(:each) do
    User.create(email: "as@as.as", password_digest: "secret") 
  end
  
  scenario "za :index NE trebam autentifikaciju" do
    visit root_path
    expect(page).to have_content "Oglas"
  end
  
  scenario "za :show trebam autentifikaciju" do
    Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
    
    auth_prozor = window_opened_by do
      visit ogla_path(@o)
    end
    
    within_window auth_prozor do
      fill_in "User name", with: "few"
      fill_in "Password", with: "jijoi"
      click_button "Log in"
    end
    
    expect(page).to have_content "Oglas"
  end
end
