defmodule CalcsTest do
  use ExUnit.Case
  import Calcs

  test "nearest tenth" do
    assert nearest_tenth(10.1) == 10.1
    assert nearest_tenth(10.9) == 10.9
    assert nearest_tenth(10.212345) == 10.3
    assert nearest_tenth(10.298765) == 10.3
    assert nearest_tenth(10.612345) == 10.7
    assert nearest_tenth(10.6876545) == 10.7
  end

  test "convert velocity to km" do
    assert to_km(10000) == 10
    assert to_km(10200) == 10.2
    assert to_km(10250) == 10.25
    assert to_km(10678) == 10.678
  end

  test "cube root" do
    assert cube_root(27) == 3
    assert cube_root(8) == 2
  end
end
