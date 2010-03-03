# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shuttle_session',
  :secret      => '6a11a7ec67f0145c9394a4e55a8dbd849cfddc3a93fa8d77fa80a975d8567bff4af6ce364cd5822d8af6d32afbb03993f407b1e9e4fd5300c2c14348f473b3b7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
