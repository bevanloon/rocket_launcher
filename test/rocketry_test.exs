defmodule RocketryTests do
  use ExUnit.Case
  import Physics.Rocketry
  import Planet


  # test "loads planets" do
  #   x = Planet.load
  #   assert x == [{:mercury, %Planet{ev: 4.3, name: "Mercury", type: :rocky, mass: 3.3e23, radius: 2.439e6}},
  #               {:venus, %Planet{ev: 10.4, name: "Venus", type: :rocky, mass: 4.86e24, radius: 6.05e6}},
  #               {:earth, %Planet{ev: 11.2, name: "Earth", type: :rocky, mass: 5.972e24, radius: 6.37e6}},
  #               {:mars, %Planet{ev: 5.1, name: "Mars", type: :rocky, mass: 6.41e23, radius: 3.37e6}},
  #               {:jupiter, %Planet{ev: 59.5, name: "Jupiter", type: :gaseous, mass: 1.89e27, radius: 7.14e7}},
  #               {:saturn, %Planet{ev: 35.5, name: "Saturn", type: :gaseous, mass: 5.68e26, radius: 6.02e7}},
  #               {:uranus, %Planet{ev: 21.4, name: "Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7}},
  #               {:neptune, %Planet{ev: 23.5, name: "Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7}}]
  # end
  #
  # test "selects a planet" do
  #   x = Planet.select[:earth]
  #   assert x == %Planet{ev: 11.2, name: "Earth", type: :rocky, mass: 5.972e24, radius: 6.37e6}
  # end
  #
  # test "orbital term default to earth" do
  #   assert orbital_term(100) == 1.5
  # end
  #
  # test "orbital term mars" do
  #   assert orbital_term(100, mars) == 1.8
  # end
  #
  # test "orbital term greater than 3 hours" do
  #   assert orbital_term(6366, earth) > 3
  # end
  #
  # test "orbital term less than 5 hours" do
  #   assert orbital_term(6366, earth) < 5
  # end
  #
  # # chapter 6 extra credit
  # test "height for orbital term 4 hours" do
  #   r = height_for_orbital_term(4, earth)
  #   #only need an approximate to complete chapter 6 extra credit
  #   assert (trunc(r)) == 6365
  # end

  test "Orbital acceleration defaults to Earth" do
    x = orbital_acceleration(100)
    assert x == 9.519899476599884
  end

  test "Orbital acceleration for Jupiter" do
    x = orbital_acceleration(Planet.select[:jupiter], 100)
    assert x == 24.670096337229204
  end

  test "Orbital term at 100km for Saturn at 6000km" do
    x = orbital_term(Planet.select[:saturn], 6000)
    assert x == 4.9
  end

end
