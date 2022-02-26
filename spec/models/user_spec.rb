require 'rails_helper'

RSpec.describe User, type: :model do
  it "bez emaila se ne može napraviti User" do
    User.create()
    expect(User.count).to eq 0
  end
  
  it "sa praznim emailom se ne može napraviti User" do
    User.create(email: "")
    expect(User.count).to eq 0
  end
  
  it "sa krivim emailom se ne može napraviti User" do
    User.create(email: "fww@fwe")
    expect(User.count).to eq 0
  end
  
  it "velika slova u emailu se pretvaraju u mala prilikom  kreiranja" do
    k = User.create(email: "DARKO@VULIN.hr")
    expect(k.email).to eq "darko@vulin.hr"
  end
  
  it "ako je dobar email onda se User napravi" do
    User.create(email: "kokok@wfw.ju")
    expect(User.count).to eq 1
  end
  
  it "ne mogu postojati dva Usera s istim emailom" do
    User.create(email: "kokok@wfw.ju")
    User.create(email: "kokok@wfw.ju")
    expect(User.count).to eq 1
  end
end
