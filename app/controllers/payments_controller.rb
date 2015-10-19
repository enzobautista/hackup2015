class PaymentsController < ApplicationController

   before_filter :assigns_gateway
  include ActiveMerchant::Billing
  include PaypalExpressHelper

  def checkout
    total_as_cents, setup_purchase_params = get_setup_purchase_params @cart, request
    setup_response = @gateway.setup_purchase(total_as_cents, setup_purchase_params)
    redirect_to @gateway.redirect_url_for(setup_response.token)
  end

private
  def assigns_gateway
    @gateway ||= PaypalExpressGateway.new(
    :login => PaypalLogin.login,
    :password => PaypalLogin.password,
    :signature => PaypalLogin.signature,
    )
  end
end
  
  # def paypal_url
  #   @project = Project.find(params[:project_id])
  #   # @backing = Backing.find(params[:project_id][:backing_id])
  #   @backing = Backing.where("project_id = ? AND id = ?", params[:project_id], params[:backing_id]).first()
  #   values = {
  #       business: "m5@m5.com",
  #       cmd: "_xclick",
  #       upload: 1,
  #       # return: "#{Rails.application.secrets.app_host}#{return_path}",
  #       return: "https:/sandbox.paypal.com",
  #       invoice: @backing.id,
  #       amount: @backing.amount,
  #       item_name: @project.id,
  #       item_number: @backing.id,
  #       quantity: '1'

  #   }
  #   "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  # end

  # def paypal_url(return_url)
  #     @project = Project.find(params[:project_id])
  #     @backing = Backing.find(params[:project_id,:backing_id])
  #     values = { 
  #     :business => 'm5@m5.com',
  #           :cmd => '_cart',
  #     :upload => 1,
  #     :return => return_url,
  #     } 
  #     values.merge!({ 
  #     "amount_1" => @backing.amount,
  #     "item_name_1" => @project.title,
  #     "item_number_1" => @backing.id,
  #     "quantity_1" => '1'
  #     })

   # end 

end