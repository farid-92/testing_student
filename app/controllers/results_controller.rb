class ResultsController < ApplicationController


  def show
    @test = Test.find(params[:id])
    @results = Result.where(test_id: @test)
  end

  def create
    @result = Result.new(student_test_params)
    if @result.save
      flash[:notice] = 'Тест закончен!'
      redirect_to result_path(params[:id])
    else
      render 'new'
    end
  end

  def student_test
    @counter = 1
    @test = Test.find(params[:id])
    @questions = @test.questions
  end

  def show_report
    @counter = 1
    @result = Result.find(params[:id])
    @test_id = @result.test_id
    @test = Test.find(@test_id)
    @questions = @test.questions
  end


  def destroy
    @result = Result.destroy(params[:id])
    flash[:notice] = 'Данные успешно удалены!'
    redirect_to :back

  end


  private

  def student_test_params
    @id = params[:id]
    params.require('/results/'+ @id +'/student_test').permit(:test_id,:name, :surname,:group)
  end

end
