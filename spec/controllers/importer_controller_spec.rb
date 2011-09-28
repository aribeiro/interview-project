require 'spec_helper'

describe ImporterController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it " should be successfuly" do
      Item.stub(:create_multiples_from_cvs).with("file"){ true }
      post :create, :importer => {"products_list" => "file"}
      
      response.should redirect_to(importer_url)
      flash[:notice].should == "Items successfuly imported"
    end

    it "should not be succecifuly" do
      Item.stub(:create_multiples_from_cvs).with("file"){ false }
      post :create, :importer => {"products_list" => "file"}
      
      response.should redirect_to(importer_url)
      flash[:notice].should == "There is some problem on the import, please try again"
    end
  end
end

