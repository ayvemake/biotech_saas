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
  barcode: 'ETH70-123456',
  manufacturer: 'ChemCorp',
  reference_number: 'ETH-70',
  category: 'Reagents'
)

pbs = Product.create!(
  name: 'PBS 10X',
  barcode: 'PBS10X-789012',
  manufacturer: 'BioLabs',
  reference_number: 'PBS-10X',
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

puts "Creating default user..."
User.find_or_create_by!(email: 'user@example.com') do |user|
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.first_name = 'Anil'
  user.last_name = 'Kahraman'
  user.confirmed_at = Time.current
end

puts "Default user created: user@example.com / password123"
puts "Finished!"
