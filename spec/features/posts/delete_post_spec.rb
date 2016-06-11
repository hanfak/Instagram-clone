# create an example post using factory_girl
# visit the root route
# click on the image to 'show' the individual post
# click on the 'Edit Post' button to enter the edit view
# click on the 'Delete Post' button
# expect to be routed to the root again.
# expect to see the message "Problem solved!  Post deleted."
# expect to not see the old post anymore.

require 'rails_helper'

feature 'Deleting posts' do
  background do
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
