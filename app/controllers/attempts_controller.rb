class AttemptsController < ApplicationController
	def new
		@quiz = Quiz.find params[:quiz_id]
	end

	def create
		@quiz = Quiz.find params[:quiz_id]
		scorer = Scorer.new(@quiz)
		guesses = params[:answer_ids].values

		percent = ((scorer.total(guesses) / guesses.length.to_f) * 100).to_i
		render text: "#{percent}%"
	end

	def show
	end

end
