require "test_helper"

class RelationshipTest < ActiveSupport::TestCase
  def setup
    @relationship = Relationship.new(follower_id: users(:james).id,
                                     followed_id: users(:mike).id)
  end

  test "is valid" do
    assert @relationship.valid?
  end

  test "requires a valid follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "requires a valid followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end
end
