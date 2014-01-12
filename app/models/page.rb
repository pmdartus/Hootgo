class Page < ActiveRecord::Base
  belongs_to :authorization
  belongs_to :language

  def self.create_with_oauth(auth)
    default_page_langauge = Language.where(code: auth.extra.raw_info.lang).first
    Page.create(name: auth.info.name, image: auth.info.image, language: default_page_langauge)
  end
end
