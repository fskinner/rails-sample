# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Console do

  subject { FactoryGirl.create :console }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  
end