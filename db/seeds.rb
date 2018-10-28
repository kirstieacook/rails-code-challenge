# Creating non-shipped orders.
5.times { Order.create! }

# Shipped at times are randomly assigned.  What great randomization I've done!
5.times { Order.create!(shipped_at: Time.now + rand(40).minute) }

# Generate some widgets!
5.times { Widget.create!(name: Faker::Appliance.equipment) }