package com.jaspreet.money.planner;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @author jaspreet
 *
 */
@SpringBootApplication // Combination of @Configuration, @EnableAutoConfiguration, @ComponentScan
public class MoneyPlannerWebApplication extends SpringBootServletInitializer {
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(MoneyPlannerWebApplication.class);
	}

	public static void main(String[] args) throws Exception {
		SpringApplication.run(MoneyPlannerWebApplication.class, args);
	}
}
