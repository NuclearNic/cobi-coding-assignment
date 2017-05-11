Admin.models.each do |model|
  controller_name = "#{model.titleize.gsub('_', '').gsub(' ', '')}"

 class_eval "class Admin::#{controller_name.pluralize}Controller < AdminController
  before_action :set_#{model}, only: [:show, :edit, :update, :destroy]
  layout 'admin'

  def index
    @#{model.pluralize} = #{controller_name}.all
  end

  def show
  end

  def new
    @#{model} = #{controller_name}.new
  end

  def edit
  end

  def create
    @#{model} = #{controller_name}.new(#{model}_params)

    respond_to do |format|
      if @#{model}.save
        format.html { redirect_to admin_#{model.pluralize}_url, notice: '#{model.capitalize} was successfully created.' }
        format.json { render action: 'show', status: :created, location: @#{model} }
      else
        format.html { render action: 'new' }
        format.json { render json: @#{model}.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @#{model}.update(#{model}_params)
        format.html { redirect_to admin_#{model.pluralize}_url, notice: '#{model.capitalize} was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @#{model}.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @#{model}.destroy
    respond_to do |format|
      format.html { redirect_to admin_#{model.pluralize}_url, notice: '#{model.capitalize} was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_#{model}
      @#{model} = #{controller_name}.find(params[:id])
    end

    def #{model}_params
      params.require(:#{model}).permit(#{model.classify.constantize.column_names.map(&:to_sym).split(', ')})
    end

  end"


end


