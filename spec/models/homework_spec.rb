require "rails_helper"

RSpec.describe Homework, type: :model do

  context "associations" do
    it {is_expected.to have_many(:homeworks_details).dependent(:destroy)}
    it {is_expected.to belong_to :lesson}
  end

  context "validation" do
    it "has a validation" do
      is_expected {FactoryBot.build(:homework, name_homework: nil).not_to be_valid}
      is_expected {FactoryBot.build(:homework, total_exercise: nil).not_to be_valid}
      is_expected {FactoryBot.build(:homework, lesson_number: nil).not_to be_valid}
    end
  end

  context "have attributes" do
    it "have attributes " do
      expect(Homework.new.attributes.keys).to include("id", "lesson_id", "name_homework", "lesson_number",
        "total_exercise")
    end
  end

  context "#scope" do
    before(:all) do
      @homework_a = FactoryBot.create(:homework, created_at: 1.day.ago)
      @homework_b = FactoryBot.create(:homework, created_at: 4.days.ago)
    end

    it "should return Homework in the correct order" do
      expect(Homework.order_asc) == [@homework_a, @homework_b]
    end
  end

end
