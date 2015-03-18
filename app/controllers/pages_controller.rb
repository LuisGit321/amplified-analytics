class PagesController < ApplicationController
  before_filter :authenticate_user!, :only => :plans
  
  def home
    
  end

  def terms_of_service
    render :layout=>false
  end

  def registration_finished
    
  end

  def products_v2p_accelerator
    #redirect_to products_prm_path
    redirect_to products_path
  end

  def products_methodology
    render :layout=>'application_from_basic'
  end

  def products_prm
    render :layout=>'application_from_basic'
  end

  def prm_welcome
    render :layout=>'application_internal_as_all'    
  end

  def services
    
  end

  def wom
    render :layout=>'application_from_basic'
  end

  def plans
#    if current_user.distinct_categories_with_reports_within_last_month.size > SpreedlySubscription::PLANS.size
#      render 'call_us'
#    else
#      @plan = SpreedlySubscription::PLANS[(current_user.distinct_categories_with_reports_within_last_month.size)]
#      @plan[:price] = Spreedly::SubscriptionPlan.find(@plan[:id]).price.to_i
#    end
  end

end
