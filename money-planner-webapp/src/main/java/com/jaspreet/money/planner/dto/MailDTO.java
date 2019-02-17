package com.jaspreet.money.planner.dto;

import java.util.Map;

import org.springframework.core.io.InputStreamSource;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailDTO {

    private String from;
    private String to;
    private String subject;
    private String templateName;
    private Map<String, Object> model;
    private Map<String, InputStreamSource> attachments;

}
