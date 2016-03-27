defmodule FeatureHelpers do
  use Hound.Helpers

  def fill_in(name, text) do
    {:name, name} |> fill_field(text)
  end

  def find_role(role) do
    find_element(:css, "[data-role=#{role}]")
  end

  def submit do
    {:css, "input[type=submit]"}
    |> submit_element
  end

  def click_on(text) do
    click {:link_text, text}
  end
end
