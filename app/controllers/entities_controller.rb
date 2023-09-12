class EntitiesController < ApplicationController
  def new
    @entity = Entity.new
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @entity = Entity.new(entity_params)
    @entity.user = current_user

    if @entity.save
      flash[:notice] = 'Entity created successfully!'
      redirect_to @group
    else
      flash[:alert] = @entity.errors.full_messages.first if @entity.errors.any?
      render :new, status: :unprocessable_entity
    end
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids: [])
  end
end
