class RequestsController < ApplicationController
  def new
    @request_form ||= RequestForm.new
  end

  def create
    @request_form = RequestForm.new(params[:request_form])

    if @request_form.valid?
      request_object = RequestObject.new({
        pub0: @request_form.pub0,
        page: @request_form.page,
        uid: @request_form.uid
      })
      service = OfferApiRequestService.new(request_object)
      @answer = service.call
      Rails.logger.debug @answer.status
      Rails.logger.debug @answer.data
    end

    render :new
  end
end
