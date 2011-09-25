class PagesController < ApplicationController

  def readme
    open("#{Rails.root}/README") do |f|
      render :text => BlueCloth::new(f.read).to_html
    end
  end

end
