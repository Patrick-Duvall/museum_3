require "./test/test_helper"

class PatronTest < Minitest::Test

  def test_has_attributes
    bob = Patron.new('Name',20)
    assert_equal 'Name', bob.name
    assert_equal 20, bob.spending_money
  end

  def test_interests_starts_empty_can_add_to
    bob = Patron.new('Name',20)
    assert_equal [], bob.interests
    bob.add_interest("Dead Sea Scrolls")
    bob.add_interest("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], bob.interests
  end


end
