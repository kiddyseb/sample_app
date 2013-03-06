class JarsController < ApplicationController
  def new
  end

  def create
  end

  def destroy
  end

  def show
  end

  def import
	  file = params[:file]
	  siteId = params[:siteId]
	  site = Site.find_by_id(siteId)
	  spreadsheet = open_spreadsheet(file)
	  spreadsheet.default_sheet = spreadsheet.sheets[2]
	  header = spreadsheet.row(1)
	  nbJar = (137 - 41 )/ 8 
	  curRow = 42
	  
	  nbJar.times do
	  	  jarIndex = 0, jarVolts = 0, voltState = 0, jarG = 0, jarGState = 0, jarPctRev = 0
		  (curRow..curRow+7).each do |i|
		    #row = Hash[[header, spreadsheet.row(i)].transpose]
		    #attName = row["attName"]
		    attName = spreadsheet.cell(curRow,1)

		    if (attName.eql? "Jar Index")
		    	jarIndex = spreadsheet.cell(curRow,3)	    	
		    end
		    if (attName.eql? "Jar Volts")
		    	jarVolts = spreadsheet.cell(curRow,3)	    	
		    end
		    if (attName.eql? "Volts State")
		    	voltState = spreadsheet.cell(curRow,3)	    	
		    end
		    if (attName.eql? "Jar G")
		    	jarG = spreadsheet.cell(curRow,3)	    	
		    end
		    if (attName.eql? "Jar-G State")
		    	jarGState = spreadsheet.cell(curRow,3)	    	
		    end
		    if (attName.eql? "Jar Percent Of Reference")
		    	jarPctRev = spreadsheet.cell(curRow,3)	    	
		    end

		    curRow = curRow +1
		  end

		  jar = Jar.find_by_jarIndex(jarIndex) || new 
		  jar = site.jars.build(jarIndex:jarIndex, jarVolts:jarVolts,voltState:voltState, jarG:jarG, jarGState:jarGState,jarPctRev:jarPctRev)
		  jar.save!
	  end
	  flash[:success] = "Jars imported."
	  redirect_to site
	end

  private

  def open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
  end
end
