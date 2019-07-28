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
import nosi.core.validator.MessageValidator;
import nosi.core.validator.SizeValidator;

/**
 * emerson
 * 26/07/2019
 */
@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = SizeValidator.class)
@Documented
public @interface Size {
	
	String message() default MessageValidator.MESSAGE_SIZE;

	Class<?>[] groups() default { };

	Class<? extends Payload>[] payload() default { };

	/**
	 * @return size the element must be higher or equal to
	 */
	int min() default 0;
 
	/**
	 * @return size the element must be lower or equal to
	 */
	int max() default Integer.MAX_VALUE;

}
