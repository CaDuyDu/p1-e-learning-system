require "rails_helper"

RSpec.describe CommentLesson, type: :model do
  context "#Relationships" do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :lesson }
  end

  context "#scope" do
    let!(:comment_a) { create :comment_lesson }
    let!(:comment_b) { create :comment_lesson }
    it "should return comment in the correct order" do
      expect(CommentLesson.order_by) == [ comment_a, comment_b ]
    end
  end
end
