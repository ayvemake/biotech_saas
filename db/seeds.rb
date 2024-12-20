# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Suppression des anciennes données
Patient.destroy_all
Sample.destroy_all

# Création de 20 patients avec leurs échantillons
20.times do |i|
  patient = Patient.create!(
    name: "Patient #{i + 1}",
    email: "patient#{i + 1}@example.com",
    age: rand(20..70) # Âge aléatoire
  )

  # Chaque patient a entre 1 et 3 échantillons
  rand(1..3).times do
    Sample.create!(
      barcode: SecureRandom.hex(8), # Génère un identifiant unique
      patient: patient,
      status: :received
    )
  end
end

puts "20 patients et leurs échantillons ont été créés avec succès !"
