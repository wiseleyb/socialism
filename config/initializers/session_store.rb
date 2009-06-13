# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_socialism_session',
  :secret      => 'a483022ec900a59030da9f9ceaa04865de7905a99885e44a0902b36842d41e6c19977aca01a543ae2002e901a2ab74475bed7ed3d088a548f588d357ac9e5d2b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
