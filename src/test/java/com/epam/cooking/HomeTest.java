package com.epam.cooking;

import static org.junit.Assert.assertEquals;

import java.net.MalformedURLException;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class HomeTest {
	private static WebDriver driver;
	
	@After
	public void createAndStopService() {
		driver.quit();
	}

	@Before
	public void setUp() throws MalformedURLException {
		System.setProperty("webdriver.chrome.driver", "d:/Training stuff/MVC/cookingdotcom/src/test/resources/chromedriver.exe");
		driver = new ChromeDriver();
	}

	@Given("^The user is on the homepage$")
	public void The_user_is_on_the_homepage() throws Throwable {
		driver.get("http://localhost:8080/");
	}

	@When("^The user tries username: \"([^\"]*)\"$")
	public void The_user_tries_username(String arg1) throws Throwable {
		driver.findElement(By.id("username")).sendKeys(arg1);
	}

	@When("^password: \"([^\"]*)\"$")
	public void password(String arg1) throws Throwable {
		driver.findElement(By.id("password")).sendKeys(arg1);
	}

	@And("^click on submit$")
	public void and_clicks_on_submit() {
		driver.findElement(By.id("submit")).click();
	}

	@Then("^the user should be at \"([^\"]*)\"$")
	public void the_user_should_be_at(String arg1) throws Throwable {
		System.out.println(driver.getCurrentUrl());
		assertEquals(driver.getCurrentUrl(), arg1);
	}

	@When("^click on register$")
	public void click_on_register() throws Throwable {
		driver.findElement(By.id("register")).click();
	}
	
	@Then("^the user gets and alert with message: \"(.*?)\"$")
	public void the_user_gets_and_alert_with_message(String arg1) throws Throwable {
		Alert alert = driver.switchTo().alert();
		
		assertEquals(alert.getText(), arg1);
	}
}
