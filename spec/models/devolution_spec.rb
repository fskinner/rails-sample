# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Devolution do

  subject { FactoryGirl.create :devolution }

  it { should validate_presence_of :date }
  it { should validate_presence_of :midia_status }
  
end