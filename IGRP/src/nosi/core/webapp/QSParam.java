package nosi.core.webapp;

import java.lang.annotation.*;
/**
 * @author Marcel Iekiny
 * Apr 20, 2017
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.PARAMETER)
public @interface QSParam {
	public String qsParamName() default "";
}
