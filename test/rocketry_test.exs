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
    assert orbital_term(100) > 3
  end

  test "orbital term less than 5 hours" do
    assert orbital_term(100) < 5
  end

end
