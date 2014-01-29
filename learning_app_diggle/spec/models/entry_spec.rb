require 'spec_helper'

describe Entry do
  context "associations" do
    it { should have_many(:definitions) }
    it { should have_one(:word) }
  end

end