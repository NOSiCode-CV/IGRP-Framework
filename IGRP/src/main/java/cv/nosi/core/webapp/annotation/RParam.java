package cv.nosi.core.webapp.annotation;

import java.lang.annotation.*;
/**
 * @author Marcel Iekiny
 * Apr 20, 2017
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD, ElementType.PARAMETER})
public @interface RParam { // Request parameter
	public String rParamName() default "";
	public String defaultValue() default "";
}
