class Museum

  attr_reader :name, :exhibits, :patrons

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def admit(patron)
    @patrons << patron
  end

  def recommend_exhibits(patron)
    @exhibits.select{|exhibit| patron.interests.include?(exhibit.name)}
  end

  def patrons_by_exhibit_interest
    hash = {}
    @exhibits.each do |exibit|
      hash[exibit] = @patrons.select{|pat|pat.interests.include?(exibit.name)}
    end
    hash
  end

end
