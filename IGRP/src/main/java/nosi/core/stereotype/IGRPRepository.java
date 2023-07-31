package nosi.core.stereotype;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import jakarta.enterprise.inject.Stereotype;
import jakarta.inject.Singleton;

/**
 * Indicates that an annotated class is a "Repository", originally defined by
 * Domain-Driven Design (Evans, 2003) as "a mechanism for encapsulating storage,
 * retrieval, and search behavior which emulates a collection of objects".
 *
 * <p>Teams implementing traditional Java EE patterns such as "Data Access Object"
 * may also apply this stereotype to DAO classes, though care should be taken to
 * understand the distinction between Data Access Object and DDD-style repositories
 * before doing so. This annotation is a general-purpose stereotype and individual teams
 * may narrow their semantics and use as appropriate.
 *
 * {@link Component @IGRPComponent}, allowing for implementation classes to be autodetected
 * through classpath scanning.
 *
 * @author Maria Moniz
 * @author Brocy Centeio
 */

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Singleton
@Stereotype
@IGRPComponent
public @interface IGRPRepository {

	/**
	 * The value may indicate a suggestion for a logical component name
	 */
	String name() default "";

}