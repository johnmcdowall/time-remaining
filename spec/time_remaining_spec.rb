require "./lib/time_remaining"

describe "The Time Remaining class" do
  
  let(:time_remaining) { TimeRemaining.new}
  
  describe "When no data has accumulated" do
    it "should return 99999 as estimated finish time" do
      time_remaining.completed_in.should == 99999
    end

    it "time_remaining_available? returns false" do
      time_remaining.time_remaining_available?.should == false
    end   
  end
  
end