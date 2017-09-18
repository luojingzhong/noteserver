require 'spec_helper'

describe Share do
  before { @share = FactoryGirl.create(:share) }
  it { expect(@share).to respond_to(:title) }
  it { expect(@share).to respond_to(:content) }
  it { expect(@share).to respond_to(:note_id) }
  it { expect(@share).to respond_to(:note) }

  describe "当note_id为空" do
    before { @share.note_id = nil }
    it { expect(@share).to be_invalid }
  end
end
