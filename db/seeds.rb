puts "Cleaning stock database..."
# Clean up existing data
StockBatch.destroy_all if defined?(StockBatch)
StockItem.destroy_all if defined?(StockItem)
StockCategory.destroy_all if defined?(StockCategory)

puts "Creating stock data..."
# Create stock categories
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

# Create items for reagents
StockItem.create!(
  name: 'Ethanol 70%',
  reference: 'ETH-70',
  stock_category: reagents,
  minimum_quantity: 5,
  current_quantity: 8,
  unit: 'L',
  location: 'Safety Cabinet A1',
  expiry_date: 1.year.from_now
)

StockItem.create!(
  name: 'PBS 10X',
  reference: 'PBS-10X',
  stock_category: reagents,
  minimum_quantity: 2,
  current_quantity: 1,
  unit: 'L',
  location: 'Fridge R2',
  expiry_date: 6.months.from_now
)

# Create items for consumables
StockItem.create!(
  name: 'Pipettes 10mL',
  reference: 'PIP-10',
  stock_category: consumables,
  minimum_quantity: 100,
  current_quantity: 250,
  unit: 'pieces',
  location: 'Shelf C3'
)

StockItem.create!(
  name: 'Nitrile Gloves M',
  reference: 'GNT-M',
  stock_category: consumables,
  minimum_quantity: 500,
  current_quantity: 200,
  unit: 'pieces',
  location: 'Shelf C1'
)

# Create items for equipment
StockItem.create!(
  name: 'Automatic Pipette P1000',
  reference: 'PAP-1000',
  stock_category: equipment,
  minimum_quantity: 2,
  current_quantity: 5,
  unit: 'pieces',
  location: 'Bench 2'
)

# Create batches
StockBatch.create!(
  number: 'ETH-2024-001',
  stock_item: StockItem.find_by(reference: 'ETH-70'),
  quantity: 5,
  received_date: 1.month.ago,
  expiry_date: 1.year.from_now
)

StockBatch.create!(
  number: 'PBS-2024-001',
  stock_item: StockItem.find_by(reference: 'PBS-10X'),
  quantity: 1,
  received_date: 2.months.ago,
  expiry_date: 6.months.from_now
)

puts "Finished!"
