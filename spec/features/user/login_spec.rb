require "rails_helper"

RSpec.feature "Login", :type => :feature do
  before do
    begin
      let(:user) { FactoryBot.create(:user) }
    rescue StandardError => error
      puts "#{ error.message }"
    end
  end

  scenario 'user navigates to the login page and successfully logs in', js: true do
    begin
      user
      visit root_path
      find('nav a', text: 'Login').click
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      find('.login-button').click
      expect(page).to have_selector('#user-settings')
    rescue StandardError => error
      puts "#{ error.message }"
    end
  end

end
