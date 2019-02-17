package com.jaspreet.money.planner.exception;

/**
 * @author jaspreet
 *
 */
	
public class MoneyPlannerInternalException extends RuntimeException {
	private static final long serialVersionUID = 4220239859987241965L;

	public MoneyPlannerInternalException(String message) {
        super(message);
    }
    
    public MoneyPlannerInternalException(String message, Exception exception) {
        super(message, exception);
    }
}
