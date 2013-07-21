# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Rent do

  subject { FactoryGirl.create :rent }

  it { should validate_presence_of :initial_value }

  describe '#accept_rent' do
    context 'given a rent' do

      it 'should create a date' do
        subject.accept_rent
        subject.date.should_not be_nil
      end

      it 'should create a Deliverer date' do
        subject.accept_rent
        subject.deliverer.should_not be_nil
      end

    end
  end

  describe '#request_rent' do
    context 'given a game' do

      game_to_rent = FactoryGirl.create :game
      user_renting = FactoryGirl.create :user

      it 'should create a new rent' do
        new_rent = Rent.request_rent game_to_rent, user_renting, "money"
        new_rent.should_not be_nil
      end

      it 'should have a blank date' do
        new_rent = Rent.request_rent game_to_rent, user_renting, "money"
        new_rent.date.should be_nil
      end

      it 'should have a history register added' do
        new_rent = Rent.request_rent game_to_rent, user_renting, "money"
        new_rent.history.should_not be_nil
      end

    end
	end

  describe '#request_return' do
    context 'given a game' do

      target_rent = FactoryGirl.create :rent
      user = FactoryGirl.create :user

      it 'should create a new devolution' do
        target_rent.request_return user
        target_rent.devolution.should_not be_nil
      end

      it 'should set game availability to true' do
        target_rent.request_return user
        target_rent.game.available.should be_true
      end

      it 'should have a history register added' do
        target_rent.request_return user
        target_rent.history.should_not be_nil
      end

    end
  end

  describe '#calculate_rent_duration' do
    context 'given starting and ending dates' do

      start_date = DateTime.now
      end_date = DateTime.now + 1.week

      it 'should return 4 days' do
        days = Rent.calculate_rent_duration start_date, end_date
        days.should be_equal 8
      end

      it 'should return 0 days' do
        days = Rent.calculate_rent_duration end_date, start_date
        days.should be_equal 0
      end

    end
  end

  describe '#return_exchange' do
    context 'given starting and ending dates' do

      days = 1

      it 'should return 130' do
        price_range = FactoryGirl.create :price_range, decrement_value: 10, price: 150
        price = Rent.return_exchange days, price_range
        price.to_i.should be_equal 140
      end

      it 'should return 0' do
        price_range = FactoryGirl.create :price_range, decrement_value: 160, price: 150
        price = Rent.return_exchange days, price_range
        price.to_i.should be_equal 0
      end

      it 'should return 140 weeks' do
        price_range = FactoryGirl.create :price_range, decrement_value: 10, price: 150
        price = Rent.return_exchange 0, price_range
        price.to_i.should be_equal 150
      end

    end
  end

end