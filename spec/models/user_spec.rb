require 'spec_helper'

describe User do
  before { @user = User.new(name: "Example User", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:microposts) }

  it { should be_valid }

  describe "micropost associations" do
    before do
      @user.save
      @user.microposts.create([
        {content: "Lorem ipsum"},
        {content: "Lorem ipsum"}
      ])
    end

    it "should destroy associated microposts" do
      microposts = @user.microposts.to_a
      @user.destroy
      expect(microposts).not_to be_empty
      microposts.each do |micropost|
        expect(Micropost.where(id: micropost.id)).to be_empty
      end
    end
  end
end
