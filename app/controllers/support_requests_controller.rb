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
    @support_requests = SupportRequest.order("done ASC").page(params[:page]).per(7)
    # if params[:q]
    #   @support_requests = SupportRequest.search(params[:q])
    # else
    #   @support_requests = SupportRequest.order("done ASC")
    # end
  end

  def edit
    @support_request = SupportRequest.find params[:id]
  end

  def update
    @support_request = SupportRequest.find params[:id]
    support_request_params = params.require(:support_request)
                                    .permit(:name, :email, :department, :message, :done)
    if @support_request.update(support_request_params)
      if support_request_params.has_key?(:done)
        redirect_to support_requests_path, notice: "Request updated!"
      else
        redirect_to @support_request, notice: "Request updated!"
      end
      # redirect_to update_success_direction(support_request_params, @support_request),
      #             notice: "support request updated!"
    else
      render :edit
    end
  end

  def mark_done
    @support_request = SupportRequest.find params[:id]
    @support_request.done = !@support_request.done
    @support_request.save
    redirect_to support_requests_path
  end

  def search
    @support_requests = SupportRequest.search(params[:q]).page(params[:page]).per(7)
    render :index
  end

  private

  # def update_success_direction(params, support_request)
  #   if support_request.has_key?(:done)
  #     support_requests_path
  #   else
  #     support_request
  #   end
  # end
end
