package com.javaseleniumtemplate.utils;

import com.javaseleniumtemplate.GlobalParameters;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

import java.net.MalformedURLException;
import java.net.URL;

public class Browsers {

    private static final String downloadPath = GlobalParameters.DOWNLOAD_DEFAULT_PATH;
    private static final String seleniumHub = GlobalParameters.SELENIUM_HUB;

    public static WebDriver getLocalChrome() {
        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.addArguments("no-sandbox");
        chromeOptions.addArguments("--allow-running-insecure-content");
        chromeOptions.addArguments("--lang=pt-BR");
        chromeOptions.addArguments("download.default_directory", downloadPath);
        return new ChromeDriver(chromeOptions);
    }

    public static WebDriver getRemoteChrome() {
        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.addArguments("no-sandbox");
        chromeOptions.addArguments("--allow-running-insecure-content");
        chromeOptions.addArguments("--lang=pt-BR");
        chromeOptions.addArguments("download.default_directory", downloadPath);

        DesiredCapabilities capabilities = DesiredCapabilities.chrome();
        capabilities.setCapability(ChromeOptions.CAPABILITY, chromeOptions);

        URL url = null;
        try {
            url = new URL(seleniumHub);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }

        return new RemoteWebDriver(url, capabilities);
    }

    public static WebDriver getLocalChromeHeadless() {
        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.addArguments("download.default_directory", downloadPath);
        chromeOptions.addArguments("--window-size=1920,1080");
        chromeOptions.addArguments("--headless");

        return new ChromeDriver(chromeOptions);
    }

    public static WebDriver getRemoteChromeHeadless() {
        ChromeOptions chromeOptions = new ChromeOptions();
        chromeOptions.addArguments("download.default_directory", downloadPath);
        chromeOptions.addArguments("--headless");
        chromeOptions.addArguments("--lang=pt-BR");
        chromeOptions.addArguments("--disable-gpu");
        chromeOptions.addArguments("window-size=1280,800");

        DesiredCapabilities capabilities = DesiredCapabilities.chrome();
        capabilities.setCapability(ChromeOptions.CAPABILITY, chromeOptions);

        URL url = null;
        try {
            url = new URL(seleniumHub);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }

        return new RemoteWebDriver(url, capabilities);
    }

    public static WebDriver getLocalFirefox() {
        FirefoxOptions firefoxOptions = new FirefoxOptions();
        firefoxOptions.addArguments("no-sandbox");
        firefoxOptions.addArguments("--allow-running-insecure-content");
        firefoxOptions.addArguments("--lang=pt-BR");
        firefoxOptions.addArguments("download.default_directory", downloadPath);
        return new FirefoxDriver(firefoxOptions);
    }

    public static WebDriver getRemoteFirefox() {
        DesiredCapabilities capabilities = DesiredCapabilities.firefox();

        URL url = null;
        try {
            url = new URL(seleniumHub);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }

        return new RemoteWebDriver(url, capabilities);
    }

    public static WebDriver getLocalEdgeExplorer() {
        System.setProperty("webdriver.edge.driver", ".//msedgedriver.exe");
        return new EdgeDriver();
    }

    public static WebDriver getRemoteEdgeExplorer() {
        DesiredCapabilities capabilities = DesiredCapabilities.edge();

        URL url = null;
        try {
            url = new URL(seleniumHub);
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }

        return new RemoteWebDriver(url, capabilities);
    }

}
