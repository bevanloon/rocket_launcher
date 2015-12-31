defmodule RocketryTests do
  use ExUnit.Case
  import Physics.Rocketry
  import Planets

  test "escape velocity earth" do
    assert escape_velocity(:earth) == 11.2
  end

  test "escape velocity mars" do
    assert escape_velocity(:mars) == 5.1
  end

  test "escape velocity moon" do
    assert escape_velocity(moon) == 2.4
  end

  test "orbital term greater than 3 hours" do
    assert orbital_term(6366, earth) > 3
  end

  test "orbital term less than 5 hours" do
    assert orbital_term(6366, earth) < 5
  end

  # chapter 6 extra credit
  test "height for orbital term 4 hours" do
    r = height_for_orbital_term(4, earth)
    #only need an approximate to complete chapter 6 extra credit
    assert (trunc(r)) == 6365
  end

end
