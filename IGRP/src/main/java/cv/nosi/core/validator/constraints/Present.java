package cv.nosi.core.validator.constraints;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

import cv.nosi.core.validator.MessageValidator;
import cv.nosi.core.validator.PresentValidator;

@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RUNTIME)
@Constraint(validatedBy = PresentValidator.class)
@Documented
/**
 * Emanuel
 * 29 Jul 2019
 */
public @interface Present {
	String message() default MessageValidator.MESSAGE_PRESENT;

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}