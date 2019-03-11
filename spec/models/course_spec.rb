require "rails_helper"

RSpec.describe Course, type: :model do

  context "associations" do
    it {is_expected.to have_many(:course_user).dependent(:destroy)}
    it {is_expected.to have_many(:lesson).dependent(:destroy)}
    it {is_expected.to belong_to :user}
    it {is_expected.to belong_to :subject}
  end

  context "validation factory" do
    before(:each) do
      @course_name = FactoryBot.create(:course_name)
      @quantity_registered = FactoryBot.create(:quantity_registered)
      @course = FactoryBot.create(:course, course_name: @course_name, quantity_registered: @quantity_registered)
    end
  end

  context "validation" do
    it "has a validation" do
      is_expected {FactoryBot.build(:course, course_name: nil).not_to be_valid}
      is_expected {FactoryBot.build(:course, quantity_registered: nil).not_to be_valid}
    end
  end

  context "have attributes" do
    it "have attributes " do
      expect(Course.new.attributes.keys).to include("id", "user_id", "subject_id", "course_name",
        "quantity_registered", "description")
    end
  end

  context "#scope" do
    before(:all) do
      @course_a = FactoryBot.create(:course, created_at: 1.day.ago)
      @course_b = FactoryBot.create(:course, created_at: 4.days.ago)
    end

    it "should return course in the correct order" do
      expect(Course.order_by) == [@course_a, @course_b]
    end
  end

end
