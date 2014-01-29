require 'spec_helper'

describe Word do
  context "associations" do
    it {should belong_to(:entry)}
  end
end