class Api::V1::PartsController < Api::V1::BaseController
  before_action :set_part, only: [:show, :update, :destroy]

  def index
    @parts = Part.all
    render(json: PartSerializer.new(@parts).serialized_json)
  end

  def show
    render(json: PartSerializer.new(@part).serialized_json)
  end

  def update
    if @part.update(part_params)
      render(json: PartSerializer.new(@part).serialized_json)
    else
      render json: {:status => "error", :message => "Problem updating Part: #{e.message}"}, :status => 500
    end
  end

  def create
    @part = Part.new(part_params)

    if @part.save
      render(json: PartSerializer.new(@part).serialized_json)
    else
      render json: {:status => "error", :message => "Problem creating Part: #{e.message}"}, :status => 500
    end
  end

  def destroy
    @part.destroy!
    return render json: {:status => "ok"}
  rescue Exception => e
    return render json: {:status => 500, :message => "Problem deleting Part: #{e.message}"}, :status => 500
  end

  def orphaned
    @parts = Part.orphaned
    render(json: PartSerializer.new(@parts).serialized_json)
  end

  def in_use
    @parts = Part.in_use
    render(json: PartSerializer.new(@parts).serialized_json)
  end

  # This isn't really following MVC but was specified. Would like to do more here but providing part parameters and
  # assembly parameters in the same request starts setting off alarms for rails.
  def create_assembly
    @part1 = Part.find(params[:first_part_id])
    @part2 = Part.find(params[:second_part_id])
    @assembly = Assembly.create
    @assembly.parts << @part1
    @assembly.parts << @part2
    render(json: AssemblySerializer.new(@assembly).serialized_json)
  rescue ActiveRecord::RecordNotFound => e
    render json: {:status => 404, :message => e.message}, :status => 404
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part
      @part = Part.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: {:status => 404, :message => "Couldn't find part with ID #{params[:id]}"}, :status => 404
    end

    # Only allow a trusted parameter "white list" through.
    def part_params
      params[:part].permit("part_id", "name")
    end

end
