require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    User.destroy_all  #ovo sma morao dodati jer sam iz nekog razloga imao na početku puno Usera
  end
  
  it "bez emaila se ne može napraviti User" do
    User.create()
    expect(User.count).to eq 0
  end
  
  it "bez password_digesta ne može se napraviti User" do
    User.create(email: "fww@wefw.gt")
    expect(User.count).to eq 0
  end
  
  it "sa krivim emailom se ne može napraviti User" do
    User.create(email: "fww@fwe")
    expect(User.count).to eq 0
  end
  
#iz nekog razloga mi ne želi pretvarati slova prije spremanja
  it "velika slova u emailu se pretvaraju u mala prilikom  kreiranja" do
    User.create(email: "DARKO@VULIN.hr", password_digest: "fiowjf43few")
    user = User.find_by(email: "DARKO@VULIN.hr")
    expect(user).to be_a_new User
  end
  
  it "ako je dobar email onda se User napravi" do
    User.create(email: "darko@vulin.eu", password: "secret")
    expect(User.count).to eq 1
  end
  
#iz nekog razloga mi ne želi provjeravati jedinstvenost emaila
  it "ne mogu postojati dva Usera s istim emailom" do
    User.create(email: "kokok@wfw.ju", password: "98fwj8fw98")
    User.create(email: "kokok@wfw.ju", password: "98fwj8fw98")
    expect(User.count).to eq 1
  end
end
