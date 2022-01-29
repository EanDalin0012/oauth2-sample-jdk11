/*
 Navicat Premium Data Transfer

 Source Server         : Postgresql
 Source Server Type    : PostgreSQL
 Source Server Version : 140001
 Source Host           : localhost:5432
 Source Catalog        : oauth2
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140001
 File Encoding         : 65001

 Date: 29/01/2022 12:19:21
*/


-- ----------------------------
-- Sequence structure for authority_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."authority_id_seq";
CREATE SEQUENCE "public"."authority_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for hibernate_sequence
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hibernate_sequence";
CREATE SEQUENCE "public"."hibernate_sequence" 
INCREMENT 1
MINVALUE  100
MAXVALUE 9223372036854775807
START 100
CACHE 1;

-- ----------------------------
-- Sequence structure for user__id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user__id_seq";
CREATE SEQUENCE "public"."user__id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS "public"."address";
CREATE TABLE "public"."address" (
  "id" int8 NOT NULL,
  "house_number" varchar(255) COLLATE "pg_catalog"."default",
  "street" varchar(255) COLLATE "pg_catalog"."default",
  "zip_code" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO "public"."address" VALUES (1, '1', 'Street X', '12-341');
INSERT INTO "public"."address" VALUES (2, '2', 'Street Y', '12-342');
INSERT INTO "public"."address" VALUES (3, '3', 'Street Z', '12-343');
INSERT INTO "public"."address" VALUES (4, '4', 'Street XX', '12-344');
INSERT INTO "public"."address" VALUES (5, '5', 'Street YY', '12-345');
INSERT INTO "public"."address" VALUES (6, '6', 'Street ZZ', '12-346');
INSERT INTO "public"."address" VALUES (7, '7', 'Street XXX', '12-347');

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS "public"."authority";
CREATE TABLE "public"."authority" (
  "id" int8 NOT NULL DEFAULT nextval('authority_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO "public"."authority" VALUES (1, 'COMPANY_CREATE');
INSERT INTO "public"."authority" VALUES (2, 'COMPANY_READ');
INSERT INTO "public"."authority" VALUES (3, 'COMPANY_UPDATE');
INSERT INTO "public"."authority" VALUES (4, 'COMPANY_DELETE');
INSERT INTO "public"."authority" VALUES (5, 'DEPARTMENT_CREATE');
INSERT INTO "public"."authority" VALUES (6, 'DEPARTMENT_READ');
INSERT INTO "public"."authority" VALUES (7, 'DEPARTMENT_UPDATE');
INSERT INTO "public"."authority" VALUES (8, 'DEPARTMENT_DELETE');
INSERT INTO "public"."authority" VALUES (9, 'ROLE_COMPANY_READER');

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS "public"."car";
CREATE TABLE "public"."car" (
  "id" int8 NOT NULL,
  "registration_number" varchar(255) COLLATE "pg_catalog"."default",
  "company_id" int8
)
;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO "public"."car" VALUES (1, 'XYZ10ABC', 1);
INSERT INTO "public"."car" VALUES (2, 'XYZ11ABC', 1);
INSERT INTO "public"."car" VALUES (3, 'XYZ12ABC', 1);
INSERT INTO "public"."car" VALUES (4, 'XYZ13ABC', 2);

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS "public"."company";
CREATE TABLE "public"."company" (
  "id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO "public"."company" VALUES (1, 'Pepsi');
INSERT INTO "public"."company" VALUES (2, 'Coca Cola');
INSERT INTO "public"."company" VALUES (3, 'Sprite');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS "public"."department";
CREATE TABLE "public"."department" (
  "id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "company_id" int8
)
;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO "public"."department" VALUES (1, 'Sales & Marketing', 1);
INSERT INTO "public"."department" VALUES (2, 'Research & Development', 1);
INSERT INTO "public"."department" VALUES (3, 'Administration', 1);
INSERT INTO "public"."department" VALUES (4, 'Human Resources', 2);
INSERT INTO "public"."department" VALUES (5, 'Sales & Marketing', 3);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS "public"."employee";
CREATE TABLE "public"."employee" (
  "id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "surname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "address_id" int8,
  "department_id" int8
)
;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO "public"."employee" VALUES (1, 'John', 'William', 1, 1);
INSERT INTO "public"."employee" VALUES (2, 'Robert', 'James', 2, 2);
INSERT INTO "public"."employee" VALUES (3, 'Donald', 'Tyler', 3, 3);

-- ----------------------------
-- Table structure for oauth_access_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_access_token";
CREATE TABLE "public"."oauth_access_token" (
  "token_id" varchar(255) COLLATE "pg_catalog"."default",
  "token" bytea,
  "authentication_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_name" varchar(255) COLLATE "pg_catalog"."default",
  "client_id" varchar(255) COLLATE "pg_catalog"."default",
  "authentication" bytea,
  "refresh_token" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------
INSERT INTO "public"."oauth_access_token" VALUES ('f64fa22f035a9980a33823b4c401def4', E'\\254\\355\\000\\005sr\\000Corg.springframework.security.oauth2.common.DefaultOAuth2AccessToken\\014\\262\\2366\\033$\\372\\316\\002\\000\\006L\\000\\025additionalInformationt\\000\\017Ljava/util/Map;L\\000\\012expirationt\\000\\020Ljava/util/Date;L\\000\\014refreshTokent\\000?Lorg/springframework/security/oauth2/common/OAuth2RefreshToken;L\\000\\005scopet\\000\\017Ljava/util/Set;L\\000\\011tokenTypet\\000\\022Ljava/lang/String;L\\000\\005valueq\\000~\\000\\005xpsr\\000\\036java.util.Collections$EmptyMapY6\\024\\205Z\\334\\347\\320\\002\\000\\000xpsr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001~\\244\\321\\250\\017xsr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationq\\000~\\000\\002xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valueq\\000~\\000\\005xpt\\000$c8c634dc-8782-46f4-9db7-53c36b525bb0sq\\000~\\000\\011w\\010\\000\\000\\001\\177>\\253\\244`xsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001ct\\000\\026Ljava/util/Collection;xpsr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\004?@\\000\\000\\000\\000\\000\\002t\\000\\004readt\\000\\005writext\\000\\006bearert\\000$b244ceb3-543b-4ac4-9f99-f2c455cbe29d', 'b3d4f618e90014de204b71dd1b217564', '{username=admin}', 'spring-security-oauth2-read-write-client', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\011w\\004\\000\\000\\000\\011sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\0020\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\016COMPANY_CREATEsq\\000~\\000\\015t\\000\\014COMPANY_READsq\\000~\\000\\015t\\000\\016COMPANY_UPDATEsq\\000~\\000\\015t\\000\\016COMPANY_DELETEsq\\000~\\000\\015t\\000\\021DEPARTMENT_CREATEsq\\000~\\000\\015t\\000\\017DEPARTMENT_READsq\\000~\\000\\015t\\000\\021DEPARTMENT_UPDATEsq\\000~\\000\\015t\\000\\021DEPARTMENT_DELETEsq\\000~\\000\\015t\\000\\023ROLE_COMPANY_READERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000$xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000"L\\000\\005scopeq\\000~\\000$xpt\\000(spring-security-oauth2-read-write-clientsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000"xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\003t\\000\\012grant_typet\\000\\010passwordt\\000\\011client_idt\\000(spring-security-oauth2-read-write-clientt\\000\\010usernamet\\000\\005adminxsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002t\\000\\004readt\\000\\005writex\\001sq\\000~\\0005w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001sq\\000~\\000\\015t\\000\\004USERxsq\\000~\\000*?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\0005w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\030resource-server-rest-apixsq\\000~\\0005w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\0020\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\011w\\004\\000\\000\\000\\011q\\000~\\000\\017q\\000~\\000\\021q\\000~\\000\\023q\\000~\\000\\025q\\000~\\000\\027q\\000~\\000\\031q\\000~\\000\\033q\\000~\\000\\035q\\000~\\000\\037xq\\000~\\000Csr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000*?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\003q\\000~\\000,q\\000~\\000-q\\000~\\000.q\\000~\\000/q\\000~\\0000q\\000~\\0001x\\000psr\\000"com.example.demooauth2.dto.JsonObj,\\362\\267\\350\\237\\221\\265\\214\\002\\000\\001Z\\000\\020nullToInitializexq\\000~\\000D?@\\000\\000\\000\\000\\000\\014w\\010\\000\\000\\000\\020\\000\\000\\000\\001t\\000\\010usernamet\\000\\005adminx\\000\\000', 'a383e3f9bb067c84c9dee9b900f92d94');

-- ----------------------------
-- Table structure for oauth_approvals
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_approvals";
CREATE TABLE "public"."oauth_approvals" (
  "userid" varchar(255) COLLATE "pg_catalog"."default",
  "clientid" varchar(255) COLLATE "pg_catalog"."default",
  "scope" varchar(255) COLLATE "pg_catalog"."default",
  "status" varchar(10) COLLATE "pg_catalog"."default",
  "expiresat" timestamp(6),
  "lastmodifiedat" timestamp(6)
)
;

-- ----------------------------
-- Records of oauth_approvals
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_client_details";
CREATE TABLE "public"."oauth_client_details" (
  "client_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "resource_ids" varchar(255) COLLATE "pg_catalog"."default",
  "client_secret" varchar(255) COLLATE "pg_catalog"."default",
  "scope" varchar(255) COLLATE "pg_catalog"."default",
  "authorized_grant_types" varchar(255) COLLATE "pg_catalog"."default",
  "web_server_redirect_uri" varchar(255) COLLATE "pg_catalog"."default",
  "authorities" varchar(255) COLLATE "pg_catalog"."default",
  "access_token_validity" int4,
  "refresh_token_validity" int4,
  "additional_information" varchar(4096) COLLATE "pg_catalog"."default",
  "autoapprove" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO "public"."oauth_client_details" VALUES ('spring-security-oauth2-read-client', 'resource-server-rest-api', '$2a$04$WGq2P9egiOYoOFemBRfsiO9qTcyJtNRnPKNBl5tokP7IP.eZn93km', 'read', 'password,authorization_code,refresh_token,implicit', NULL, 'USER', 10800, 2592000, NULL, NULL);
INSERT INTO "public"."oauth_client_details" VALUES ('spring-security-oauth2-read-write-client', 'resource-server-rest-api', '$2a$04$soeOR.QFmClXeFIrhJVLWOQxfHjsJLSpWrU1iGxcMGdu.a5hvfY4W', 'read,write', 'password,authorization_code,refresh_token,implicit', NULL, 'USER', 10800, 2592000, NULL, NULL);

-- ----------------------------
-- Table structure for oauth_client_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_client_token";
CREATE TABLE "public"."oauth_client_token" (
  "token_id" varchar(255) COLLATE "pg_catalog"."default",
  "token" bytea,
  "authentication_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "user_name" varchar(255) COLLATE "pg_catalog"."default",
  "client_id" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of oauth_client_token
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_code
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_code";
CREATE TABLE "public"."oauth_code" (
  "code" varchar(255) COLLATE "pg_catalog"."default",
  "authentication" bytea
)
;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------

-- ----------------------------
-- Table structure for oauth_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth_refresh_token";
CREATE TABLE "public"."oauth_refresh_token" (
  "token_id" varchar(255) COLLATE "pg_catalog"."default",
  "token" bytea,
  "authentication" bytea
)
;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------
INSERT INTO "public"."oauth_refresh_token" VALUES ('a383e3f9bb067c84c9dee9b900f92d94', E'\\254\\355\\000\\005sr\\000Lorg.springframework.security.oauth2.common.DefaultExpiringOAuth2RefreshToken/\\337Gc\\235\\320\\311\\267\\002\\000\\001L\\000\\012expirationt\\000\\020Ljava/util/Date;xr\\000Dorg.springframework.security.oauth2.common.DefaultOAuth2RefreshTokens\\341\\016\\012cT\\324^\\002\\000\\001L\\000\\005valuet\\000\\022Ljava/lang/String;xpt\\000$c8c634dc-8782-46f4-9db7-53c36b525bb0sr\\000\\016java.util.Datehj\\201\\001KYt\\031\\003\\000\\000xpw\\010\\000\\000\\001\\177>\\253\\244`x', E'\\254\\355\\000\\005sr\\000Aorg.springframework.security.oauth2.provider.OAuth2Authentication\\275@\\013\\002\\026bR\\023\\002\\000\\002L\\000\\015storedRequestt\\000<Lorg/springframework/security/oauth2/provider/OAuth2Request;L\\000\\022userAuthenticationt\\0002Lorg/springframework/security/core/Authentication;xr\\000Gorg.springframework.security.authentication.AbstractAuthenticationToken\\323\\252(~nGd\\016\\002\\000\\003Z\\000\\015authenticatedL\\000\\013authoritiest\\000\\026Ljava/util/Collection;L\\000\\007detailst\\000\\022Ljava/lang/Object;xp\\000sr\\000&java.util.Collections$UnmodifiableList\\374\\017%1\\265\\354\\216\\020\\002\\000\\001L\\000\\004listt\\000\\020Ljava/util/List;xr\\000,java.util.Collections$UnmodifiableCollection\\031B\\000\\200\\313^\\367\\036\\002\\000\\001L\\000\\001cq\\000~\\000\\004xpsr\\000\\023java.util.ArrayListx\\201\\322\\035\\231\\307a\\235\\003\\000\\001I\\000\\004sizexp\\000\\000\\000\\011w\\004\\000\\000\\000\\011sr\\000Borg.springframework.security.core.authority.SimpleGrantedAuthority\\000\\000\\000\\000\\000\\000\\0020\\002\\000\\001L\\000\\004rolet\\000\\022Ljava/lang/String;xpt\\000\\016COMPANY_CREATEsq\\000~\\000\\015t\\000\\014COMPANY_READsq\\000~\\000\\015t\\000\\016COMPANY_UPDATEsq\\000~\\000\\015t\\000\\016COMPANY_DELETEsq\\000~\\000\\015t\\000\\021DEPARTMENT_CREATEsq\\000~\\000\\015t\\000\\017DEPARTMENT_READsq\\000~\\000\\015t\\000\\021DEPARTMENT_UPDATEsq\\000~\\000\\015t\\000\\021DEPARTMENT_DELETEsq\\000~\\000\\015t\\000\\023ROLE_COMPANY_READERxq\\000~\\000\\014psr\\000:org.springframework.security.oauth2.provider.OAuth2Request\\000\\000\\000\\000\\000\\000\\000\\001\\002\\000\\007Z\\000\\010approvedL\\000\\013authoritiesq\\000~\\000\\004L\\000\\012extensionst\\000\\017Ljava/util/Map;L\\000\\013redirectUriq\\000~\\000\\016L\\000\\007refresht\\000;Lorg/springframework/security/oauth2/provider/TokenRequest;L\\000\\013resourceIdst\\000\\017Ljava/util/Set;L\\000\\015responseTypesq\\000~\\000$xr\\0008org.springframework.security.oauth2.provider.BaseRequest6(z>\\243qi\\275\\002\\000\\003L\\000\\010clientIdq\\000~\\000\\016L\\000\\021requestParametersq\\000~\\000"L\\000\\005scopeq\\000~\\000$xpt\\000(spring-security-oauth2-read-write-clientsr\\000%java.util.Collections$UnmodifiableMap\\361\\245\\250\\376t\\365\\007B\\002\\000\\001L\\000\\001mq\\000~\\000"xpsr\\000\\021java.util.HashMap\\005\\007\\332\\301\\303\\026`\\321\\003\\000\\002F\\000\\012loadFactorI\\000\\011thresholdxp?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\003t\\000\\012grant_typet\\000\\010passwordt\\000\\011client_idt\\000(spring-security-oauth2-read-write-clientt\\000\\010usernamet\\000\\005adminxsr\\000%java.util.Collections$UnmodifiableSet\\200\\035\\222\\321\\217\\233\\200U\\002\\000\\000xq\\000~\\000\\011sr\\000\\027java.util.LinkedHashSet\\330l\\327Z\\225\\335*\\036\\002\\000\\000xr\\000\\021java.util.HashSet\\272D\\205\\225\\226\\270\\2674\\003\\000\\000xpw\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\002t\\000\\004readt\\000\\005writex\\001sq\\000~\\0005w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001sq\\000~\\000\\015t\\000\\004USERxsq\\000~\\000*?@\\000\\000\\000\\000\\000\\000w\\010\\000\\000\\000\\020\\000\\000\\000\\000xppsq\\000~\\0005w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\001t\\000\\030resource-server-rest-apixsq\\000~\\0005w\\014\\000\\000\\000\\020?@\\000\\000\\000\\000\\000\\000xsr\\000Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\\000\\000\\000\\000\\000\\000\\0020\\002\\000\\002L\\000\\013credentialsq\\000~\\000\\005L\\000\\011principalq\\000~\\000\\005xq\\000~\\000\\003\\001sq\\000~\\000\\007sq\\000~\\000\\013\\000\\000\\000\\011w\\004\\000\\000\\000\\011q\\000~\\000\\017q\\000~\\000\\021q\\000~\\000\\023q\\000~\\000\\025q\\000~\\000\\027q\\000~\\000\\031q\\000~\\000\\033q\\000~\\000\\035q\\000~\\000\\037xq\\000~\\000Csr\\000\\027java.util.LinkedHashMap4\\300N\\\\\\020l\\300\\373\\002\\000\\001Z\\000\\013accessOrderxq\\000~\\000*?@\\000\\000\\000\\000\\000\\006w\\010\\000\\000\\000\\010\\000\\000\\000\\003q\\000~\\000,q\\000~\\000-q\\000~\\000.q\\000~\\000/q\\000~\\0000q\\000~\\0001x\\000psr\\000"com.example.demooauth2.dto.JsonObj,\\362\\267\\350\\237\\221\\265\\214\\002\\000\\001Z\\000\\020nullToInitializexq\\000~\\000D?@\\000\\000\\000\\000\\000\\014w\\010\\000\\000\\000\\020\\000\\000\\000\\001t\\000\\010usernamet\\000\\005adminx\\000\\000');

-- ----------------------------
-- Table structure for office
-- ----------------------------
DROP TABLE IF EXISTS "public"."office";
CREATE TABLE "public"."office" (
  "id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "address_id" int8,
  "department_id" int8
)
;

-- ----------------------------
-- Records of office
-- ----------------------------
INSERT INTO "public"."office" VALUES (1, 'Office of S&M Boston', 4, 1);
INSERT INTO "public"."office" VALUES (2, 'Office of S&M New York', 5, 1);
INSERT INTO "public"."office" VALUES (3, 'Office of R&D Boston', 6, 2);
INSERT INTO "public"."office" VALUES (4, 'Office of A Los Angeles', 7, 3);

-- ----------------------------
-- Table structure for user_
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_";
CREATE TABLE "public"."user_" (
  "id" int8 NOT NULL DEFAULT nextval('user__id_seq'::regclass),
  "account_expired" bool,
  "account_locked" bool,
  "credentials_expired" bool,
  "enabled" bool,
  "password" varchar(255) COLLATE "pg_catalog"."default",
  "user_name" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of user_
-- ----------------------------
INSERT INTO "public"."user_" VALUES (1, 'f', 'f', 'f', 't', '$2a$08$qvrzQZ7jJ7oy2p/msL4M0.l83Cd0jNsX6AJUitbgRXGzge4j035ha', 'admin');
INSERT INTO "public"."user_" VALUES (2, 'f', 'f', 'f', 't', '$2a$08$dwYz8O.qtUXboGosJFsS4u19LHKW7aCQ0LXXuNlRfjjGKwj5NfKSe', 'reader');
INSERT INTO "public"."user_" VALUES (3, 'f', 'f', 'f', 't', '$2a$08$kPjzxewXRGNRiIuL4FtQH.mhMn7ZAFBYKB3ROz.J24IX8vDAcThsG', 'modifier');
INSERT INTO "public"."user_" VALUES (4, 'f', 'f', 'f', 't', '$2a$08$vVXqh6S8TqfHMs1SlNTu/.J25iUCrpGBpyGExA.9yI.IlDRadR6Ea', 'reader2');

-- ----------------------------
-- Table structure for users_authorities
-- ----------------------------
DROP TABLE IF EXISTS "public"."users_authorities";
CREATE TABLE "public"."users_authorities" (
  "user_id" int8 NOT NULL,
  "authority_id" int8 NOT NULL
)
;

-- ----------------------------
-- Records of users_authorities
-- ----------------------------
INSERT INTO "public"."users_authorities" VALUES (1, 1);
INSERT INTO "public"."users_authorities" VALUES (1, 2);
INSERT INTO "public"."users_authorities" VALUES (1, 3);
INSERT INTO "public"."users_authorities" VALUES (1, 4);
INSERT INTO "public"."users_authorities" VALUES (1, 5);
INSERT INTO "public"."users_authorities" VALUES (1, 6);
INSERT INTO "public"."users_authorities" VALUES (1, 7);
INSERT INTO "public"."users_authorities" VALUES (1, 8);
INSERT INTO "public"."users_authorities" VALUES (1, 9);
INSERT INTO "public"."users_authorities" VALUES (2, 2);
INSERT INTO "public"."users_authorities" VALUES (2, 6);
INSERT INTO "public"."users_authorities" VALUES (3, 3);
INSERT INTO "public"."users_authorities" VALUES (3, 7);
INSERT INTO "public"."users_authorities" VALUES (4, 9);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."authority_id_seq"
OWNED BY "public"."authority"."id";
SELECT setval('"public"."authority_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."hibernate_sequence"', 101, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user__id_seq"
OWNED BY "public"."user_"."id";
SELECT setval('"public"."user__id_seq"', 2, false);

-- ----------------------------
-- Primary Key structure for table address
-- ----------------------------
ALTER TABLE "public"."address" ADD CONSTRAINT "address_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table authority
-- ----------------------------
ALTER TABLE "public"."authority" ADD CONSTRAINT "authority_name" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table authority
-- ----------------------------
ALTER TABLE "public"."authority" ADD CONSTRAINT "authority_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table car
-- ----------------------------
ALTER TABLE "public"."car" ADD CONSTRAINT "car_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table company
-- ----------------------------
ALTER TABLE "public"."company" ADD CONSTRAINT "uks7t58ycldrjrftpun092tkhu7" UNIQUE ("name");

-- ----------------------------
-- Primary Key structure for table company
-- ----------------------------
ALTER TABLE "public"."company" ADD CONSTRAINT "company_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table department
-- ----------------------------
ALTER TABLE "public"."department" ADD CONSTRAINT "department_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table employee
-- ----------------------------
ALTER TABLE "public"."employee" ADD CONSTRAINT "employee_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table oauth_access_token
-- ----------------------------
ALTER TABLE "public"."oauth_access_token" ADD CONSTRAINT "oauth_access_token_pkey" PRIMARY KEY ("authentication_id");

-- ----------------------------
-- Primary Key structure for table oauth_client_details
-- ----------------------------
ALTER TABLE "public"."oauth_client_details" ADD CONSTRAINT "oauth_client_details_pkey" PRIMARY KEY ("client_id");

-- ----------------------------
-- Primary Key structure for table oauth_client_token
-- ----------------------------
ALTER TABLE "public"."oauth_client_token" ADD CONSTRAINT "oauth_client_token_pkey" PRIMARY KEY ("authentication_id");

-- ----------------------------
-- Primary Key structure for table office
-- ----------------------------
ALTER TABLE "public"."office" ADD CONSTRAINT "office_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Uniques structure for table user_
-- ----------------------------
ALTER TABLE "public"."user_" ADD CONSTRAINT "user_user_name" UNIQUE ("user_name");

-- ----------------------------
-- Primary Key structure for table user_
-- ----------------------------
ALTER TABLE "public"."user_" ADD CONSTRAINT "user__pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users_authorities
-- ----------------------------
ALTER TABLE "public"."users_authorities" ADD CONSTRAINT "users_authorities_pkey" PRIMARY KEY ("user_id", "authority_id");

-- ----------------------------
-- Foreign Keys structure for table car
-- ----------------------------
ALTER TABLE "public"."car" ADD CONSTRAINT "fkjqp14dkmi2lh5kjavv4t0dkqy" FOREIGN KEY ("company_id") REFERENCES "public"."company" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table department
-- ----------------------------
ALTER TABLE "public"."department" ADD CONSTRAINT "fkh1m88q0f7sc0mk76kju4kcn6f" FOREIGN KEY ("company_id") REFERENCES "public"."company" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table employee
-- ----------------------------
ALTER TABLE "public"."employee" ADD CONSTRAINT "fkbejtwvg9bxus2mffsm3swj3u9" FOREIGN KEY ("department_id") REFERENCES "public"."department" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."employee" ADD CONSTRAINT "fkga73hdtpb67twlr9c1i337tyt" FOREIGN KEY ("address_id") REFERENCES "public"."address" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table office
-- ----------------------------
ALTER TABLE "public"."office" ADD CONSTRAINT "fk4ffkmqmlnyv67ld0dctcvjsfj" FOREIGN KEY ("department_id") REFERENCES "public"."department" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."office" ADD CONSTRAINT "fkak81m3gkj8xq5t48xuflbj0kn" FOREIGN KEY ("address_id") REFERENCES "public"."address" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table users_authorities
-- ----------------------------
ALTER TABLE "public"."users_authorities" ADD CONSTRAINT "users_authorities_authority" FOREIGN KEY ("authority_id") REFERENCES "public"."authority" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."users_authorities" ADD CONSTRAINT "users_authorities_user_" FOREIGN KEY ("user_id") REFERENCES "public"."user_" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
