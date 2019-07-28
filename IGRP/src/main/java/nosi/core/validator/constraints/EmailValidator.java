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
import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import nosi.core.validator.MessageValidator;
import nosi.core.validator.Patterns;

/**
 * @author Emanuel
 * 24 Jul 2019
 */
@Email(message = MessageValidator.MESSAGE_EMAIL)
@Pattern(regexp = Patterns.EMAIL_PATTERN, message = MessageValidator.MESSAGE_EMAIL)
@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {})
@Documented
public @interface EmailValidator {
	String message() default MessageValidator.MESSAGE_EMAIL;

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};
}
