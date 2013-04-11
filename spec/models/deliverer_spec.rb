# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Deliverer do

  subject { FactoryGirl.create :deliverer }

  it { should validate_presence_of :date }
  
end