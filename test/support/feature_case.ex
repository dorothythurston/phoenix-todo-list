defmodule PhoenixTodoList.FeatureCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use PhoenixTodoList.ConnCase

      use Hound.Helpers

      import FeatureHelpers

      hound_session
    end
  end
end
