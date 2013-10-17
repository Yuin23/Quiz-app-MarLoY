class QuizzesController < ApplicationController

#before_filter :authenticate_user!, only: [:new, :create]

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
		# @quiz.populate(num_of_questions: 5, num_of_answers: 4)
	end



	# def create
	# 	@quiz = Quiz.new(params[:quiz].permit(:title, questions_attributes: [:query, answers_attributes: [:response, :correctness]]))
	# 	if @quiz.save
	# 		redirect_to @quiz
	# 	else
	# 	  flash.now[:error] = @quiz.errors.full_messages.inspect
	# 	  render action: "new"
	# 	end
	# end	

	def create
		@quiz = Quiz.new quiz_params

	    if @quiz.save
	      WebsocketRails[:quizzes].trigger 'new', @quiz
	      redirect_to @quiz
	    else
    	  flash.now[:error] = @quiz.errors.full_messages.inspect
	      render 'new'
	    end
	end

	private

	def quiz_params
		params[:quiz].permit(:title, questions_attributes: [:query, answers_attributes: [:response, :correctness]])
	end
end

