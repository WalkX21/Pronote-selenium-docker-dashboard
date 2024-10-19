from selenium import webdriver

# The standalone Chrome image already includes the browser and driver
driver = webdriver.Chrome()

driver.get("https://www.google.com")
print(driver.title)

driver.quit()
