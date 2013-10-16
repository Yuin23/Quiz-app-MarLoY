class QuizzesController < ApplicationController

	def index
    	@quizzes = Quiz.all
  	end

  	def show
		@quiz = Quiz.find(params[:id])
	end

	def new
		@quiz = Quiz.new
		@question = @quiz.questions.build
		4.times { @question.answers.build }
	end

	def create
		@quiz = Quiz.new(params[:quiz].permit(:title, questions_attributes: [:query, answers_attributes: [:response, :correctness]]))
		if @quiz.save
			redirect_to @quiz
		else
		  flash.now[:error] = @quiz.errors.full_messages.inspect
		  render action: "new"
		end
	end	

end