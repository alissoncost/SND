require 'selenium-webdriver'

Before do
    Capybara.current_session.driver.browser.manage.delete_all_cookies
    page.reset_session!
    Capybara.current_session.driver.quit
    page.driver.browser.manage.window.resize_to(1440, 900)

end

After do |scenario|
    sufix = ("error" if scenario.failed?) || "success"
    name = scenario.name.tr(" ", "_").downcase
    image_name = "data/img/#{sufix}-#{name}.png"
    temp_shot = page.save_screenshot(image_name)
    embed(temp_shot, "image/png", "Clique aqui para ver a evidência!")
    # Set reset session hook
    page.execute_script("sessionStorage.clear()")
  end

 