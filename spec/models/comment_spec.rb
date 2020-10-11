require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) { create(:post) } 
  let(:user2) { create(:user)}
  describe ".comments" do
    it ' should return just child comments' do
      comment1A = post.comments.create!(user: post.user, parent_id: nil, body:'Comentário 1A', commentable_type: post, commentable_id: post )
      comment1B = post.comments.create!(user: user2, parent_id: comment1A.id, body:'Comentário 1B', commentable_type: post, commentable_id: post )
      comment1C = post.comments.create!(user: post.user, parent_id: comment1A.id, body:'Comentário 1C', commentable_type: post, commentable_id: post )
      comment2A = post.comments.create!(user: user2, parent_id: nil, body:'Comentário 2A', commentable_type: post, commentable_id: post )

      comments = comment1A.comments

      expect(comments).to include(comment1B)
      expect(comments).to include(comment1C)
      expect(comments).not_to include(comment2A)
    end
  end
end
