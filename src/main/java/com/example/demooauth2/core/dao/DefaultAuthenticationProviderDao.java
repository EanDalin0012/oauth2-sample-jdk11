package com.example.demooauth2.core.dao;

import com.example.demooauth2.dto.JsonObj;
import com.example.demooauth2.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DefaultAuthenticationProviderDao {
    UserDTO getUserByName(JsonObj param);
//    JsonObj authenticate(JsonObj jsonObject);
}
