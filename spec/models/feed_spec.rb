require 'rails_helper'

RSpec.describe Feed, type: :model do
  describe 'associations' do
    it { should have_many :posts}
    it { should belong_to :user}
  end
end
