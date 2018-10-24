class Ps2Controller < ApplicationController
  def index
  end
  def kill

    cookies.permanent[:id] = cookies[:id] + " " + params[:id]
    respond_to do |format|
      format.html { redirect_to quote_url, notice: 'Quote  was successfully killed.' }
      format.json { head :no_content }
    end
  end
  def del
    cookies.permanent[:id] = "a"
    respond_to do |format|
      format.html { redirect_to quote_url, notice: 'PERSONALIZATION DELETED!!!' }
      format.json { head :no_content }
    end
  end
  def search
    if params[:search].blank?  
    redirect_to(root_path, alert: "Empty field!") and return  
  else  
    @parameter = params[:search].downcase
    puts @quote_db  
    @results = Quotation.where('lower(quote) LIKE :search OR lower(author_name) LIKE :search', search: "%#{@parameter}%")
    @results = @results.where.not(id: cookies[:id].split(" "))

  end  
  end
  def quotations
    if cookies.permanent[:id].nil?
      cookies.permanent[:id] = "a" 
    end 
    if params[:quotation]
      @quotation = Quotation.new( params.require(:quotation).permit(:author_name,:category,:quote) )
      if @quotation.save
        flash[:notice] = 'Quotation was successfully created.'
        @quotation = Quotation.new
      end
    else
            @quotation = Quotation.new
    end
    puts(cookies[:id].split(" "))
    @quotations1 = Quotation.where.not(id: cookies[:id].split(" "))
    if params[:sort_by] == "date"
      if params[:store]
        @quotations = Quotation.where("lower(quote) LIKE ? OR lower(author_name) LIKE ?", "%#{params[:store]}%", "%#{params[:store]}%").order(:created_at)
      else
        @quotations = Quotation.order(:created_at)
      end

    else
      if params[:store]
        @quotations = Quotation.where("lower(quote) LIKE ? OR lower(author_name) LIKE ?", "%#{params[:store]}%", "%#{params[:store]}%").order(:category)
      else
        @quotations = Quotation.order(:category)
      end
    end
  end
  def export_to_json
    @quot = Quotation.all
    send_data @quot.to_json,
              :type => 'text/json; charset=UTF-8;',
              :disposition => "attachment; filename=quotations.json"
  end

  def export_to_xml
    @quot = Quotation.all
    send_data @quot.to_xml,
              :type => 'text/xml; charset=UTF-8;',
              :disposition => "attachment; filename=quotations.xml"
  end
  def import
  
    @uploaded_io = params[:q].read()
    Hash.from_xml(@uploaded_io).each do |key, value|
      value.each do |column|
        column.delete("id")
        puts column
        @quot = Quotation.new(column)
          
            @quot.save
            
	 end
redirect_back(fallback_location: "/ps2/quotations")


	
end
end
end
