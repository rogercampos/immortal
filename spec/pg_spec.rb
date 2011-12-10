require "spec_helper"

describe "Immortal with postgres" do
  it "should immortally delete all records with delete_all" do
    @m = ImmortalModel.create! :title => 'testing immortal'
    expect {
      ImmortalModel.delete_all
    }.to change(ImmortalModel, :count).by(-1)
    ImmortalModel.count_with_deleted.should == 1
  end
end
