# config/initializers/carrierwave.rb
 
CarrierWave.configure do |config|
  config.fog_credentials = {
    # Configuration for Amazon S3 should be made available through an Environment variable.
    # For local installations, export the env variable through the shell OR
    # if using Passenger, set an Apache environment variable.
    #
    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
    #
    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder
 
    # Configuration for Amazon S3
    :provider              => 'AWS',
    :aws_access_key_id     => 'AKIAJF4NSHDTPD2OKB3Q',
    :aws_secret_access_key => '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',
    :region                => 'us-east-1'
  }
 
  config.storage = :fog
 
  config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
  
  # For testing, upload files to local bucket.
  if Rails.env.test? || Rails.env.development?
    config.fog_directory    = 'gp99dev'
  else
    config.fog_directory    = 'gp99'
  end

end