require 'rails_helper'

RSpec.describe Achievement, type: :model do
  describe "validations" do
    it "requires title" do
      achievement = Achievement.new(title: '')
      achievement.valid?
      expect(achievement.errors[:title]).to include("can't be blank")
    end

    it "requires title to be unique for one user" do
      user = FactoryGirl.create(:user)
      first_achievement = FactoryGirl.create(:public_achievement, title: 'First Achievement', user: user)
      new_achievement = Achievement.new(title: 'First Achievement', user: user)
      expect(new_achievement.valid?).to be_falsey
    end

    it "allows different users to have achievements with the same title" do
      user1 = FactoryGirl.create(:user)
      user2 = FactoryGirl.create(:user)

      first_achievement = FactoryGirl.create(:public_achievement, title: 'First Achievement', user: user1)
      second_achievement = Achievement.new(title: 'First Achievement', user: user2)
      expect(second_achievement.valid?).to be_truthy
    end
  end
end