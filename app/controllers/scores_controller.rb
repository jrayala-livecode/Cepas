class ScoresController < ApplicationController
    
    def index
        @scores = Score.all
        @score = Score.new
    end

    def create
        wine = Wine.find(params[:score][:wine])
        enologist = Enologist.find(params[:score][:enologist])
        @score = Score.new(score_params)
        @score.wine = wine
        @score.enologist = enologist
        
        @score.save()

        redirect_to scores_path
    end

    def destroy
    end

    private
    def score_params
        params.require(:score).permit(:score)
    end

end
