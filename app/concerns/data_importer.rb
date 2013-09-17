class DataImporter
  def self.import(model, file)
    # spreadsheet = open_spreadsheet(file)
    # header = spreadsheet.row(1)
    # (2..spreadsheet.last_row).each do |i|
    #   puts i
    #   row = Hash[[header, spreadsheet.row(i)].transpose]
    #   product = model.find_by_id(row["id"]) || model.new
    #   product.attributes = row.to_hash.slice(*(model.accessible_attributes))
    #   address = product['address']
    #   product.apartement_number = address.split(',')[2].strip
    #   distinct = Distinct.find_by_name("Адмиралтейский")
    #   Street.where(name: address.split(',')[1], distinct_id: distinct).first_or_create
    #   product.save!
    # end
    # header = []
    # File.foreach(file.path) do |csv_line|
    # 
    #   row = CSV.parse(csv_line.gsub('\"', '""'), ).first
    #   pp row
    # end
    CSV.foreach(file.path, headers: true, header_converters: :symbol, col_sep: "\;", quote_char: "\'") do |row|
      row = row.to_hash
      product = model.find_by_id(row[:id]) || model.new
      product.attributes = row
      address = product['address']
      product.apartement_number = address.split(',')[2].strip
      distinct = Distinct.find_by_name("Адмиралтейский")
      Street.where(name: address.split(',')[1], distinct_id: distinct).first_or_create
      product.save!
      puts row[:reester_id]
    end
  end
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when '.csv' then Roo::Csv.new(file.path, nil, :ignore)
    when '.xls' then Roo::Excel.new(file.path, nil, :ignore)
    when '.xlsx' then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
