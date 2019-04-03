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

end
