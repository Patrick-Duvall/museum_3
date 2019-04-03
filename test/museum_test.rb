require "./test/test_helper"

class MuseumTest < Minitest::Test

  def setup
    @dmns = Museum.new("Denver Museum of Nature and Science")

    @gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    @dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    @imax = Exhibit.new("IMAX", 15)

    @dmns.add_exhibit(@gems_and_minerals)
    @dmns.add_exhibit(@dead_sea_scrolls)
    @dmns.add_exhibit(@imax)

    @bob = Patron.new("Bob", 20)
    @bob.add_interest("Dead Sea Scrolls")
    @bob.add_interest("Gems and Minerals")

    @sally = Patron.new("Sally", 20)
    @sally.add_interest("IMAX")

    @dmns.admit(@bob)
    @dmns.admit(@sally)
  end

  def test_has_name
    assert_equal "Denver Museum of Nature and Science", @dmns.name
  end

  def test_museum_has_revenue
    museum = Museum.new("Museum")
    assert_equal 0, museum.revenue
  end

  def test_exhibits_starts_empty_can_add_to
    museum = Museum.new('test')
    assert_equal [], museum.exhibits
    assert_equal [@gems_and_minerals, @dead_sea_scrolls, @imax], @dmns.exhibits
  end

  def test_patrons_starts_empty_can_add_to
    museum = Museum.new('test')
    assert_equal [], museum.patrons
    assert_equal [@bob, @sally], @dmns.patrons
  end

  def test_recommends_appropriate_exhibits
    assert_equal [@gems_and_minerals, @dead_sea_scrolls], @dmns.recommend_exhibits(@bob)
    assert_equal [@imax], @dmns.recommend_exhibits(@sally)
  end

  def test_displays_patrons_by_exhibit_interest
    hash = {
      @dead_sea_scrolls => [@bob],
      @gems_and_minerals =>[@bob],
      @imax =>[@sally]
            }
    assert_equal hash, @dmns.patrons_by_exhibit_interest
  end

  def test_admited_patrons_spend_money

    museum = Museum.new("Museum")
    assert_equal 0, museum.revenue

    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    egypt = Exhibit.new("Egypt",20)

    museum.add_exhibit(gems_and_minerals)
    museum.add_exhibit(dead_sea_scrolls)
    museum.add_exhibit(imax)
    museum.add_exhibit(egypt)

    tom = Patron.new("Tom", 40)
    tom.add_interest("Dead Sea Scrolls")
    tom.add_interest("Gems and Minerals")
    tom.add_interest("Egypt")

    lucy = Patron.new("Sally", 20)
    lucy.add_interest("IMAX")

    bill = Patron.new("Bill", 3)
    bill.add_interest("Dead Sea Scrolls")

    require "pry"; binding.pry
    museum.admit(tom)
    assert_equal 10, tom.spending_money
    museum.admit(lucy)
    assert_equal 5, lucy.spending_money
    museum.admit(bill)
    assert_equal 3, bill.spending_money
    assert_equal 45, museum.revenue
  end

end
