require "rails_helper"

RSpec.describe HomeworksDetail, type: :model do
  context "#Relationships" do
    it { is_expected.to belong_to :exercise }
    it { is_expected.to belong_to :homework }
  end
end
