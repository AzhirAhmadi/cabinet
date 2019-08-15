require 'rails_helper'

describe ApplicationHelper do
    describe "#inch_to_cm" do
        it "convert inches to centimeters" do
            expect( helper.inch_to_cm(2)).to eq(5.08)
        end
    end

    describe "#next_page" do
        it "returns @page plus 1" do
            assign(:page, 5)
            expect( helper.next_page).to eq(6)
        end
    end
end