class Homepage < PageObject
  element :searchbox_keyword_input, {:class => "Searchbox__keyword__input"}
  element :searchbox_search_button, {:class => "Searchbox__search__button"}
  element :email, {:id => "email"}
  element :id_keywords, {:id => "id_keywords"}
  element :is_basic_search_widget, {:id => "is-basic-search-widget"}
  element :is_search, {:name => "is_search"}
  element :lang_form, {:class => "lang-form"}
  element :language, {:name => "language"}
  element :next, {:name => "next"}
  element :password, {:id => "password"}
  element :s_swfield, {:id => "s:swfield"}
  element :search_button, {:id => "search-button"}
  element :search_widget_form, {:id => "search-widget-form"}
  element :signin_button, {:id => "signin-button"}
  element :site_swfield, {:id => "site:swfield"}
  element :text_button, {:class => "text-button"}

  # attr_accessor searchbox_keyword_input

  def initialize(driver)
    @driver = driver
  end

  # @param [driver] url = base_page url
  # @return Navigate to base page is verify that I am on correct page
  def go_to(url='https://dubai.dubizzle.com/new-home')
    @driver.get(url)
    is_current_page?
  end

  def is_current_page?
    searchbox_keyword_input.displayed?
  end

  def select_section(section)
    locator ="#nav-#{section.gsub(' ', '-')} a"
    @driver.find_element(:css, locator).click()
    @driver.title
  end

  def select_dropdown_by_text(element, text)
    Selenium::WebDriver::Support::Select.new(element).select_by(:text, text)
  end

  def select_dropdown_by_value(element, value)
    Selenium::WebDriver::Support::Select.new(element).select_by(:value, value)
  end

  def select_dropdown_by_index(element, index)
    Selenium::WebDriver::Support::Select.new(element).select_by(:index, index)
  end
end