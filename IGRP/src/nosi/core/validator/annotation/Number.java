package nosi.core.validator.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Marcel Iekiny
 * Jun 2, 2017
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface Number {
	String []acceptedScenarios() default {};
	String []ignoredScenarios() default {};
	boolean allowEmpty() default true;
	boolean skipOnError() default false;
	String message() default "";
	
	boolean justInteger() default false;
	float minValue() default 0;
	float maxValue() default 0;
	String tooBig() default "";
	String tooSmall() default "";
}
