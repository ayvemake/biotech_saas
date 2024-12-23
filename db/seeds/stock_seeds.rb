# Création des catégories de stock
reagents = StockCategory.create!(
  name: 'Réactifs',
  description: 'Produits chimiques et réactifs de laboratoire'
)

consumables = StockCategory.create!(
  name: 'Consommables',
  description: 'Matériel à usage unique'
)

equipment = StockCategory.create!(
  name: 'Équipement',
  description: 'Matériel technique et instruments'
)

# Création des items pour les réactifs
StockItem.create!(
  name: 'Ethanol 70%',
  reference: 'ETH-70',
  stock_category: reagents,
  minimum_quantity: 5,
  current_quantity: 8,
  unit: 'L',
  location: 'Armoire sécurisée A1',
  expiry_date: 1.year.from_now
)

StockItem.create!(
  name: 'PBS 10X',
  reference: 'PBS-10X',
  stock_category: reagents,
  minimum_quantity: 2,
  current_quantity: 1,
  unit: 'L',
  location: 'Frigo R2',
  expiry_date: 6.months.from_now
)

# Création des items pour les consommables
StockItem.create!(
  name: 'Pipettes 10mL',
  reference: 'PIP-10',
  stock_category: consumables,
  minimum_quantity: 100,
  current_quantity: 250,
  unit: 'pièces',
  location: 'Étagère C3'
)

StockItem.create!(
  name: 'Gants Nitrile M',
  reference: 'GNT-M',
  stock_category: consumables,
  minimum_quantity: 500,
  current_quantity: 200,
  unit: 'pièces',
  location: 'Étagère C1'
)

# Création des items pour l'équipement
StockItem.create!(
  name: 'Pipette automatique P1000',
  reference: 'PAP-1000',
  stock_category: equipment,
  minimum_quantity: 2,
  current_quantity: 5,
  unit: 'pièces',
  location: 'Paillasse 2'
)

# Création de quelques lots
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