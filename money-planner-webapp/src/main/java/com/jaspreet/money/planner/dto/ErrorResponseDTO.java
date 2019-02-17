package com.jaspreet.money.planner.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author jaspreet
 *
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ErrorResponseDTO {
	
	private String field;
	private String message;
}