# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

Rails.application.config.assets.precompile += %w( confirmation_for-mail.scss )

# Precompile additional assets.
Rails.application.config.assets.precompile += %w( orders.scss slides_ads.scss company_content.scss customers_nav.scss product_show_font.scss frontend.scss seller.scss pagination.scss quotes.scss backend.scss backend1.scss inventory_stocks.scss products.scss)


# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

