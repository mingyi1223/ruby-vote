class CandidatesController < ApplicationController
  
  def index
  end

  def new
    @candidate = Candidate.new
  end

  def create

    @candidate = Candidate.new(candidate_param)

    if @candidate.save
      flash[:notice] = "Candidate created!"
      redirect_to '/candidates'
    end
  end

  private
  def candidate_param
    params.require(:candidate).permit(:name, :party, :age, :politics)
  end

end