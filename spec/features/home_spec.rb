require 'rails_helper'
describe "the signin process", type: :feature do
  before :each do
    # User.make(email: 'user@example.com', password: 'password')
    Capybara.default_driver = :selenium
  end

  it "don't let me sign up" do
    visit 'users/sign_in'
    click_button 'Sign up'
    within(".modal-content") do
      fill_in 'user[email]', with: 'one@mailinator.net'
      fill_in 'user_password', with: '123456'
    end
    click_on 'signitup'
    expect(page).to have_content 'Can\'t Be Blank'
  end
end
