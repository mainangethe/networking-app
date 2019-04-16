require "rails_helper"

RSpec.feature "Visit a single post", :type => :feature do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  scenario "User goes to a single page from the homepage", js: true do
    post
    visit root_path
    # open modal
    page.find(".single-post-card").click
    expect(page).to have_selector('body .modal')
    page.driver.debug
    # open single post
    page.find(".interested a").click
    expect(page).to have_selector('#single-post-content p', text: post.content)
  end
end
