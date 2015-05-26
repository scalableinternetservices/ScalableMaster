class Organizer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :tags
  has_many :activities

  # mount_uploader :avatar, AvatarUploader
  has_attached_file :avatar, :styles => { :medium => "400x400>", :thumb => "100x100#", :large => "700x700#"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def tag_names
    self.tags.map { |o| o.name }.join(",")
  end

  def update_tags(tags_params)
    tag_list = tags_params[:tag_names].split(',').map(&:strip)
    tags = Tag.where(name: tag_list)
    if tags.size == tag_list.size
      self.tags = tags
      self.save
    end
  end


end
