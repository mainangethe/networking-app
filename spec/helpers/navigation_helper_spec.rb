require 'rails_helper'

RSpec.describe NavigationHelper, :type => :helper do

  context 'signed in user' do
    before(:each) { helper.stub(:user_signed_in?).and_return(true) }

    context '#login_and_profile_links_generator' do
      it "returns signed_in_links partial's path" do
        expect(helper.login_and_profile_links_generator).to (
          eq 'layouts/navigation/collapsible_elements/signed_in_links'
        )
      end
    end
  end

  context 'non-signed in user' do
    before(:each) { helper.stub(:user_signed_in?).and_return(false) }

    context '#login_and_profile_links_generator' do
      it "returns non_signed_in_links partial's path" do
        expect(helper.login_and_profile_links_generator).to(
          eq 'layouts/navigation/collapsible_elements/non_signed_in_links'
        )
      end
    end
  end

end
