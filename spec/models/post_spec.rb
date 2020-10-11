require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation' do 
    it 'at least one body must be present' do
        post = Post.new(body:nil)
        post.valid?
        expect(post.errors[:body]).to include("can't be blank")
    end
end
end
