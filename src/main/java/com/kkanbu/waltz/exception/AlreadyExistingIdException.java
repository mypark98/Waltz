package com.kkanbu.waltz.exception;

public class AlreadyExistingIdException extends RuntimeException{
    public AlreadyExistingIdException(String message) {
        super(message);
    }
}

