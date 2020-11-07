package nosi.core.validator.constraints;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import javax.validation.Constraint;
import javax.validation.Payload;

import nosi.core.validator.EmailValidator;
import nosi.core.validator.MessageValidator;
import nosi.core.validator.Patterns;

/**
 * @author Emanuel
 * 24 Jul 2019
 */
@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = EmailValidator.class)
@Documented
public @interface Email {
	String message() default MessageValidator.MESSAGE_EMAIL;

	Class<?>[] groups() default {};
	
	String regexp() default  Patterns.EMAIL_PATTERN;
	
	Class<? extends Payload>[] payload() default {};
}
