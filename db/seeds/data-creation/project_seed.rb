puts "\n"
puts 'Adding default data from Project Table'

project_struct = Struct.new(:name)
projects = [
  project_struct.new('Library Management System'),
  project_struct.new('School Management System')
]
projects.each do |project|
   print "Adding project #{project.name}..."
   project_model = Project.new
   project_model.name = project.name
   project_model.save
   print "Done!\n"
end
