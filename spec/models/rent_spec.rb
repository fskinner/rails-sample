# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Rent do

  subject { FactoryGirl.create :rent }

  it { should validate_presence_of :initial_value }
  it { should validate_presence_of :date }

  describe '#rent_game' do
    context 'given a game' do

      game_to_rent = FactoryGirl.create :game
      user_renting = FactoryGirl.create :user

      it 'should create a new rent' do
        new_rent = Rent.rent_game game_to_rent, user_renting
        new_rent.should_not be_nil
      end

      it 'should have a deliverer scheduled' do
        new_rent = Rent.rent_game game_to_rent, user_renting
        new_rent.deliverer.should_not be_nil
      end

      it 'should have a history register added' do
        new_rent = Rent.rent_game game_to_rent, user_renting
        new_rent.history.should_not be_nil
      end

    end
	end

  describe '#return_game' do
    context 'given a game' do

      target_rent = FactoryGirl.create :rent

      it 'should create a new devolution' do
        target_rent.return_game
        target_rent.devolution.should_not be_nil
      end

      it 'should set game availability to true' do
        target_rent.return_game
        target_rent.game.available.should be_true
      end

      it 'should have a history register added' do
        target_rent.return_game
        target_rent.history.should_not be_nil
      end

    end
  end

end