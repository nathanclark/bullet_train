# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# 👋 Also, seeds in Bullet Train are slightly different than vanilla Rails.
# See `docs/seeds.md` for details.

puts "🌱 Generating global seeds."

load "#{Rails.root}/db/seeds/development.rb" if Rails.env.development?

# We use this stub to test `seeding?` for ActiveRecord models.
if Rails.env == "test" && ENV["seed_stub"] == "true"
  User.create(email: "test@test.com", password: "956742469855eba772ea62b9f14d8626")
  user = User.find_by(email: "test@test.com")
  p "User is seeding: #{user.seeding?}"
end

if Vendor.count == 0
  ##Vendor.create(name: "A L TELEPHONE", company_id: 1, ledger_account_id: 1, vendor_number: "ALTELE", vendor_status: "Active", address1: "1075 US HWY 380 EAST", city: "GRAHAM", region_state: "TX", zip_code: "76450", phone_number: "123-456-7890"
end

