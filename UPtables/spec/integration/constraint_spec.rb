require 'rails_helper'

describe Asp::Constraint do
  describe "::__HARD_CONSTRAINT__" do
    Asp::Constraint::HARD_CONSTRAINTS.each do  |constraint|
      subject(:hard_constraint) { Asp::Constraint.send(constraint) }
      it "the #{constraint} constraint is defined" do
        expect(hard_constraint.to_asp).not_to be_empty
      end
    end
  end

  describe "::__SOFT_CONSTRAINT__" do
    Asp::Constraint::SOFT_CONSTRAINTS.each do  |constraint|
      subject(:soft_constraint) { Asp::Constraint.send(constraint) }
      it "the #{constraint} constraint is defined" do
        expect(soft_constraint.to_asp).not_to be_empty
      end
    end
  end
end
