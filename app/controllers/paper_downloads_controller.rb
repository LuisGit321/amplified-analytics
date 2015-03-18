class PaperDownloadsController < ApplicationController
  
  def new
    @paper_download = PaperDownload.new
  end
  
  def create
    @paper_download = PaperDownload.new(params[:paper_download])
    captcha_ok = verify_nice_captcha #to generate 'try again' on recaptcha
    @paper_download.errors.add_to_base "Wrong captcha" if !captcha_ok
    @paper_download.paper_link = "http://#{ActionController::Base.session_options[:host]}/pdfs/Case_Study_DHI.pdf"
    if captcha_ok and @paper_download.save
      UserMailer.deliver_paper_download(@paper_download)
      UserMailer.deliver_paper_download_info(@paper_download)
    else
      render :action => :new
    end
  end
    
  
end
