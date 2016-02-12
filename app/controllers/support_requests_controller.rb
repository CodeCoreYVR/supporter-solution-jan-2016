class SupportRequestsController < ApplicationController
  def new
    @support_request = SupportRequest.new
  end

  def create
    support_request_params = params.require(:support_request)
                                    .permit(:name, :email, :department, :message)
    @support_request = SupportRequest.new(support_request_params)
    if @support_request.save
      flash[:notice] = "Request Saved!"
      redirect_to support_request_path(@support_request)
    else
      flash[:alert] = "Request not saved"
      render :new
    end
  end

  def show
    @support_request = SupportRequest.find params[:id]
  end

  def index
    @support_requests = SupportRequest.order("done ASC")
  end

  def mark_done
    @support_request = SupportRequest.find params[:id]
    @support_request.done = !@support_request.done
    @support_request.save
    redirect_to support_requests_path
  end

end
