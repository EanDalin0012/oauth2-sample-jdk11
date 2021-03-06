package com.example.demooauth2.common.exception;

public class CustomException extends Throwable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String key;
    private String value;

    public CustomException(String key, String value) {
        this.key = key;
        this.value = value;
    }
    
    public CustomException(String key) {
        this.key = key;
    }

    public CustomException(String key, Throwable throwable) {
        super(throwable);
        this.key = key;
    }

    public CustomException(String key, String value, Throwable throwable) {
        super(throwable);
        this.key = key;
        this.value = value;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
}
