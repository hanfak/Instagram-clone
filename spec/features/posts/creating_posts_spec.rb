require 'rails_helper.rb'
# visit the root route
# click on a button to create a new post
# fill out the bits of the form that we need.
# click the submit button
# expect the page that we’re sent to to have specific text
# expect the page to contain our photo.


feature 'Creating posts' do
  scenario 'can create a job' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/mufasa.jpg")
    fill_in 'Caption', with: 'nom nom nom #lionking'
    click_button 'Create Post'
    expect(page).to have_content('#lionking')
    expect(page).to have_css("img[src*='mufasa.jpg']")
  end

  it 'needs an image to create a post' do
  # visit root route
  # click the 'New Post' link
  visit '/'
  click_link 'New Post'
  # fill in the caption field (without touching the image field)
  fill_in 'Caption', with: 'nom nom nom #lionking'
  # click the 'Create Post' button
  click_button 'Create Post'
  # expect the page to say, "Halt, you fiend! You need an image to post here!"
  expect(page).to have_content "Halt, you fiend! You need an image to post here!"
end
end
