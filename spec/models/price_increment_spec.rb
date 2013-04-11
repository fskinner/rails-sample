# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PriceIncrement do

  subject { FactoryGirl.create :price_increment }

  it { should validate_presence_of :value }
  
end