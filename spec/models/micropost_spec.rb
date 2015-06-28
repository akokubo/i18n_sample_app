require 'spec_helper'

describe Micropost do
  before do
    @user = User.create(name: "Example User", email: "user@example.com")
    @micropost = @user.microposts.build(content: "Lorem ipsum")
  end

  subject { @micropost }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq @user }

  it { should be_valid }
end
