require 'spec_helper'

describe User do
    before { @user = FactoryGirl.create(:user) }
    it { expect(@user).to respond_to(:name) }
    it { expect(@user).to respond_to(:email) }
    it { expect(@user).to respond_to(:password) }
    it { expect(@user).to respond_to(:password_digest) }
    it { expect(@user).to respond_to(:password_confirmation) }
    it { expect(@user).to respond_to(:remember_token) }
    it { expect(@user).to respond_to(:authenticate) }

    describe "当name为空" do
        before { @user.name = " " }
        it { expect(@user).not_to be_valid }
    end

    describe "name长度过长" do
        before { @user.name = "a" * 31 }
        it { expect(@user).not_to be_valid }
    end

    describe "当email为空" do
        before { @user.email = " " }
        it { expect(@user).not_to be_valid }
    end

    describe "email不合法" do
        it "应该不通过" do
            addresses = %w[user@foo,com user_at_foo.org example.user@foo. 
                                foo@bar_baz.com foo@bar+baz.com]
            addresses.each do |invalid_address|
                @user.email = invalid_address
                expect(@user).not_to be_valid
            end
        end
    end

    describe "email大小写" do
        let(:mixed_case_email) { 'Foo@ExAMPle.CoM' }
        it "应该通过" do
            @user.email = mixed_case_email
            @user.save
            expect(@user.reload.email).to eq mixed_case_email.downcase
        end
    end

    describe "密码长度小于6" do
        before { @user.password = @user.password_confirmation = "12" }
        it { expect(@user).not_to be_valid }
    end

    describe "两次输入密码不匹配" do
        before { @user.password_confirmation = "555555" }
        it { expect(@user).not_to be_valid }
    end

    describe "remember_token" do
        before { @user.save }
        it { expect(@user.remember_token).not_to be_blank }
    end
end
