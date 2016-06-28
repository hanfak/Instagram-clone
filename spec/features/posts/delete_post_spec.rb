

require 'rails_helper'

feature 'Deleting posts' do
  background do
    user = create(:user)
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'fancyfrank@gmail.com'
    fill_in 'Password', with: 'illbeback'
    click_button 'Log in'

    post = create(:post, caption: 'Fun times')

    visit '/'

    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click

  end
  scenario 'Can delete a single post' do
    click_link 'Delete Post'

    expect(page).to have_content('Problem solved!  Post deleted.')
    expect(page).to_not have_content('Fun times')
  end
end
