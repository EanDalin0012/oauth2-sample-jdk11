package com.example.demooauth2.common;

import com.fasterxml.jackson.annotation.JsonValue;

public enum ResponseStatus {
    SUCCESS, FAILED, PENDING, REFUNDED, NOT_FOUND{

        @Override
        public String toValue() {
            return "404";
        }

    };

    @JsonValue
    public String toValue() {
        return this.name();
    }
}
