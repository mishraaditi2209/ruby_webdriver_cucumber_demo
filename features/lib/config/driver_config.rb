require "selenium-webdriver"
require 'fileutils'
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

  def get_screenshot(scenario_name, step_name)
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    Dir.chdir("screenshots")
    scenario_folder_name = "#{scenario_name.gsub(" ", "_").gsub(/[^0-9A-Za-z_]/, '')}"
    Dir::mkdir(scenario_folder_name) if not File.directory?(scenario_folder_name)
    Dir.chdir(scenario_folder_name)
    step_name = step_name.gsub(" ", "_").gsub(/[^0-9A-Za-z_]/, '')+".png"
    @driver.save_screenshot step_name
    Dir.chdir("..")
    Dir.chdir("..")
  end

  def clean_screenshots
    FileUtils.rm_rf('screenshots') if File.directory?('screenshots')
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