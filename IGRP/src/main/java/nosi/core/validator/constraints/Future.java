package nosi.core.validator.constraints;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import nosi.core.validator.FutureValidator;
import nosi.core.validator.MessageValidator;

/**
 * emerson
 * 29/07/2019
 */
@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RUNTIME)
@Constraint(validatedBy = FutureValidator.class)
@Documented
/**
 * emerson
 * 29 Jul 2019
 */
public @interface Future {
	String message() default MessageValidator.MESSAGE_FUTURE;

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}