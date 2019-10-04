require 'test_helper'

class Blake2bGCTest < MiniTest::Test
  def test_a_million_iteration
    1_000_000.times do |i|
      Digest::Blake2b.new(32, Digest::Blake2b::Key.none).digest('abc', :to_hex)
    end
  end
end
