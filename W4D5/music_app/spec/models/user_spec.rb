require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject(:user) {User.new(email: "ecton.nick@gmail.com", password: 'starwars')}

  describe 'validations' do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_length_of(:password)}
  end
end
