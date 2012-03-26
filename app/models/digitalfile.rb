class Digitalfile < ActiveRecord::Base

  belongs_to :variant

  has_attached_file :pack,
                    :storage => :s3,
                    :s3_credentials => {
                    :access_key_id =>'AKIAJK3GZ77UZ5EQABDA',
                    :secret_access_key => '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',
                    :bucket => 'DigitalPayload'
    },
                    :path => ":class/:id/:filename"

end
