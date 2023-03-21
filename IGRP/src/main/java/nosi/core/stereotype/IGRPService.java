package nosi.core.stereotype;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.enterprise.context.RequestScoped;
import jakarta.enterprise.inject.Stereotype;

/**
 * Indicates that an annotated class is a "Service", originally defined by Domain-Driven
 * Design (Evans, 2003) as "an operation offered as an interface that stands alone in the
 * model, with no encapsulated state."
 *
 * <p>May also indicate that a class is a "Business Service Facade" (in the Core J2EE
 * patterns sense), or something similar. This annotation is a general-purpose stereotype
 * and individual teams may narrow their semantics and use as appropriate.
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
public @interface IGRPService {

	/**
	 * The value may indicate a suggestion for a logical component name
	 */
	String name() default "";

}