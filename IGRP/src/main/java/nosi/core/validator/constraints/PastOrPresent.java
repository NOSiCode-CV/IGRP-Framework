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

import nosi.core.validator.MessageValidator;
import nosi.core.validator.PastOrPresentValidator;

@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RUNTIME)
@Constraint(validatedBy = PastOrPresentValidator.class)
@Documented
/**
 * emerson
 * 29 Jul 2019
 */
public @interface PastOrPresent {
	String message() default MessageValidator.MESSAGE_PAST_OR_PRESENT;

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}