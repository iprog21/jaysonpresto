# delete all data in each tables
puts 'Delete Operation'
ActiveRecord::Base.connection.tables.map { |model| model.capitalize.singularize.camelize  }.each do |model|
  if !['SchemaMigration','ArInternalMetadatum'].include?(model)
     print "Deleting data from #{model} table..."
     eval("#{model}.destroy_all")
     print " Done! \n"
  end
end

# load files for creation
Dir[File.join(Rails.root, 'db', 'seeds/data-creation', '*.rb')].sort.each do |seed|
  load seed
end


# load each files and execute
# Dir[File.join(Rails.root, 'db', 'seeds/*', '*.rb')].sort.each do |seed|
#   load seed
# end
