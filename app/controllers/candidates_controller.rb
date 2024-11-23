class CandidatesController < ApplicationController
  
  def index
    @candidates = Candidate.all
  end

  def show
    @candidate = Candidate.find_by(id: params[:id])
  end

  def new
    @candidate = Candidate.new
  end

  def create

    @candidate = Candidate.new(candidate_param)

    if @candidate.save
      flash[:notice] = "Candidate created!"
      redirect_to '/candidates'
    else
      render :new
    end
  end

  def edit
    @candidate = Candidate.find_by(id: params[:id])
  end

  def update
    @candidate = Candidate.find_by(id: params[:id])

    if @candidate.update(candidate_param)
      flash[:notice] = "Candidate updated!"
      redirect_to '/candidates'
    else
      render :edit
    end

  end

  private
  def candidate_param
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

end