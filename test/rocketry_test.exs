defmodule RocketryTests do
  use ExUnit.Case
  import Physics.Rocketry

  test "escape velocity" do
    earth = %{mass: 5.972e24, radius: 6.371e6}
    mars = %{mass: 6.41e23, radius: 3.4e6}
    moon = %{mass: 7.35e22, radius: 1.738e6}
    assert escape_velocity(earth) == 11.2
    assert escape_velocity(mars) == 5.1
    assert escape_velocity(moon) == 2.4

  end

  test "escape velocity earth" do
    assert escape_velocity(:earth) == 11.2
  end

  test "orbital term greater than 3 hours" do
    assert orbital_term(6366) > 3
  end

  test "orbital term less than 5 hours" do
    assert orbital_term(6366) < 5
  end

  # chapter 6 extra credit
  test "height for orbital term 4 hours" do
    r = height_for_orbital_term(4)
    #only need an approximate to complete chapter 6 extra credit
    assert (trunc(r)) == 6365
  end

end
