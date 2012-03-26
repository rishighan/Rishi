class Digitalfile < ActiveRecord::Base

  belongs_to :variant

  has_attached_file :pack,
                    :storage => :s3,
                    :s3_credentials => {
                    :access_key_id =>'AKIAJK3GZ77UZ5EQABDA',
                    :secret_access_key => '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',
                    :bucket => 'DigitalPayload'},
                    :s3_permissions => :private,
                    :path => ":class/:id/:filename"
                    

  validates_attachment_presence :pack
  #validates_attachment_content_type :pack, :content_type => [ 'application/pack', 'application/x-pack', 'audio/mpeg', 'audio/pack' ]
  validates_attachment_size :pack, :less_than => 20.megabytes

  
  def download_url(style = nil, include_updated_timestamp = true)
    url = Paperclip::Interpolations.interpolate(':class/:id/:filename', pack, style || pack.default_style)
    include_updated_timestamp && pack.updated_at ? [url, pack.updated_at].compact.join(url.include?("?") ? "&" : "?") : url
  end

   def authenticated_url(style = nil, expires_in = 2.minutes)
   self.pack.expiring_url(expires_in, (style || pack.default_style))
 end

end
