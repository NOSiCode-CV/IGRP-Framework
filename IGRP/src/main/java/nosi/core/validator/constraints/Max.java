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
import nosi.core.validator.MaxValidator;
import nosi.core.validator.MessageValidator;

/**
 * emerson
 * 25/07/2019 
 */

@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = MaxValidator.class)
@Documented
public @interface Max {
	String message() default MessageValidator.MESSAGE_MAX;

	Class<?>[] groups() default {};
	
	String value();
	
	Class<? extends Payload>[] payload() default {};
	
}