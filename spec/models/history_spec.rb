# -*- encoding : utf-8 -*-
require 'spec_helper'

describe History do

  subject { FactoryGirl.create :history }

  it { should validate_presence_of :transaction_type }
  it { should validate_presence_of :value }
  it { should validate_presence_of :message }
  
end