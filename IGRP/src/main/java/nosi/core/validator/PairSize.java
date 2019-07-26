package nosi.core.validator;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.CONSTRUCTOR;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.ElementType.TYPE_USE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;
import javax.validation.constraints.Negative;
import javax.validation.constraints.Size;

/**
 * emerson
 * 26/07/2019
 */
@Size(message = MessageValidator.MESSAGE_PAIR_SIZE)
@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = PairSizeValidator.class)
@Documented
public @interface PairSize {
	String message() default  MessageValidator.MESSAGE_PAIR_SIZE;

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

	/**
	 * Defines several {@link Size} annotations on the same element.
	 *
	 * @see Size
	 */
	@Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE })
	@Retention(RUNTIME)
	@Documented
	@interface List {

		Size[] value();
	}
}
