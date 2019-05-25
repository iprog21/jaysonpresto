puts "\n"
puts 'Adding default data from User Table'

user_struct = Struct.new(:email,:password,:password_confirmation)
users = [
  user_struct.new('superadmin@jaysonpresto.com','pass123','pass123'),
  user_struct.new('admin@jaysonpresto.com','pass123','pass123'),
  user_struct.new('user@jaysonpresto.com','pass123','pass123'),
  user_struct.new('guest@jaysonpresto.com','pass123','pass123')
]
users.each do |user|
  print "Adding user #{user.email}..."
  user_model = User.new
  user_model.email = user.email
  user_model.password = user.password
  user_model.password_confirmation = user.password_confirmation
  user_model.save
  print "Done!\n"
end
