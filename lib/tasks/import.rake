namespace :import do
  desc "Import products from a CSV file: rake import:products FROM=/db/inventory.csv"
  task :products => :environment do
    file = "#{Rails.root}#{ENV["FROM"]}"
      if Item.read_csv_and_populate_items(file)
        puts "Items successfully updated/create"
      else
        puts "There is some problem on the import, please try again."
      end
  end
end


