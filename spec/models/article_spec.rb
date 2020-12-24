require 'rails_helper'
RSpec.describe Article, type: :model do
  let (:subject) { Article.new }
  describe "#activate" do
    it "should be true when subject is empty" do
      subject.save
      subject.activate
      expect(subject.activated).to eq(true)
    end
    it "should be true when subject is true" do
      subject.activated = false
      subject.save
      subject.activate
      expect(subject.activated).to eq(true)
    end
    it "should be true when subject is false" do
      subject.activated = false
      subject.save
      subject.activate
      expect(subject.activated).to eq(true)
    end
  end
  describe "#deactivate" do
    it "should be false when subject is empty" do
      subject.save
      subject.deactivate
      expect(subject.activated).to eq(false)
    end
    it "should be false when subject is true" do
      subject.activated = false
      subject.save
      subject.deactivate
      expect(subject.activated).to eq(false)
    end
    it "should be false when subject is false" do
      subject.activated = false
      subject.save
      subject.deactivate
      expect(subject.activated).to eq(false)
    end
  end
end