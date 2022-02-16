require 'rails_helper'

RSpec.describe Ogla, type: :model do  
  context "validacija polja" do
    let (:params) {{naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today}}
    
    it "Opis nebi smio biti prazan" do
      o = Ogla.new(params.except(:opis))
      expect(o.save).to eq false
    end
    
    it "Poslodavac ne smije biti prazan" do
      o = Ogla.new(params.except(:poslodavac))
      expect(o.save).to eq false
    end
    
    it "Email ne smije biti prazan" do
      o = Ogla.new(params.except(:email))
      expect(o.save).to eq false
    end
    
    it "email mora započeti slovom ili brojem" do
      params[:email] = "@fet.je"
      o = Ogla.new(params)
      expect(o.save).to eq false
    end
    
    it "email mora sadržavati znak @" do
      params[:email] = "gefet.je"
      o = Ogla.new(params)
      expect(o.save).to eq false
    end
    
    it "email mora završavati nekom domenom" do
      params[:email] = "gefet@efef"
      o = Ogla.new(params)
      expect(o.save).to eq false
    end
  end
  
  
  context "Aktivni i neaktivni oglasi" do
    let (:params) {{naziv: "ime", opis: "Tražimo radnika koji zna ...", poslodavac: "Tvrtka najbolja", email:"neki9@domena.com", od: Date.today}}
    
    it "neaktivan" do
      o = Ogla.create!(params.merge(do: Date.yesterday))
      expect(o.aktivan).to eq(true)
    end
    
    it "aktivan" do
      o = Ogla.create!(params.merge(do: Date.tomorrow))
      expect(o.aktivan).to eq(false)
    end
  end
end

