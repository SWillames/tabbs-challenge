require 'rails_helper'

feature 'User register a post'do
    let(:user) { create(:user) } 
    scenario 'successfully' do
        login_as(user, scope: :user)
        visit root_path
        click_on 'New Post'

        fill_in "Body",	with: FFaker::Lorem.paragraph
        click_on "Post" 

        expect(current_path).to eq post_path(Post.last)
        expect(page).to have_content(Post.last.body) 
    end
end
