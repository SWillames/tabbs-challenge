require 'rails_helper'

feature 'User register comment' do
    let(:post) { create(:post) }
    let(:user1) { create(:user)}
    scenario 'successfully' do
        login_as(user1, scope: :user)
        visit root_path

        click_on post.title

        fill_in placeholder: "Add Comment",	with: FFaker::Lorem.paragraph 
        click_on 'Comment'

        expect(page).to have_content(post.body)
        expect(page).to have_content(post.user.name)
        expect(page).to have_content(comment.body) 
        expect(page).to have_content("Autor "+ comment.user.name) 
    end
end