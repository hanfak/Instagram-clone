# create a post with factory_girl
# visit '/'
# click on an image link
# expect to be taken to the show page of our post

require 'rails_helper'

feature 'displays one posts' do
  scenario 'click on post and view single post' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    expect(page.current_path).to eq(post_path(post))
  end
end
