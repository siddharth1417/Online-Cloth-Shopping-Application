package com.iacsd.exception.customexceptions;

public class NoAddressFoundException extends RuntimeException{
    public NoAddressFoundException(String msg) {
        super(msg);
    }
}
