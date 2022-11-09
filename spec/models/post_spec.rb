require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Post.new(author: user, user_id: user.id, title: 'Hello', text: 'This is my first post') }

  it 'should not allow empty title' do
    expect(subject).to be_valid
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'should not allow title shorted than 3 characters' do
    expect(subject).to be_valid
    subject.title = 'zu'
    expect(subject).to_not be_valid
  end

  it 'should not allow title longer than 250 character' do
    expect(subject).to be_valid
    subject.title = 'a' * 252
    expect(subject).to_not be_valid
  end

  it 'should not allow comments_counter to be negative' do
    expect(subject).to be_valid
    subject.comments_counter = -5
    expect(subject).to_not be_valid
  end

  it 'shoul not allow comments_counter to be a string' do
    expect(subject).to be_valid
    subject.comments_counter = 'ab'
    expect(subject).to_not be_valid
  end

  it 'five_recent_comments return the 5 last comments' do
    expect(subject.five_recent_comments.length).to be_between(0, 5)
  end

  it 'update_post_counter increments post_counter' do
    expect(subject.author.post_counter).to be 0
    subject.save
    expect(subject.author.post_counter).to be 1
  end
end
