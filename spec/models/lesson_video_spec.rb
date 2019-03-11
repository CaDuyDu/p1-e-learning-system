require "rails_helper"

RSpec.describe LessonVideo, type: :model do
  context "#Relationships" do
    it { is_expected.to belong_to :video }
    it { is_expected.to belong_to :lesson }
  end
end
