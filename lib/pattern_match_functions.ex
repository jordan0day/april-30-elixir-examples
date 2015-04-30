defmodule PatternMatchFunctions do
  def greeting(:happy) do
    "Hey! It's great to see you!"
  end

  def greeting(:mad) do
    "What do you want?!"
  end

  # The underscore is used to indicate that we don't care what the argument
  # value is.
  def greeting(_) do
    "I'm not sure how to feel about seeing you."
  end
end