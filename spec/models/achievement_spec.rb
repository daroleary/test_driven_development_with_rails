require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Achievement, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).scoped_to(:user_id).with_message("you can't have two achievements with the same title") }
    it { should validate_presence_of(:user) }
    it { should belong_to(:user) }

    it 'converts markdown into html' do
      achievement = Achievement.new(description: 'Awesome **thing** I *actually* did')
      expect(achievement.description_html).to include('<strong>thing</strong>')
      expect(achievement.description_html).to include('<em>actually</em>')
    end
  end
end