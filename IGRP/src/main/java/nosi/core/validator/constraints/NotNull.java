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
import nosi.core.validator.NotNullValidator;

/**
 * @author Emanuel
 * 24 Jul 2019
 */

@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = NotNullValidator.class)
@Documented
public @interface NotNull {
	String message() default MessageValidator.MESSAGE_NOT_NULL;

	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default {};

}
