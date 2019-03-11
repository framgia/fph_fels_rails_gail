class ActivitiesController < ApplicationController
  
  def like
    @activity = Activity.find(params[:id])
    @activity.liked_by current_user
    respond_to do |format|
      format.html { redirect_to @activity }
      format.js 
    end
  end

  def unlike
    @activity = Activity.find(params[:id])
    @activity.unliked_by current_user
    respond_to do |format|
      format.html { redirect_to @activity }
      format.js
    end
  end

end
