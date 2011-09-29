require 'spec_helper'

describe Item do
  context "Upload File" do
    before :each do
      @upload_file = File.new(Rails.root + 'db/inventory.csv')
      FileUtils.rm(Rails.root + 'tmp/inventory.csv') if File.exist?(Rails.root + 'tmp/inventory.csv')
    end
    
    describe ".create_multiples_from_csv" do
      it "should save a file on tmp directory" do
        Item.create_multiples_from_csv(@upload_file).should be_true
        Item.count.should > 0
        File.exist?(Rails.root + 'tmp/inventory.csv').should be_true
      end
      
      it "should return false if there isn't a file" do
        Item.create_multiples_from_csv(nil).should be_false
        File.exist?(Rails.root + 'tmp/inventory.csv').should be_false
        Item.count.should == 0
      end
    end
    
    describe " .read_csv_and_populate_items" do
      it "should read the file and populate the database" do
        file_path = Rails.root + 'db/inventory.csv'
        Item.read_csv_and_populate_items(file_path).should be_true
        Item.count.should > 0
      end
      
      it "should return false" do
        file_path = nil 
        Item.read_csv_and_populate_items(file_path).should be_false
        Item.count.should == 0
      end
    end
  end

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
