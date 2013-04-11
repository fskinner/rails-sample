# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Gender do

  subject { FactoryGirl.create :gender }

  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  
end