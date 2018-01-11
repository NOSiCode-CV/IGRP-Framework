package nosi.core.validator.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Marcel Iekiny
 * May 29, 2017
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface Email {
	String []acceptedScenarios() default {};
	String []ignoredScenarios() default {};
	boolean allowEmpty() default true;
	boolean skipOnError() default false;
	String message() default "";
	boolean allowName() default false;
}
