##### Gems ############################################################### 
require 'appium_lib' 
require 'pry' 
require 'byebug' 
require 'touch_action' 
require 'net/http' 
require 'uri' 
require 'json' 
require 'csv' 
require 'timeout' 
require 'require_all' 
require 'pathname'
require 'pp'
########################################################################## 

Before do |scenario|
  def caps ## Set device properties
    {
      caps: {
        deviceName: "Samsung",
        platformName: "Android",
        app: "./qa_v140_build_390.apk",
        appPackage: "com.eyetime.qa", 
        appActivity: "com.ttrumpet.sa.SplashScreen",
        newCommandTimeout: "3600",
        noReset: "true",
        autoGrantPermissions: "true",
        autoAcceptAlerts: "true",
        gpsEnabled: "true",
        automationName: "uiautomator2",
        androidDeviceReadyTimeout: "30",
        avdLaunchTimeout: "300000",
        avdReadyTimeout: "300000",
        isHeadless: "true"
      }
    }
  end
  
  $app_driver = Appium::Driver.new(caps, true) ## Create new driver object with caps properties, true == generate the global driver dy default
  $app_driver.no_wait ## Set implicit wait to 0
  # Appium::Driver.new(caps, :appium_port => @port_number) ## Create new driver object with caps properties
  Appium.promote_appium_methods Object ## Enbale usage of appium methods
end
  


ENV["GOOGLE_API_VERSION"] = "24" ##TODO: better way to get device api level programatically

# Timeout.timeout(30) do
#   $api_level_obtained ||= false
#   next $api_level_obtained if $api_level_obtained
#   ENV["GOOGLE_API_VERSION"] = %x[adb shell getprop ro.build.version.sdk].chomp ## Retrieve current device API level
#   $api_level_obtained = true
# end

After do |scenario| ## Shut down the appium test run / driver
  $app_driver.driver_quit ## Quit Appium driver
end