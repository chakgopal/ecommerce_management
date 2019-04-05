class StoresController < ApplicationController
#before_action :authenticate_seller! :except=>[:index, :show]


end

def new
    respond_to do |format|
      format.js { render :partial => "form" }
    end
  end
  