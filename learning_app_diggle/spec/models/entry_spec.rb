require 'spec_helper'

describe "entry" do
  context "associations" do
    it { should have_many(:definition) }
    it { should have_one(:word) }
  end
end