require 'spec_helper'

describe Item do
  describe ".sanitize_decimal" do
    it "should extract decimal inside any text" do
      numbers = ["abc12.45dvf", "12.45acs", "asv12.45", "asd12asd", "asd12", "12asd"]
      numbers.map{|i| Item.send(:sanitize_decimal, i)}.should == [12.45, 12.45, 12.45, 12.0, 12.0, 12.0]
    end
  end

  describe ".sanitize_text" do
    it "should convert for the right encode" do
      text = "This is a text"
      Item.send(:sanitize_text, text).encode.should == Iconv.conv("UTF-8//IGNORE", "US-ASCII", text).encode
    end
  end
end
