require 'rails_helper'

RSpec.describe Solution, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:emotion) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
