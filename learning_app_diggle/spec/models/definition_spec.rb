require 'spec_helper'

describe "definition" do
  context "associations" do
    it {should belong_to(:entry)}
  end
end