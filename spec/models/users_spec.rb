require 'spec_helper'

describe User, type: :model do
  it { should validate_presence_of :user_name }
  it {should validate_length_of(:user_name).is_at_least(4)}
  it {should validate_length_of(:user_name).is_at_most(16)}
  it { should validate_uniqueness_of(:user_name) }
end
