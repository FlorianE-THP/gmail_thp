class EmailsController < ApplicationController
  require "faker"

  def index
    @emails = Email.all
    @email = Email.last
  end

  def create
    Email.create!(object: Faker::Lorem.word, body: Faker::Lorem.sentence(word_count: 3))
    @email = Email.all
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def update
    @email_status = Email.find(params[:id])
    @email_status.update(status: false)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def show
    @email = Email.find(params[:id])
    @last = Email.last
    status_change()
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  def replace
    @last = Email.last
  end

  def destroy
    @last = Email.last
    @emails = Email.find(params[:id])
    @emails.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
  end

  private

  def email_params
    params.permit(:status)
  end

  def status_change
    @email_find = Email.find(params[:id])
    if @email_find.status == false
      @email_find.update(status: true)
    end
  end
end
