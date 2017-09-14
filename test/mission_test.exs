alias MarsRover.Mission
alias MarsRover.Position

defmodule MarsRover.MissionTest do
  use ExUnit.Case

  describe "Mission.execute" do
    test "executes the command", context do
      {:ok, input} = File.read("test/support/input.txt")
      assert Mission.main(input) == %Position{xPos: 1, yPos: 3, direction: "N"}
    end
  end


end
