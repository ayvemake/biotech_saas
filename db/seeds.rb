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


list = List.create(name: 'TO DO')
list.tasks.create(name: 'Collect samples')
list.tasks.create(name: 'Stock updating')
list.tasks.create(name: 'Liquid handling process')
list.tasks.create(name: 'Analyses')
list.tasks.create(name: 'Print final report')

list = List.create(name: 'In progress')
list = List.create(name: 'Done')
