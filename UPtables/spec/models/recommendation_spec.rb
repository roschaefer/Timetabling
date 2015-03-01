require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  subject { build :recommendation, attributes }
  let(:attributes) { { } }
  describe "#valid?" do
    context "without semester" do
      let(:attributes) { super().merge(:semester => nil) }
      it { is_expected.not_to be_valid}
    end

    context "course <=> ects module <=> curriculum" do
      let(:course)          { create :course }
      let(:curriculum)      { create :curriculum }
      let(:attributes) { super().merge(:course => course, :curriculum => curriculum) }

      context "course doesn't belong to curriculum" do
        it { is_expected.not_to be_valid}
      end

      context "course belongs to curriculum" do
        before {
          create(:ects_module, :courses => [course], :curricula => [curriculum])
        }
        it { is_expected.to be_valid}
      end
    end

  end
end
