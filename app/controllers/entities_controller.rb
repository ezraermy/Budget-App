class EntitiesController < ApplicationController
    before_action :find_entity
    before_action :find_entity_item, only: [:show, :edit, :update, :destroy]
  
    def index
      @entities = @entity.entities
    end
  
    def show
    end
  
    def new
      @entity_item = @entity.entities.build
    end
  
    def create
      @entity_item = @entity.entities.build(entity_params)
      @entity_item.user = current_user
  
      if @entity_item.save
        flash[:notice] = 'Entity created successfully!'
        redirect_to entity_entities_path(@entity)
      else
        flash[:alert] = @entity_item.errors.full_messages.first if @entity_item.errors.any?
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @entity_item.update(entity_params)
        flash[:notice] = 'Entity updated successfully!'
        redirect_to entity_entities_path(@entity)
      else
        flash[:alert] = @entity_item.errors.full_messages.first if @entity_item.errors.any?
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @entity_item.destroy
      flash[:notice] = 'Entity deleted successfully!'
      redirect_to entity_entities_path(@entity)
    end
  
    private
  
    def find_entity
      @entity = Entity.find(params[:entity_id])
    end
  
    def find_entity_item
      @entity_item = @entity.entities.find(params[:id])
    end
  
    def entity_params
      params.require(:entity).permit(:name, :amount)
    end
  end
  