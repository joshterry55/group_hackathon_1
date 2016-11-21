require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to :profile}
    it { should belong_to :user}
    it { should belong_to :feed}
  end
end
