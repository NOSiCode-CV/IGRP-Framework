package nosi.core.webapp.helpers;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.*;

import nosi.core.webapp.Core;
import nosi.core.webapp.ReportKey;

/**
 * cvt00957
 * Sep 1, 2020
 */
public class ReflectionHelper {

	private ReflectionHelper(){}

	public static List<Class<?>> findClassesByInterface(Class<ReportKey> interfaceClass, String fromPackage) {
		if (Core.isNull(interfaceClass) || Core.isNull(fromPackage)) {
			return null;
		}
		final List<Class<?>> rVal = new ArrayList<>();
		try {
			final Class<?>[] targets = getAllClassesFromPackage(fromPackage);
			Arrays.stream(targets)
					.filter(Objects::nonNull)
					.filter(aTarget -> !aTarget.equals(interfaceClass))
					.filter(interfaceClass::isAssignableFrom)
					.forEach(rVal::add);

		} catch (ClassNotFoundException e) {
			return null;
		} catch (IOException e) {
			return null;
		}

		return rVal;
	}
	
	public static Class[] getAllClassesFromPackage(final String packageName)
			throws ClassNotFoundException, IOException {
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		assert classLoader != null;
		String path = packageName.replace('.', '/');
		Enumeration<URL> resources = classLoader.getResources(path);
		List<File> dirs = new ArrayList<>();
		while (resources.hasMoreElements()) {
			URL resource = resources.nextElement();
			dirs.add(new File(resource.getFile()));
		}
		ArrayList<Class> classes = new ArrayList<Class>();
		for (File directory : dirs) {
			classes.addAll(findClasses(directory, packageName));
		}
		return classes.toArray(new Class[0]);
	}
	
	public static List<Class<?>> findClasses(File directory, String packageName) throws ClassNotFoundException {
		List<Class<?>> classes = new ArrayList<>();
		if (!directory.exists()) {
			return classes;
		}
		File[] files = directory.listFiles();
		for (File file : files) {
			try {
				if (file.isDirectory()) {
					assert !file.getName().contains(".");
					classes.addAll(findClasses(file, packageName + "." + file.getName()));
				} else if (file.getName().endsWith(".class")) {
					classes.add(
							Class.forName(packageName + '.' + file.getName().substring(0, file.getName().length() - 6)));
				}
			}catch (NoClassDefFoundError e) {
				return classes;
			}
		}
		return classes;
	}

}
