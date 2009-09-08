# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_exam_session',
  :secret      => 'f145a20c789bb7527ac66ce3d177c65606d61610fccaaa11048c36669a537ffdb7a821bd82883fce869a2d12a4e28fad10b5864f651ed5f6a89a695668439f40'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
