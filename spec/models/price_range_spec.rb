# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PriceRange do

  subject { FactoryGirl.create :price_range }

  it { should validate_presence_of :price }
  it { should validate_presence_of :increment_value }
  it { should validate_presence_of :category }
  
end