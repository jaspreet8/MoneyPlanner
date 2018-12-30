package com.jaspreet.money.planner.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author jaspreet
 *
 */
@Data
@AllArgsConstructor
public class ErrorResponseDTO {
	
	private String field;
	private String message;
}