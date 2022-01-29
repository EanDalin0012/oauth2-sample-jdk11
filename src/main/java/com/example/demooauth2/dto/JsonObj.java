package com.example.demooauth2.dto;


import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class JsonObj extends LinkedHashMap<String, Object> {
    private boolean nullToInitialize = false;


    public boolean isNullToInitialize() {
        return this.nullToInitialize;
    }

    public void setNullToInitialize(boolean nullToInitialize) {
        this.nullToInitialize = nullToInitialize;
    }

    public JsonObj() {
        super();
    }

    public JsonObj(Map<String, Object> map) {
        super(map);
    }

    public String getString(String key) {
        if (get(key) != null) {
            return String.valueOf(get(key));
        }
        return null;
    }

    public BigDecimal getBigDecimal(String key) {
        if (get(key) != null && !getString(key).isEmpty()) {
            return new BigDecimal(getString(key));
        }
        return BigDecimal.ZERO;
    }

    public long getLong(String key) {
        if (get(key) != null) {
            return Long.valueOf(getString(key)).longValue();
        }
        return 0L;
    }

    public int getInt(String key) {
        if (get(key) != null) {
            return Integer.valueOf(getString(key)).intValue();
        }
        return 0;
    }

    public Boolean getBoolean(String key) {
        if (get(key) != null) {
            return Boolean.valueOf(getString(key)).booleanValue();
        }
        return null;
    }

    public short getShort(String key) {
        if (get(key) != null) {
            return Short.valueOf(getString(key)).shortValue();
        }
        return 0;
    }

    public double getDouble(String key) {
        if (get(key) != null) {
            return Double.valueOf(getString(key)).doubleValue();
        }
        return 0.0D;
    }

    public float getFloat(String key) {
        if (get(key) != null) {
            return Float.valueOf(getString(key)).floatValue();
        }
        return 0.0F;
    }

    @SuppressWarnings({"unchecked"})
    public JsonObj getJsonObject(String key) {
        try {
            Object obj = get(key);
            if (obj instanceof JsonObj) {
                return (JsonObj) obj;
            } else if (obj instanceof LinkedHashMap) {
                return new JsonObj((LinkedHashMap<String, Object>) obj);
            } else {
                return obj == null ? new JsonObj() : (JsonObj) obj;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new JsonObj();
    }

    public void set(String key, Object value) {
        this.put(key, value);
    }

    public void setString(String key, String value) {
        this.put(key, value);
    }

    public void setBigDecimal(String key, BigDecimal value) {
        this.put(key, value);
    }

    public void setLong(String key, long value) {
        this.put(key, value);
    }

    public void setInt(String key, int value) {
        this.put(key, value);
    }

    public void setBoolean(String key, boolean value) {
        this.put(key, value);
    }

    public void setShort(String key, short value) {
        this.put(key, value);
    }

    public void setDouble(String key, double value) {
        this.put(key, value);
    }

    public void setFloat(String key, float value) {
        this.put(key, value);
    }

    public void setJsonObject(String key, JsonObj value) {
        this.put(key, value);
    }

    public void setJsonObjectArray(String key, JsonObjArray value) {
        this.put(key, value);
    }

    public JsonObjArray getJsonObjectArray(String key) {
        try {
            Object obj = get(key);
            if (obj instanceof JsonObjArray) {
                return (JsonObjArray) obj;
            } else if (obj instanceof ArrayList) {
                return new JsonObjArray((List<LinkedHashMap<String, Object>>) obj);
            } else {
                return obj == null ? new JsonObjArray() : (JsonObjArray) obj;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new JsonObjArray();
    }

    public void appendFrom(JsonObj data) {
        this.putAll(data);
    }
}
