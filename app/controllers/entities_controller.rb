class EntitiesController < ApplicationController
  before_action :set_group, only: [:index, :create]
  before_action :set_entity, only: [:show, :edit, :update, :destroy]

  def index
    @entities = @group.entities.where(user_id: current_user.id).order(created_at: :desc)
    @entities_sum = @entities.sum(:amount)
  end

  def show
  end

  def new
    @entity = Entity.new
  end

  def edit
  end

  def create
    @entity = @group.entities.build(entity_params)
    @entity.user = current_user

    if @entity.save
      redirect_to user_group_entities_path(params[:user_id], params[:group_id])
    else
      render :new
    end
  end

  def update
    if @entity.update(entity_params)
      redirect_to entity_path(@entity), notice: 'Entity was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @entity.destroy
    redirect_to entities_url, notice: 'Entity was successfully destroyed.'
  end

  private

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(:name, :amount, group_ids: [])
  end
end

