class Api::V1::AssembliesController < Api::V1::BaseController
  before_action :set_assembly, only: [:show, :destroy]

  def index
    @assemblies = Assembly.all
    render(json: AssemblySerializer.new(@assemblies).serialized_json)
  end

  def show
    render(json: AssemblySerializer.new(@assembly).serialized_json)
  end

  def destroy
    part = Part.find(params[:part_id])
    @assembly.parts.delete(part)
    return render json: {:status => "ok"}
  rescue Exception => e
    return render json: {:status => "error", :message => "Problem deleting Assembly: #{e.message}"}
  end

  def top_level
    @assemblies = Assembly.top_level
    render(json: AssemblySerializer.new(@assemblies).serialized_json)
  end

  def subassemblies
    @assemblies = Assembly.top_level.map(&:all_descendants).flatten.compact.uniq
    render(json: AssemblySerializer.new(@assemblies).serialized_json)
  end

  private
    def set_assembly
      @assembly = Assembly.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {:status => "error", :message => "Couldn't find assembly with ID #{params[:id]}"}
    end

    def assembly_params
      params[:assembly].permit(:part_id, :name)
    end

end
