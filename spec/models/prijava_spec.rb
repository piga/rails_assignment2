require 'rails_helper'

RSpec.describe Prijava, type: :model do
  context "oglas one-to_many asocijacija" do
    let (:params) {{ime_i_prezime: "Stella Maleš", dat_rodenja: Date.today, email: "fsfs@ffw.fd", telefon: "87295-420", boraviste: "Zadar 56 ulica mora", str_sprema: "SSS"}}
    
    before(:each) do
      @o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
      params[:ogla_id] = @o.id
      Prijava.create(ime_i_prezime: "Stella Maleš", dat_rodenja: Date.today, email: "fsfs@ffw.fd", telefon: "87295420", boraviste: "Zadar 56 ulica mora", str_sprema: "SSS", ogla_id: @o.to_param)
      Prijava.create(ime_i_prezime: "Darko Vulin", dat_rodenja: Date.today, email: "fwioj@wef.j", telefon: "582092453", boraviste: "Zagreb ulica Slavojie 43", str_sprema: "SSS", ogla_id: @o.to_param)
    end
  
    it "oglas bi trebao imati dvije prijave" do
      expect(@o.prijavas.count).to eq 2
    end
    
    it "se trebaju uništiti kad se njihov oglas uništi" do
      @o.destroy
      expect(Ogla.all.count).to eq 0
    end
  end
  
  
  context "validations ali morali smo se pobrinuti da je prije toga napravljen oglas i asocijacija s njim" do
        
    let (:params) {{ime_i_prezime: "Stella Maleš", dat_rodenja: Date.today, email: "fsfs@ffw.fd", telefon: "87295420", boraviste: "Zadar 56 ulica mora", str_sprema: "SSS"}}
   
    before(:each) do
      o = Ogla.create(naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today, do: Date.tomorrow)
      params[:ogla_id] = o.id
    end
    
    it "ime i prezime ne smiju biti prazni" do
      p = Prijava.new(params.except(:ime_i_prezime))
      expect(p.save).to eq false
    end
    
    it "datum rođenja ne smije biti prazan" do
      p = Prijava.new(params.except(:dat_rodenja))
      expect(p.save).to eq false
    end
    
    it "email ne smiju biti prazan" do
      p = Prijava.new(params.except(:email))
      expect(p.save).to eq false
    end
    
    it "telefon ne smije biti prazan" do
      p = Prijava.new(params.except(:telefon))
      expect(p.save).to eq false
    end
    
    it "boravište ne smije biti prazno" do
      p = Prijava.new(params.except(:boraviste))
      expect(p.save).to eq false
    end
    
    it "stručna sprema mora biti jedna od onih opcija" do
      params[:str_sprema] = "nešto"
      p = Prijava.new(params)
      expect(p.save).to eq false
    end
    
    
    it "email mora započeti slovom ili brojem" do
      params[:email] = "@fet.je"
      p = Prijava.new(params)
      expect(p.save).to eq false
    end
    
    it "email mora sadržavati znak @" do
      params[:email] = "gefet.je"
      p = Prijava.new(params)
      expect(p.save).to eq false
    end
    
    it "email mora završavati nekom domenom" do
      params[:email] = "gefet@efef"
      p = Prijava.new(params)
      expect(p.save).to eq false
    end
    
    it "telefon ne smije imati slova" do
      params[:telefon] = "453534ege42"
      p = Prijava.new(params)
      expect(p.save).to eq false
    end
    
    it "telefon ne smije imati znakove osim slova" do
      params[:telefon] = "453534 42"
      p = Prijava.new(params)
      expect(p.save).to eq false
    end
    
    it "očekuj uspješno spremanje kad je sve u redu" do
      p = Prijava.new(params)
      expect(p.save).to eq true
    end
  end
end
