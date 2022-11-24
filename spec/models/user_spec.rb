# require 'rails_helper'

# RSpec.describe User, type: :model do
#   subject { User.new(name: 'Josue') }

#   it 'should not allow empty name' do
#     expect(subject).to be_valid
#     subject.name = nil
#     expect(subject).to_not be_valid
#   end

#   it 'should not allow name shorter than 3 characters' do
#     expect(subject).to be_valid
#     subject.name = 'ab'
#     expect(subject).to_not be_valid
#   end

#   it 'should not allow name longer than 20 characters' do
#     expect(subject).to be_valid
#     subject.name = 'a' * 21
#     expect(subject).to_not be_valid
#   end

#   it 'should not allow post_counter to be negative' do
#     expect(subject).to be_valid
#     subject.post_counter = -1
#     expect(subject).to_not be_valid
#   end

#   it 'should not allow post_counter to be a string' do
#     expect(subject).to be_valid
#     subject.post_counter = 'a'
#     expect(subject).to_not be_valid
#   end
# end
