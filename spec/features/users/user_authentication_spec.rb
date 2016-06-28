 require 'rails_helper'

feature 'User authentication' do
  background do
    create(:user)
  end

  scenario 'can log in from the index' do
    visit '/'
    expect(page).to_not have_content('New Post')

    click_link 'Login'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    expect(page).to_not have_content('Register')
    expect(page).to have_content('Logout')
    expect(page).to have_link('New Post')
  end

  scenario 'After log in shows welcome message' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'
    expect(page).to have_content('Welcome, Arnie')
  end

  scenario 'can log out once logged in' do
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'

    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
    expect(page).to_not have_content('New Post')
    expect(page).to have_content('Register')
    expect(page).to have_content('Login')
  end
end
