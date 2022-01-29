package com.example.demooauth2.core.dao;

import com.example.demooauth2.dto.JsonObj;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DefaultAuthenticationProviderDao {
    JsonObj getUserByName(JsonObj param);
//    JsonObj authenticate(JsonObj jsonObject);
}
