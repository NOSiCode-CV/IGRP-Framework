package nosi.core.stereotype;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.enterprise.context.RequestScoped;
import jakarta.enterprise.inject.Stereotype;

/**
 * Indicates that an annotated class is a "Controller" (e.g. a web controller).
 *
 * <p>This annotation serves as a specialization of {@link Component @IGRPComponent},
 * allowing for implementation classes to be autodetected through classpath scanning.
 *
 * @author Maria Moniz
 * @author Brocy Centeio
 */


@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@RequestScoped
@Stereotype
@IGRPComponent
public @interface IGRPController {

	/**
	 * The value may indicate a suggestion for a logical component name
	 */
	
	String name() default "";

}