require "./test/test_helper"

class ExhibitTest < Minitest::Test

  def test_has_attributes
    ex = Exhibit.new('Name',0)
    assert_equal 'Name', ex.name
    assert_equal 0, ex.cost
  end


end
