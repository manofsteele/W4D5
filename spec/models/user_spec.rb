# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
  # subject(:user) do
  #   FactoryBot.build(:user,
  #     email: "jonathan@fakesite.com",
  #     password_digest: "good_password",
  #     username: "Jonathan")
  # end
    subject(:user) { FactoryBot.build(:user)}
  
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:session_token)}  
    # it { should validate_length_of(:password).is_at_least(6)}
    
    it { should validate_uniqueness_of(:email)}
    it { should validate_uniqueness_of(:password_digest)}
    it { should validate_uniqueness_of(:username)}
    it { should validate_uniqueness_of(:session_token)}
    
    
    end
    
    describe 'class methods' do 
      # subject(:user) { FactoryBot.build(:user)}

      describe '::find_by_credentials' do 
        it 'should find the user given right credentials' do 
          user = User.create(email: "nadav@nadav.com", username: "Nadav", password: "123456")
          found_user = User.find_by_credentials("Nadav", "123456")
          expect(user.username).to eq(found_user.username)
        end 
        
        it 'should return nil without right credentials' do 
          user = User.create(email: "nadav@nadav.com", username: "Nadav", password: "123456")
          found_user = User.find_by_credentials("Nadav", "654321")
          expect(found_user).to be_nil
        end   
      end
    end   
end
