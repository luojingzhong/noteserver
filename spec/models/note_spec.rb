require 'spec_helper'

describe Note do
    before { @note = FactoryGirl.create(:note) }
    it { expect(@note).to respond_to(:notebook_id) }
    it { expect(@note).to respond_to(:notebook) }
    it { expect(@note).to respond_to(:user_id) }
    it { expect(@note).to respond_to(:user) }
    it { expect(@note).to respond_to(:title) }
    it { expect(@note).to respond_to(:content) }
    it { expect(@note).to respond_to(:share) }

    describe "当title为空" do
        before { @note.title = " " }
        it { expect(@note).to be_invalid }
    end

    describe "当title过长" do
        before { @note.title = 'a' * 21 }
        it { expect(@note).to be_invalid }
    end

    describe "当user_id为空" do
        before { @note.user_id = nil }
        it { expect(@note).to be_invalid }
    end

    describe "当notebook_id为空" do
        before { @note.notebook_id = nil }
        it { expect(@note).to be_invalid }
    end
end
