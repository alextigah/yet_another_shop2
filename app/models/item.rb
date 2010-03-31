class Item < ActiveRecord::Base
  
  has_attached_file :image, :styles => { :thumb => "159x190", :small => "90x90", :large => "350x500" }  

  GENDER = %w[Девушки Парни Унисекс]
  SIZE = %w[S M L XL]
  STATUS = %w[blank hot sale]
  COLORS = %w[white black grey red yellow green blue brown]
  cattr_reader :per_page
  @@per_page = 15  
  
  acts_as_taggable_on :tags, :colors
  
  default_scope :order => "created_at DESC"

  named_scope :not_self, lambda {|this| { :conditions => ["id != #{this.id}"] }}
  named_scope :gender, lambda {|gender| { :conditions => ["gender = #{gender} OR gender = 2"] }}
  named_scope :limit, lambda {|limit| { :limit => limit}}
  named_scope :female, :conditions => ["gender != 1"]
  named_scope :male, :conditions => ["gender != 0"]
  named_scope :published, :conditions => {:public => true}
  named_scope :random, :order => "rand()"
  
  
  named_scope :for_size, lambda {|size| 
      { 
        :include => :availabilities, :joins => :availabilities,
        :conditions => ["item_availabilities.size = ?", Item::SIZE.index(size)]
      } if size
    }
  
  named_scope :and_gender, lambda {|params|
      if params
        gender = params == "man" ? 1 : 0  
        {:conditions => ["gender = #{gender} OR gender = 2"]}
      end
    }
    
  named_scope :and_color, lambda {|color|
      {:conditions => ["color = ?", Item::COLORS.index(color)]} if Item::COLORS.include?(color)    
    }  

  named_scope :price_range, lambda {|range|
      if range == "<200"
        {:conditions => {:price => (0..200)}}
      elsif range ==  "200-300"
        {:conditions => {:price => (200..300)}}
      elsif range == "300>"
        {:conditions => {:price => (300..1000)}}
      end
    }
  
  named_scope :and_brand, lambda {|brand|
      brand_id = Brand.find_by_permalink(brand)
      {:conditions => {:brand_id => brand_id}} if brand_id
    }
  
    
  belongs_to :brand
  belongs_to :category
  
  has_many :availabilities, :class_name => "ItemAvailability"
  has_many :item_availabilities
  
  has_many :photos, :class_name => "ItemPhoto"
  has_many :item_photos
  
  accepts_nested_attributes_for :photos, :allow_destroy => true#, :reject_if => :all_blank
  
  
  
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :price
  validates_presence_of :gender  
  # validates_presence_of :permalink, :allow_blank => true
  validates_associated :brand
  validates_associated :category
  
  # after_save :make_permalink
  # 
  # def make_permalink
  #   self.update_attribute(:permalink, '11')#title.gsub(',','').gsub('\\','-').gsub(" ",'-').gsub("#",'-')) if permalink.blank?
  # end
  
  def link
    # "/items/#{self.id}"
    "/shop/#{category.permalink}/#{self.id}"
  end
  
end
