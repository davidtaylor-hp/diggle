require 'spec_helper'

describe "word" do
  context "associations" do
    it {should belong_to(:entry)}
  end
end