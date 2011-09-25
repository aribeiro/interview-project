class PagesController < ApplicationController

  def readme
    open("#{Rails.root}/README.markdown") do |f|
      render :text => BlueCloth::new(f.read).to_html
    end
  end

end
