require 'spec_helper'

describe Definition do
  context "associations" do
    it {should belong_to(:entry)}
  end
end