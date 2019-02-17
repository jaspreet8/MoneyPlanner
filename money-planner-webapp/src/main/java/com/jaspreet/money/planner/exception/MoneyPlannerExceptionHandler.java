package com.jaspreet.money.planner.exception;

import java.util.Enumeration;
import java.util.StringJoiner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.jaspreet.money.planner.dto.ErrorResponseDTO;

/**
 * @author jaspreet
 *
 */
@ControllerAdvice(basePackages = "com.jaspreet.money.planner")
@SuppressWarnings(value={"unchecked","rawtypes"})
public class MoneyPlannerExceptionHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(MoneyPlannerExceptionHandler.class);
    
    @ExceptionHandler(MoneyPlannerValidationException.class)
    public ResponseEntity<ErrorResponseDTO> validationExceptionHandler(MoneyPlannerValidationException exception) {
        ErrorResponseDTO error = new ErrorResponseDTO();
        error.setField(exception.getField());
        error.setMessage(exception.getMessage());
        return (ResponseEntity<ErrorResponseDTO>)new ResponseEntity((Object)error, HttpStatus.BAD_REQUEST);
    }
    
	@ExceptionHandler(MoneyPlannerInternalException.class)
    public ResponseEntity<ErrorResponseDTO> externalSystemExceptionHandler(MoneyPlannerInternalException exception) {
    	ErrorResponseDTO error = new ErrorResponseDTO();
        error.setMessage(exception.getMessage());
        return (ResponseEntity<ErrorResponseDTO>)new ResponseEntity((Object)error, HttpStatus.BAD_GATEWAY);
    }
    
	@ExceptionHandler(Exception.class)
    public ResponseEntity<ErrorResponseDTO> generalExceptionHandler(HttpServletRequest request, HttpSession session, Exception ex) {
        logger.error("Exception occured during request: {}", requestDetails(request, session),ex);
        ErrorResponseDTO error = new ErrorResponseDTO();
        error.setMessage(ex.getMessage());
        return (ResponseEntity<ErrorResponseDTO>)new ResponseEntity((Object)error, HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    private String requestDetails(HttpServletRequest request, HttpSession session) {
        StringJoiner requestDetails = new StringJoiner(", ");
        requestDetails.add("Exception request URL :");
        requestDetails.add(request.getRequestURL());
        requestDetails.add("Exception request Method :");
        requestDetails.add(request.getMethod());
        requestDetails.add("Exception request Headers :");
        Enumeration<String> enumeration = (Enumeration<String>)request.getHeaderNames();
        while (enumeration.hasMoreElements()) {
            String headername = enumeration.nextElement();
            requestDetails.add(headername);
            requestDetails.add("  : " + request.getHeader(headername) + "  ,");
        }
        return String.valueOf(requestDetails);
    }
}

