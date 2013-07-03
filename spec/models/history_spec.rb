# -*- encoding : utf-8 -*-
require 'spec_helper'

describe History do

  subject { FactoryGirl.create :history }

  it { should validate_presence_of :transaction_type }
  it { should validate_presence_of :value }
  it { should validate_presence_of :message }
  it { should validate_presence_of :date }
  
  describe '#retrieve_credits' do
    context 'given an invalid value' do

      it 'should return false' do
      	retrieving_user = FactoryGirl.create :user
        return_value = History.retrieve_credits retrieving_user, 130
        return_value.should be_false
      end

    end

    context 'given a valid value' do

      it 'should update user credits' do
      	retrieving_user = FactoryGirl.create :user
        return_value = History.retrieve_credits retrieving_user, 110
        retrieving_user.shopcredit.should be_equal 10
      end

      it 'should create a debit history entry' do
      	retrieving_user = FactoryGirl.create :user
        return_value = History.retrieve_credits retrieving_user, 110
        retrieving_user.histories.first.transaction_type.should == "Debit"
      end

      it 'should create a credit history entry' do
      	retrieving_user = FactoryGirl.create :user
        return_value = History.retrieve_credits retrieving_user, 110
        retrieving_user.histories.last.transaction_type.should == "Credit"
      end

    end
  end

end