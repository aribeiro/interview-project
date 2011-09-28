class ImporterController < ApplicationController
  def new
  end

  def create
    if Item.create_multiples_from_csv(params[:importer][:products_list])
      flash[:notice] = "Items successfuly imported"
    else
      flash[:notice] = "There is some problem on the import, please try again"
    end
    redirect_to new_importer_path
  end

end
