//package nosi.core.embedded.server;
//
//import java.io.File;
//import java.net.URISyntaxException;
//
//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;
//import org.apache.tomee.embedded.Container;
//
///**
// * @author Iekiny Marcel
// * Mar 18, 2022
// */
//public class IGRPApplicationRunner {
//
//    private static final Logger LOGGER = LogManager.getLogger(IGRPApplicationRunner.class);
//
//    private IGRPApplicationRunner() {
//        throw new IllegalStateException("No instances for you");
//    }
//
//    public static void run() {
//
//        final ContainerConfiguration configuration = new ContainerConfiguration();
//        configuration.loadConfigurations();
//
//        try (Container container = new Container(configuration)) {
//            container.deployClasspathAsWebApp(configuration.getContextPath(), new File("src/main/webapp"), true);
//            LOGGER.info("IGRPWeb Started on http://{}:{}{}", container.getConfiguration().getHost(), container.getConfiguration().getHttpPort(), configuration.getContextPath());
//            container.await(); // do something or wait until the end of the application
//        } catch (Exception e) {
//            LOGGER.error(e.getMessage(), e);
//        }
//    }
//
//    // Get the root folder of the running JAR file ...
//    private static File getRootFolder() {
//        try {
//            File root;
//            String runningJarPath = IGRPApplicationRunner.class.getProtectionDomain().getCodeSource().getLocation().toURI().getPath().replace("\\\\", "/");
//            int lastIndexOf = runningJarPath.lastIndexOf("/target/");
//            if (lastIndexOf < 0) {
//                root = new File("");
//            } else {
//                root = new File(runningJarPath.substring(0, lastIndexOf));
//            }
//            LOGGER.error("application resolved root folder: {}",root.getAbsolutePath());
//            return root;
//        } catch (URISyntaxException ex) {
//            throw new RuntimeException(ex);
//        }
//    }
//
//}
