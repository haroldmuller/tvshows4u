class TvShow < ApplicationRecord
  after_initialize :set_owner, :if => :new_record?
  scope :name_contains, -> (name) { where("name like ?", "%#{name}%")}
  scope :director_is, -> (director_id) { where("director_id like?" "%#{director_id}%")}
  scope :gender_is, -> (gender_id) { where gender_id: gender_id}
  has_many :tv_show_comments, :dependent => :destroy
  has_many :episode_comments, through: :episodes, :dependent => :destroy
  has_many :news
  has_many :episodes, :dependent => :destroy
  has_many :tv_show_ratings, :dependent => :destroy
  has_many :users, through: :tv_show_ratings
  has_many :notices, :dependent => :destroy

  has_one :gender
  has_one :director

  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/


  ### Metodos de busqueda con filtros ###

  def self.search_by_director(params)
    puts 'entramos al search director'
    puts params[:director_id_1]
    puts params[:director_id_2]
    puts params[:director_id_3]
    puts params[:director_id_4]
    puts '----end----'

    director_id_1 = params[:director_id_1]
    director_id_2 = params[:director_id_2]
    director_id_3 = params[:director_id_3]
    director_id_4 = params[:director_id_4]
    results = []
    if director_id_1 != nil
      d1 = where(director_id: director_id_1)
      results << d1
    end
    if director_id_2 != nil
      d2 = where(director_id: director_id_2)
      results << d2
    end
    if director_id_3 != nil
      d3 = where(director_id: director_id_3)
      results << d3
    end
    if director_id_4 != nil
      d4 = where(director_id: director_id_4)
      results << d4
    end
    rel = where(director_id: 9999)
    results.each do |t|
      rel = rel.or(t)
    end
    rel
  end

  def self.search_by_gender(params)
    puts 'entramos al search gender'
    puts params
    gender_id = params[:gender_id]
    if gender_id != nil
      where(gender_id: gender_id)
    else
      where(gender_id: 9999)
    end
  end

  def set_owner
    self.user_id ||= Current.user.id
  end

  before_save :embedded_url

  def extract_id
    if self.url.include? 'youtu'
      matched = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/.match(self.url)
      return matched[2]
    end
  end

  def embedded_url
    self.final_url = "https://www.youtube.com/embed/#{self.extract_id}"
  end


  ### Fin de metodos con filtros ###

end
