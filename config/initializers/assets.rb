
Rails.application.config.assets.paths << Rails.root.join("app", "assets", "stylesheets", "kakoona_custom")

Rails.application.config.assets.precompile += %w( kakoona_custom/* )