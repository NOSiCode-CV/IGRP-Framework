package cv.nosi.core.validator.constraints;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

import cv.nosi.core.validator.DigitsValidator;
import cv.nosi.core.validator.MessageValidator;

/**
 * @author Emanuel
 * 27 Jul 2019
 */

@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = DigitsValidator.class)
@Documented
public @interface Digits {
	
	String message() default MessageValidator.MESSAGE_DIGITS;

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};

	int fraction() default 0;
	int integer();
}