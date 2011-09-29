class Item < ActiveRecord::Base
  validates_presence_of :name, :price, :provider, :gender, :category, :description

  def self.create_multiples_from_csv(upload_file)
    begin 
      #saving csv file on tmp directory
      file_path = "#{Rails.root}/tmp/#{upload_file.original_filename}"
      File.open(file_path, "wb") {|f| f.write(upload_file.read)}
      return self.read_csv_and_populate_items(file_path)
    rescue
      return false
    end
  end

  def self.read_csv_and_populate_items(file_path)
    begin
      Item.transaction do
        # read CSV file and create items if it don't exist
        CSV.read(file_path).each_with_index do |item, i|
          next if i == 0

          attributes = {
            :name        => self.sanitize_text(item[0]),
            #:image_file => item[1] # we could you paperclip here
            :provider    => self.sanitize_text(item[2]),
            :price       => self.sanitize_decimal(item[3]),
            :gender      => self.sanitize_text(item[4]),
            :category    => self.sanitize_text(item[5]),
            :description => self.sanitize_text(item[6]),
            #:sku        => item[] #we don't have sku on csv file
          }
          
          # if the item already exist update its price and description, if not create a new item
          if Item.where(attributes.select{|k| ![:price, :description].include?(k)}).count > 0
            db_item = Item.where(attributes.select{|k| ![:price, :description].include?(k)}).first
            db_item.update_attributes(attributes.select{|k| [:price, :description].include?(k)})
          else
            Item.create!(attributes)
          end
        end
        return true
      end
      return false
    rescue
      return false
    end
  end

  protected
    # sanitize decimal numbers, clean any typo before try add it to database
    def self.sanitize_decimal(number)
      unless number.is_a?(Float) or number.is_a?(Integer)
        number = number.match(/(\d+\.\d+|\d+)/)[0]
      end
      number.to_f
    end
    
    def self.sanitize_text(text)
      # Iconv.conv("UTF-8//IGNORE", "US-ASCII", item[0]) fix problem with postgresql encode
      Iconv.conv("UTF-8//IGNORE", "US-ASCII", text)
    end
end
