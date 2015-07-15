require 'rails_helper'

describe Timetabling::Constraint do
  describe "::__HARD_CONSTRAINT__" do
    Timetabling::Constraint::HARD_CONSTRAINTS.each do  |constraint|
      subject(:hard_constraint) { Timetabling::Constraint.send(constraint) }
      it "the #{constraint} constraint is defined" do
        expect(hard_constraint.asp_representation).not_to be_empty
      end
    end
  end

  describe "::__SOFT_CONSTRAINT__" do
    Timetabling::Constraint::SOFT_CONSTRAINTS.each do  |constraint|
      subject(:soft_constraint) { Timetabling::Constraint.send(constraint) }
      it "the #{constraint} constraint is defined" do
        expect(soft_constraint.asp_representation).not_to be_empty
      end
    end
  end
end
