
package igrp.functional.login;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;

import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.drone.api.annotation.Drone;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.arquillian.test.api.ArquillianResource;
import org.jboss.shrinkwrap.api.Filters;
import org.jboss.shrinkwrap.api.GenericArchive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.asset.EmptyAsset;
import org.jboss.shrinkwrap.api.asset.StringAsset;
import org.jboss.shrinkwrap.api.importer.ExplodedImporter;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

import com.thoughtworks.selenium.DefaultSelenium;

/**
 * @author Ângelo Correia
 */

@RunWith(Arquillian.class)
@Ignore
public class LoginScreemTest {
	private static final String WEBAPP_SRC = "src/test/resources/WEB-INF";
    
    @Deployment(testable = false)
    public static WebArchive createDeployment() {
        return ShrinkWrap.create(WebArchive.class, "igrp.war")
            .addClasses(nosi.core.servlet.IgrpServlet.class)
            .setWebXML(new File("src/test/resources/WEB-INF/web.xml"))
            
            .merge(ShrinkWrap.create(GenericArchive.class).as(ExplodedImporter.class)
                .importDirectory(WEBAPP_SRC).as(GenericArchive.class),
                "/", Filters.includeAll())
            .addAsWebInfResource(new File("src/test/resources/hibernate-igrp-core.cfg.xml"), "persistence.xml")
           // .addAsWebInfResource(new File("src/main/resources/log4j.properties"))
            .addAsWebInfResource(EmptyAsset.INSTANCE, "beans.xml")
            .addAsWebInfResource(
                new StringAsset("<faces-config version=\"2.0\"/>"),
                "faces-config.xml");
    }
    
    //DefaultSelenium browser;
    @Drone
    DefaultSelenium browser;
    
    @ArquillianResource
    URL deploymentUrl;
    
    @Test
    public void should_login_with_valid_credentials() {
    	
        browser.open(deploymentUrl.toString().replaceFirst("/$", "") + "/webapps?r=igrp/home/index");
       // browser.type("id=loginForm:username", "user1");
      //  browser.type("id=loginForm:password", "demo");
       // browser.click("id=loginForm:login");
        browser.waitForPageToLoad("15000");

        Assert.assertTrue("User should be logged in!",
            browser.isElementPresent("xpath=//li[contains(text(),'Welcome')]")); 
    	    	
    }
   
   
}
