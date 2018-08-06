When("I launch the app") do
  $app_driver.start_driver
end

Then("I should see the Registration window") do
  eyetime_app_logo_id = "com.eyetime.qa:id/appLogo"

  Timeout.timeout(5) do
    until $app_driver.find_elements(:id, eyetime_app_logo_id).count > 0 do
      sleep 0.5
    end
  end
end