class Backing < ActiveRecord::Base
	belongs_to :project
	belongs_to :user
	
	  def paypal_url(return_path)
    values = {
        business: "m5@m5.com",
        cmd: "_xclick",
        upload: 1,
        return: "#{Rails.application.secrets.app_host}#{return_path}",
        invoice: self.id,
        currency_code: "PHP",
        amount: self.amount,
        item_name: self.project.title,
        item_number: self.id,
        quantity: '1'
    }
    "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
  end

end
