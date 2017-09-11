require 'spec_helper'

describe Notebook do
    before { @book = FactoryGirl.create(:notebook) }
    it { expect(@book).to respond_to(:user_id) }
    it { expect(@book).to respond_to(:user) }
    it { expect(@book).to respond_to(:notes) }
    it { expect(@book).to respond_to(:name) }

    describe "当name为空" do
        before { @book.name = " " }
        it { expect(@book).not_to be_valid }
    end

    describe "name长度过长" do
        before { @book.name = "a" * 11 }
        it { expect(@book).not_to be_valid }
    end

    describe "当user_id为空" do
        before { @book.user_id = nil }
        it { expect(@book).not_to be_valid }
    end
end
