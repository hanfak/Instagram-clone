require 'spec_helper'

describe User, type: :model do
  it { should validate_presence_of :user_name }
end
