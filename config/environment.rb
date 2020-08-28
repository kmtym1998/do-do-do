# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Bullet.enable = true
Bullet.alert = true
Bullet.bullet_logger = true
Bullet.console = true
Bullet.rails_logger = true
Bullet.add_footer = true