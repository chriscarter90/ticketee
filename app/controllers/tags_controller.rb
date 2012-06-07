class TagsController < ApplicationController

  respond_to :js
  def remove
    @ticket = Ticket.find(params[:ticket_id])
    if can?(:tag, @ticket.project) || current_user.admin?
      @tag = Tag.find(params[:id])
      @ticket.tags -= [@tag]

      @ticket.save
      render :layout => false
    end
  end
end
