Rails.application.config.middleware.use OmniAuth::Builder do
  # Twitter doesnot provide email through OmniAuth, hence no need to scope email
  provider :twitter,  "odtzapNl6uaFJ046pHgi8A", "7h4HA0YsCvVjkpwOqOQ2RDN2RA6pyKnTvO04bcjIU"
end
