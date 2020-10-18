# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

class DataLoader
  def initialize(addresses:)
    @addresses = addresses
  end

  def create_addresses!
    Address.create!(addresses)
  end

  def clear_all
    Address.destroy_all
  end

  private

  attr_reader :addresses
end

data_json = JSON.parse(File.read('./db/data.json'))
data_loader = DataLoader.new(addresses: data_json)
data_loader.clear_all
data_loader.create_addresses!