require 'rails_helper'

RSpec.describe Emotion, type: :model do
  
    describe "Direct Associations" do

    it { should have_one(:perspective) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
