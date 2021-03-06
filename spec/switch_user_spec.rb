require 'spec_helper'
require 'switch_user'

describe SwitchUser do
  it "has a default provider" do
    SwitchUser.provider.should == :devise
  end

  describe "#available_scopes" do
    it "returns a list of available scopes" do
      SwitchUser.available_scopes.should == [:user]
    end
  end

  describe "assigning the provider" do
    it "sets the provider" do
      # ensure we aren't breaking existing functionality
      SwitchUser.provider = :sorcery
      SwitchUser.provider.should == :sorcery
    end
    it "sets the provider class" do
      SwitchUser.provider = :devise
      SwitchUser.provider_class.should == SwitchUser::Provider::Devise
    end
  end
end
