package nosi.webapps.hackathon1.core.steriotype;


/**
 * Indicates that an annotated class is a "Controller" (e.g. a web controller).
 *
 * <p>This annotation serves as a specialization of {@link Component @IGRPComponent},
 * allowing for implementation classes to be autodetected through classpath scanning.
 *
 * @author Maria Moniz
 * @author Brocy Centeio
 */

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@IGRPComponent
public @interface IGRPController {

	/**
	 * The value may indicate a suggestion for a logical component name
	 */
	
	String name() default "";

}