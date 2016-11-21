require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it {should have_one :profile}
    it {should have_many :posts}
    it {should have_many :feeds}
  end
end
