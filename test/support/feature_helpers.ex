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

  def text_for_css_data_role(role) do
    find_role(role)
    |> visible_text
  end

  def list_text do
    text_for_css_data_role("list")
  end

  def item_text do
    text_for_css_data_role("item")
  end
end
