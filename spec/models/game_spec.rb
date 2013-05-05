# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Game do
  subject { FactoryGirl.create :game }

  it { should validate_presence_of :name }



  describe '#rent_credit' do
    context 'given not enough credits' do

      subject { FactoryGirl.create :game }
      user_renting = FactoryGirl.create :user, shopcredit: 0

      it 'should not update available to false' do
        subject.rent_credit user_renting
        subject.available.should_not be_false
      end

      it 'should not have a rent' do
        subject.rent_credit user_renting
        subject.rents.count.should_not be 1
      end

    end

    context 'given a available game' do

      subject { FactoryGirl.create :game }
      user_renting = FactoryGirl.create :user, shopcredit: 2000

      it 'should update available to false' do
        subject.rent_credit user_renting
        subject.available.should be_false
      end

      it 'should have a rent' do
        subject.rent_credit user_renting
        subject.rents.count.should be 1
      end

    end
	end



  describe '#rent_money' do
    context 'given a available game' do

      subject { FactoryGirl.create :game }
      user_renting = FactoryGirl.create :user

      it 'should update available to false' do
        subject.rent_money user_renting
        subject.available.should be_false
      end

      it 'should have a rent' do
        subject.rent_money user_renting
        subject.rents.count.should be 1
      end

    end
  end

end