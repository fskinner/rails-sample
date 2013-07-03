# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Devolution do

  subject { FactoryGirl.create :devolution }
  
	describe '#confirm_return' do
    context 'given a devolution' do

      it 'should create a date' do
        subject.confirm_return
        subject.date.should_not be_nil
      end

      it 'should set game availability to true' do
        subject.confirm_return
        subject.rent.game.available.should be_true
      end

    end
  end

end