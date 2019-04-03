class Museum

  attr_reader :name, :exhibits, :patrons, :revenue

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
    @revenue = 0
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def admit(patron)
    @patrons << patron
    will_attend = @exhibits.sort{|ex1,ex2|ex2.cost <=> ex1.cost}
    will_attend.each do |exhibit|
      if recommend_exhibits(patron).include?(exhibit)
        if patron.spending_money >= exhibit.cost
          patron.spending_money -= exhibit.cost ; @revenue +=exhibit.cost 
        end
      end
    end

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
