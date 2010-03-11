class Item < ActiveRecord::Base
  
  has_attached_file :image, :styles => { :thumb => "159x190#", :small => "90x90#" }  

  GENDER = %w[Девушки Парни Унисекс]
  SIZE = %w[S M L XL]
  STATUS = %w[blank hot sale]
  
  acts_as_taggable_on :tags, :colors

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
    
  named_scope :price_range, lambda {|range|
      if range == "<200"
        {:conditions => {:price => (0..200)}}
      elsif range ==  "200-300"
        {:conditions => {:price => (200..300)}}
      elsif range == "300>"
        {:conditions => {:price => (300..1000)}}
      end
    }
  
    
  belongs_to :brand
  belongs_to :category
  
  has_many :availabilities, :class_name => "ItemAvailability"
  has_many :item_availabilities
  
  validates_presence_of :title
  validates_presence_of :body
  validates_presence_of :price
  validates_presence_of :gender  
  validates_associated :brand
  validates_associated :category
  
  
  def link
    # "/items/#{self.id}"
    "/shop/#{category.permalink}/#{self.id}-#{self.title}"
  end
  
end
