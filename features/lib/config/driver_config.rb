require "selenium-webdriver"
module DemoCucumber

  def launch_driver
    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.timeouts.implicit_wait = 10
    @driver.manage.window.maximize
  end

  def driver
    @driver
  end

  def quit_driver
    @driver.quit
  end





    def wait_for_some_time(timeout = 5)
      sleep timeout
      # wait_condition = @browser.execute_script("return jQuery.active") == 0
      # while wait_condition
      #   sleep 1
      # end
    end



    def wait_for_page(timeout=30)
      driver.manage.timeouts.page_load = timeout
    end

    def wait_for_element_displayed(element, timeout=10)
      timeout.each do
        if element.displayed?
          return
        end
        sleep 1
      end


    end


end