package com.iacsd.exception;


import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import com.iacsd.exception.customexceptions.NoAddressFoundException;
import com.iacsd.exception.customexceptions.OrderItemNotFoundException;
import com.iacsd.exception.customexceptions.PasswordMismatchException;
import com.iacsd.exception.customexceptions.UserAlreadyExistsException;
import com.iacsd.exception.customexceptions.UserNotFoundException;

import org.springframework.web.bind.annotation.ExceptionHandler;

@Order(Ordered.HIGHEST_PRECEDENCE)
@RestControllerAdvice
public class CustomExceptionHandler {
    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<ExceptionEntity> handleUserNotFoundException(UserNotFoundException e) {
        return new ResponseEntity<>(new ExceptionEntity(HttpStatus.NOT_FOUND,e.getMessage(),HttpStatus.NOT_FOUND.value()),HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(UserAlreadyExistsException.class)
    public ResponseEntity<ExceptionEntity> handleUserAlreadyExistsException(UserAlreadyExistsException e) {
        return new ResponseEntity<>(new ExceptionEntity(HttpStatus.INTERNAL_SERVER_ERROR,e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR.value()),HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @ExceptionHandler(PasswordMismatchException.class)
    public ResponseEntity<ExceptionEntity> handlePasswordMismatchException(PasswordMismatchException e) {
        return new ResponseEntity<>(new ExceptionEntity(HttpStatus.INTERNAL_SERVER_ERROR,e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR.value()),HttpStatus.INTERNAL_SERVER_ERROR);
    }

    @ExceptionHandler(NoAddressFoundException.class)
    public ResponseEntity<ExceptionEntity> handleNoAddressFoundException(NoAddressFoundException e) {
        return new ResponseEntity<>(new ExceptionEntity(HttpStatus.NOT_FOUND,e.getMessage(),HttpStatus.NOT_FOUND.value()),HttpStatus.NOT_FOUND);
    }
    //add further exception

    @ExceptionHandler(OrderItemNotFoundException.class)
    public ResponseEntity<ExceptionEntity> handleOrderItemNotFoundException(OrderItemNotFoundException e) {
    	return new ResponseEntity<>(new ExceptionEntity(HttpStatus.NOT_FOUND,e.getMessage(),HttpStatus.NOT_FOUND.value()),HttpStatus.NOT_FOUND);
    }
    
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ExceptionEntity> handleAnyException(Exception e) {
        return new ResponseEntity<>(new ExceptionEntity(HttpStatus.INTERNAL_SERVER_ERROR,e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR.value()),HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    

}
