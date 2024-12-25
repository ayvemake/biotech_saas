puts "Cleaning database..."
StockBatch.destroy_all if defined?(StockBatch)
StockItem.destroy_all if defined?(StockItem)
StockCategory.destroy_all if defined?(StockCategory)
Product.destroy_all if defined?(Product)

puts "Creating stock categories..."
reagents = StockCategory.create!(
  name: 'Reagents',
  description: 'Laboratory chemicals and reagents'
)

consumables = StockCategory.create!(
  name: 'Consumables',
  description: 'Disposable laboratory supplies'
)

equipment = StockCategory.create!(
  name: 'Equipment',
  description: 'Technical equipment and instruments'
)

puts "Creating products..."
ethanol = Product.create!(
  name: 'Ethanol 70%',
  reference_number: 'ETH-70',
  manufacturer: 'ChemCorp',
  category: 'Reagents'
)

pbs = Product.create!(
  name: 'PBS 10X',
  reference_number: 'PBS-10X',
  manufacturer: 'BioLabs',
  category: 'Reagents'
)

puts "Creating stock items..."
ethanol_stock = StockItem.create!(
  name: ethanol.name,
  reference: ethanol.reference_number,
  product: ethanol,
  stock_category: reagents,
  minimum_quantity: 5,
  current_quantity: 8,
  unit: 'L',
  location: 'Safety Cabinet A1',
  expiry_date: 1.year.from_now
)

pbs_stock = StockItem.create!(
  name: pbs.name,
  reference: pbs.reference_number,
  product: pbs,
  stock_category: reagents,
  minimum_quantity: 2,
  current_quantity: 1,
  unit: 'L',
  location: 'Fridge R2',
  expiry_date: 6.months.from_now
)

puts "Creating batches..."
StockBatch.create!(
  number: 'ETH-2024-001',
  stock_item: ethanol_stock,
  quantity: 5,
  received_date: 1.month.ago,
  expiry_date: 1.year.from_now
)

StockBatch.create!(
  number: 'PBS-2024-001',
  stock_item: pbs_stock,
  quantity: 1,
  received_date: 2.months.ago,
  expiry_date: 6.months.from_now
)

puts "Creating users..."
# Create default user
User.find_or_create_by!(email: 'user@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.first_name = 'Anil'
  user.last_name = 'Kahraman'
end

puts "Default user created: user@example.com / password123"

# Create admin user
User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.first_name = 'Admin'
  user.last_name = 'User'
  user.admin = true
end

puts "Default admin user created: admin@example.com / password123"

# Create test patients
puts "Creating test patients..."
10.times do
  Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 90),
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number
  )
end

# Create blood samples and analyses
puts "Creating blood samples and analyses..."
Patient.all.each do |patient|
  2.times do
    sample = BloodSample.create!(
      patient: patient,
      status: :received
    )

    CellCultureProcess.create!(blood_sample: sample, status: :pending)
    ProteinProcess.create!(blood_sample: sample, status: :pending)
  end
end

puts "Finished!"
