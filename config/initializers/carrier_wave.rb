if Rails.env.production?
  CarrierWave.configure do |config|
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'
    config.fog_credentials = {
      #Config for Amazon S3
      :provider => 'AWS',
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY'],
      :region => ENV['S3_REGION']
    }
    config.fog_directory = ENV['S3_BUCKET']
    config.fog_public     = false
    config.fog_provider = 'fog/aws'
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  end
end 