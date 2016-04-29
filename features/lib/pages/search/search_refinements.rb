class SearchRefinements < Homepage
  element :category, {:id => "rc:swfield"}
  element :sub_category, {:id => "c1:swfield"}
  element :sub_sub_category, {:id => "c2:swfield"}
  element :sort_by, {:id => 'id_sort_by'}

  def initialize(driver)
    @driver = driver
  end

  def is_current_page?
    is_basic_search_widget.displayed?
  end

  def select_category(text)
    self.select_dropdown_by_text(category, text)
  end

  def select_sub_category(text)
    self.select_dropdown_by_text(sub_category, text)
  end

  def select_sub_sub_category(text)
    self.select_dropdown_by_text(sub_sub_category, text)
  end

  def select_search
    search_button.click()
    @driver.title
  end

  def select_sort(text)
    self.select_dropdown_by_text(sort_by, text)
  end

  def verify_sort_order(order)
    price_array = Array.new
    feature_price_array = Array.new
    if order == 'Price Lowest to Highest'

      @driver.find_elements(:css, ".item").each do |price_element|
        if price_element.attribute('class').include?('paid-featured-item')
          unless price_element.text == ''
            feature_price_array.push(price_element.find_element(:css, ".price").text.split(' ')[1].sub(',', '').to_i)
          end
        else
          unless price_element.text == ''
            price_array.push(price_element.find_element(:css, ".price").text.split(' ')[1].sub(',', '').to_i)
          end
        end
      end
      puts price_array
    end
    price_array == price_array.sort and feature_price_array == feature_price_array.sort
  end

end