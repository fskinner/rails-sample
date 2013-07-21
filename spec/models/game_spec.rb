# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Game do
  subject { FactoryGirl.create :game }

  it { should validate_presence_of :name }

end