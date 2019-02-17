package com.jaspreet.money.planner.exception;

import lombok.Getter;
import lombok.Setter;

/**
 * @author jaspreet
 *
 */
@Getter
@Setter
public class MoneyPlannerValidationException extends RuntimeException {
	
	private static final long serialVersionUID = 4220239859987241965L;
	
	private String field;

	public MoneyPlannerValidationException(String field, String message) {
        super(message);
        this.setField(field);
    }
    
    public MoneyPlannerValidationException(String field, String message,Exception exception) {
        super(message, exception);
        this.setField(field);
    }

}
