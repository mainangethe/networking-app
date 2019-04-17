require "rails_helper"

RSpec.feature "Infinite scroll", :type => :feature do

  Post.per_page = 15

  let(:check_posts_count) do
    expect(page).to have_selector('.single-post-list', count: 15)
    page.execute_script("$(window).scrollTop($(document).height())")
    expect(page).to have_selector('.single-post-list', count: 30)
  end

  scenario "User scrolls down the hobby branch page and posts list will be appended with more older posts", js: true do
    create_list(:post, 30, category: create(:category, branch: 'hobby'))
    visit hobby_posts_path
    check_posts_count
  end

  scenario "User scrolls down the study branch page and posts list will be appended with more older posts", js: true do
    create_list(:post, 30, category: create(:category, branch: 'study'))
    visit study_posts_path
    check_posts_count
  end

  scenario "User scrolls down the team branch page and posts list will be appended with more older posts", js: true do
    create_list(:post, 30, category: create(:category, branch: 'team'))
    visit team_posts_path
    check_posts_count
  end


end
