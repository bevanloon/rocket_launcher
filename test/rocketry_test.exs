defmodule RocketryTests do
  use ExUnit.Case
  import Physics.Rocketry

  test "escape velocity" do
    earth = %{mass: 5.972e24, radius: 6.371e6}
    assert escape_velocity(earth) == 11.2
  end

  test "escape velocity earth" do
    assert escape_velocity(:earth) == 11.2
  end

end
