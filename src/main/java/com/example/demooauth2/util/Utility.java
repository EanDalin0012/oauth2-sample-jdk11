package com.example.demooauth2.util;

import com.example.demooauth2.common.exception.CustomException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONObject;
import org.json.XML;
import org.springframework.core.io.Resource;

import java.io.IOException;
import java.util.Map;

@Slf4j
public class Utility {
	public static final ObjectMapper objectMapper = new ObjectMapper();
	
	public static String toJSON(Object object) {
		try {
			return objectMapper.writeValueAsString(object);
		} catch (IOException ex) {
			log.error("IOException: " + ex.getMessage());
			return null;
		}
	}
	
	public static JsonNode readTree(String json) throws IOException {
		return objectMapper.readTree(json);
	}

	public static JsonNode readTree(Resource resource) throws IOException {
		return objectMapper.readTree(resource.getFile());
	}
	
	public static <T> T convert(Object object, Class<T> clazz) {
		return objectMapper.convertValue(object, clazz);
	}

	public static <T> T convert(Object object, TypeReference<T> typeReference) {
		return objectMapper.convertValue(object, typeReference);
	}
	
	public static Map<String, Object> convert(Object object) {
		return objectMapper.convertValue(object, new TypeReference<Map<String, Object>>() {});
	}
	
	public static <T> T readJSON(String json, Class<T> clazz) throws CustomException {
		try {
			return objectMapper.readValue(json, clazz);
		}catch(Exception ex) {
			log.error(ex.getMessage()); 
			throw new CustomException(ex.getMessage());
		}
	}
	
	public static Map<String, Object> readJSON(String json) throws CustomException {
		try {
			return objectMapper.readValue(json, new TypeReference<Map<String, Object>>() {});
		}catch(Exception ex) {
			log.error(ex.getMessage()); 
			throw new CustomException(ex.getMessage());
		}
	}

	public static <T> T readJSON(byte[] json, Class<T> clazz) throws CustomException {
		try {
			return objectMapper.readValue(json, clazz);
		}catch(Exception ex) {
			log.error(ex.getMessage()); 
			throw new CustomException(ex.getMessage());
		}
	}

	public static <T> T readJSON(String json, TypeReference<T> typeReference) throws CustomException {
		try {
			return objectMapper.readValue(json, typeReference);
		}catch(Exception ex) {
			log.error(ex.getMessage()); 
			throw new CustomException(ex.getMessage());
		}
	}
	
	 public static <T> T xmlToObject(String xml, TypeReference<T> clazz) throws Exception, CustomException {
	        try {
	            return readJSON(xmlToJson(xml), clazz);
	        } catch (Exception ex) {
	            log.error(ex.getMessage());
	            throw ex;
	        }
	    }

	    public static String objectToXml(Object object) throws Exception {
	        try {
	            return jsonToXml(toJSON(object));
	        } catch (Exception ex) {
	            log.error(ex.getMessage());
	            throw ex;
	        }
	    }
	    
	    public static String xmlToJson(String xml) {
	        JSONObject xmlJSONObj = XML.toJSONObject(xml);
	        return xmlJSONObj.toString();
	    }

	    public static String jsonToXml(String json) {
	        JSONObject jsonObject = new JSONObject(json);
	        String xml = XML.toString(jsonObject);
	        return xml;
	    }
	    
	    
	    public static void main(String[] args) {
	    	try {
	    		if("Successf".equalsIgnoreCase("SUCCESS")) {
	    			log.info("msg :"+ true);
	    		}
	    		
	    		String xml = "<TRANSACTION>\r\n" + 
	    				"    <SN>764</SN>\r\n" + 
	    				"    <SERVICETYPE>DDSO</SERVICETYPE>\r\n" + 
	    				"    <SERVICESUBTYPE>DIRECTDB/STANDORDER</SERVICESUBTYPE>\r\n" + 
	    				"    <SUBSERVICE>DIRECTDB/STANDORDER</SUBSERVICE>\r\n" + 
	    				"    <SERVICENAME>xxx</SERVICENAME>\r\n" + 
	    				"    <INITIATERWINGID>1000000034</INITIATERWINGID>\r\n" + 
	    				"    <INITIATEEWINGID>00049019</INITIATEEWINGID>\r\n" + 
	    				"    <CURRENCY>USD</CURRENCY>\r\n" + 
	    				"    <AMOUNT>1</AMOUNT>\r\n" + 
	    				"</TRANSACTION>";
	    		
	    		String data = Utility.xmlToJson(xml);
	    		log.info("msg :"+data);
	    		
	    	}catch (Exception e) {
				// TODO: handle exception
			}
		}
}
