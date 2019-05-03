# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'
require'bcrypt'

RSpec.describe User, type: :model do

    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }
    it {should validate_length_of(:password).is_at_least(6)}
    it { should have_many(:goals)}
    it { should have_many(:comments)}

    describe 'uniqueness' do 

        before(:each) do
            create(:user)
        end
        
        it {should validate_uniqueness_of(:session_token)}
        it {should validate_uniqueness_of(:username)}
    end


    describe "find_by_credentials" do
        let!(:user) { create(:user) } 

        context "when user exists" do 
           it 'should find user' do
                expect(User.find_by_credentials(user.username, user.password)).to eq(user)
           end
        end 
        context "when user does not exist" do
            it 'should return nil' do 
                expect(User.find_by_credentials(user.username, 'userpassword')).to be(nil)
            end
        end
    end

    describe '#is_password?' do 
        let!(:user) {create(:user)}

        context 'when password is correct' do
            it 'should return true' do
                expect(user.is_password?('magicisreal')).to be(true)
            end
        end
        
        context 'when password is incorrect' do 
            it 'should return false' do
                expect(user.is_password?('magicisnotreal')).to be(false)
            end
        end
    end

    describe '#password=' do 
        let!(:user) {create(:user)}

        it 'should set instance variable of password' do 
            expect(user.password).to eq('magicisreal')
        end

        it 'should set a password digest using BCrypt::Password.create' do
            expect(BCrypt::Password.new(user.password_digest).is_password?('magicisreal')).to be(true)
        end
    end

    describe '#reset_session_token!' do
    let!(:user) {create(:user)}

    it 'should save new value to session token' do 
        # save old, test that token changed
        old_val = user.session_token
        user.reset_session_token!
        expect(user.session_token).not_to eq(old_val)
    end
    
    it 'should return a value for session token' do
        user.reset_session_token!
        expect(user.session_token).not_to be(nil)
    end 
    
    end
end



# username, password_digest, password (length), session_token
# validation, assosiation, uniqueness, class scope
# Find_by_creds, Is_password, Generate_session_token, Validate_session_token
# After-initiation, Password=, Ensure_session_token, Reset_session_token
