class AnswersController < ApplicationController
  before_action :authenticate_user!
  add_breadcrumb "Главная", :root_path


  def new
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build
    add_breadcrumb @test.name, test_path(@test)
    add_breadcrumb @question.content, test_question_path(@test,@question)
    add_breadcrumb "Новый ответ"

  end

  def create
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)

    if @question.save
      flash[:notice] = "#{@answer.content} успешно создан!"
      redirect_to test_question_path(@test,@question)
    else
      render 'new'
    end
  end

  def edit
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    add_breadcrumb @test.name, test_path(@test)
    add_breadcrumb @question.content, test_question_path(@test,@question)
    add_breadcrumb "Редактировать ответ"
  end

  def update
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = 'Ответ успешно обновлен!'
      redirect_to test_question_path(@test,@question)
    else
      render 'edit'
    end
  end

  def destroy
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:question_id])
    @answer = Answer.destroy(params[:id])
    flash[:notice] = 'Ответ успешно удален!'
    redirect_to test_question_path(@test,@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:question_id,:content, :correct)
  end

end
