# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_boxutca_session',
  :secret      => 'bbe15af98a32d43ce04bd2f498df0c1316650f8ab04dbde4d0c1f77f1e8e2e9abd3a1cbdc16e1e940bfa6882c3720b78a17aa69f9ee36d3a916fa923f428b266'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
