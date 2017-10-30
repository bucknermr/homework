require 'rails_helper'

RSpec.describe User, type: :model do

  # subject(:user) { User.new(password: 'password') }
  subject(:user) do
    FactoryBot.build(:user,
      email: 'email',
      password: 'password'
    )
  end

  it { should validate_presence_of :email }
  # it { should validate_uniqueness_of :email }
  it { should validate_presence_of :password_digest }
  it { should validate_length_of(:password).is_at_least 6 }

  it 'creates a password digest when a password is given' do
    expect(user.password_digest).to_not be_nil
  end
  it 'creates a session token after initialization' do
    expect(user.session_token).to_not be_nil
  end


  describe '#password=' do
    it 'should set password instance variable to the password argument' do
      expect(user.password).to eq('password')
    end
    it 'should set the password_digest using the password argument' do
      pw_hash = BCrypt::Password.new(user.password_digest)
      expect(pw_hash.is_password?(user.password)).to be(true)
    end
  end

  describe '#is_password?' do
    it 'verifies password is correct' do
      expect(user.is_password?('password')).to be(true)
    end
    it 'verifies password is incorrect' do
      expect(user.is_password?('notpassword')).to be(false)
    end
  end

  describe '#reset_session_token!' do
    it 'should reset user\'s session_token' do
      old_token = user.session_token
      user.reset_session_token!
      expect(user.session_token).not_to eq(old_token)
    end
    it 'should return the session_token' do
      allow(user).to receive(:reset_session_token!).and_return(user.session_token)
    end
  end

  describe '::find_by_credentials' do
    before(:each) { user.save! }
    context 'when given invalid credentials' do
      it 'returns nil' do
        expect(User.find_by_credentials('blah', 'blahah')).to eq(nil)
      end
    end
    context 'when given valid credentials' do
      it 'returns the correct user' do
        expect(User.find_by_credentials('email', 'password')).to eq(user)
      end
    end
  end
end
