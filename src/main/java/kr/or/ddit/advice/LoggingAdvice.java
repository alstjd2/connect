package kr.or.ddit.advice;


import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class LoggingAdvice {
	public void before() {
		log.info("----------------------------------------------");
	}

	public void after() {
		log.info("===========after===============");
	}

	public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
		Object target = joinPoint.getTarget();
		Signature signature = joinPoint.getSignature();
		Object[] args = joinPoint.getArgs();
		log.info("---------------------{}.{}({})---------------------",target.getClass().getSimpleName(), signature.getName(), args);
		Object result = joinPoint.proceed(args);
		log.info("===========return value : {}===============",result);
		return result;
	}

}
