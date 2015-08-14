-- MySQL dump 10.13  Distrib 5.5.10, for AIX6.1 (powerpc)
--
-- Host: 10.41.192.66    Database: labs115
-- ------------------------------------------------------
-- Server version	5.5.10-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `labs115`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `labs115` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `labs115`;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('20150507108',1,'test_audit.bpmn20.xml','20150507107','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\n  <process id=\"test_audit\" name=\"流程审批测试流程\" isExecutable=\"true\">\n    <startEvent id=\"start\" name=\"启动审批\" activiti:initiator=\"apply\" activiti:formKey=\"/oa/testAudit/form\"/>\n    <endEvent id=\"end\" name=\"结束审批\"/>\n    <userTask id=\"modify\" name=\"员工薪酬档级修改\" activiti:assignee=\"${apply}\"/>\n    <userTask id=\"audit\" name=\"薪酬主管初审\" activiti:assignee=\"system\"/>\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\n    <userTask id=\"audit2\" name=\"集团人力资源部部长审核\" activiti:assignee=\"system\"/>\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\n    <userTask id=\"audit3\" name=\"集团人力资源部分管领导审核\" activiti:assignee=\"system\"/>\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\n    <userTask id=\"audit4\" name=\"集团总经理审批\" activiti:assignee=\"system\"/>\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\n    <userTask id=\"apply_end\" name=\"薪酬档级兑现\" activiti:assignee=\"system\"/>\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"/>\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"是\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"是\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"否\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"是\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"重新申请\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"是\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"否\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"否\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"否\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"/>\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"销毁\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\n    </sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_audit\">\n    <bpmndi:BPMNPlane bpmnElement=\"test_audit\" id=\"BPMNPlane_test_audit\">\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"245.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"231.5\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"/>\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"/>\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"/>\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"/>\n        <omgdi:waypoint x=\"153.0\" y=\"231.5\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"/>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\n        <omgdi:waypoint x=\"201.0\" y=\"260.0\"/>\n        <omgdi:waypoint x=\"240.0\" y=\"260.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"/>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\n        <omgdi:waypoint x=\"60.0\" y=\"260.0\"/>\n        <omgdi:waypoint x=\"105.0\" y=\"260.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"/>\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"/>\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"/>\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"/>\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"/>\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"/>\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('20150507109',1,'test_audit.png','20150507107','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\�\0\0|\0\0\0=ӳ\�\0\0S\�IDATx\�\�\�|T����S����h�˲�l\�e�ծZ1��4�X�\�K]��RVV�\"\�Z/�\"\Z1�c\nĀ����D.I\�c�1f��E\�\�c\��>\�9\�03�I2I�\�L^\�\�\��\�\\\�\\2\��>s>sΜ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�/\0\0\0\0\0�+�,e�\0\0\0\0\0� ެ/\�J���\�%\0\0\0\0�s�m�ɖ-ܟ\�t\0\0\0\0\�y\�vk�\0\0\0\0�V$�\�T\�\��n\0\0\0\0\0�l�[k�\�\�\r\0\0\0\0@\��m�vz\0\0\0\0\0�m�=����\�\0\0\0\0��\�κ=\0\0\0\0\0Q�����~\0\0\0\0\0��f��vgK7\0\0\0\0�\��=\�\��̺\��\�\�q 5\0\0\0\0@�o�\�x4\�\�\�R\�߶6݁nG\�\r\0\0\0\0\��Ͷ�\�j�UM�g�m\�D�\��N7\0\0\0\0�\�\��k�[j��M�\�gz�\�\r\0\0\0\0\�6\�vBM�����Ͷo\�\�\�\�\0\0\0\0��\�֦���;\�f\���?3\�\�\r\0\0\0\0�\�f��\�n���G;�m\�\�\0\0\0\0t\�f�����\�vG�\0\0\0\0\0a��[��5\�i�}�n�\�\r\0\0\0\0],ά\�\�\�6k�լ)�M�\��\�^v#�ݲ]e]\�I\���(��(*ʪάj�r\�z\�poh\�E;�p\�\�\Z���Ud\��ƙu�Y}xyڤ������-\�m��\�@\�\�\r\0\0�h$}\� ý���2[\�:h�76�\�\�A��l5ڋͺ���C���3N\�w�\�\�t�n\0\0\0t\'\�J�ցg�r�+\�\�o��o��d��\�`�(�\�/G)�\�\�(\�\0\0\0\�d\�w�\���\�\�\�\n\�lg|\�\�D6ݭ5���\�vk�\�\��\�\�\0\0@�\�\�\�w�\�yj�y>\�jmskͶ\�Φ\�ޭ}�\0\0\0\04\�zK�#�9@�|g�\�\�O�@[�\�\�l\�tۏG�\r\0\0\0�\�\�\��\'RCH\���yB&�h�{��F�\�\�\��8|g\0\0\0hN��$^��l\�\�h\�o�=�\�\�<��\�6Z�?�\0\0\0&G/��\�+�8�\��\�l#�|w/�fy��O}�ޮ���\r\0\0\0t[YgƉ��Ysx¦\�\�(��\0\0\0hN��gxp\"\�!�9�Vt4ݝݼ\0\0\0\�L֛syp\"\�48:y8\�\�n\�\�F\0\0\0G�V^\�ˀI��>�a\�t����\0\0\0��>���\'�\�%+�\�\�n\�\0\0\0\0�`\�\�&z�\��D�\�\�\0\0\0�C`����f:��\�?�\�\0\0\0\��\0C�m\�f7r\0\0\0�~0tr\�M�\r\0\0\0\���Nn��h�\0\0\0�!0�й�Y��\0\0\0\��\0C\'ʲ\�U/^\n\0\0\0�~0t�8�\\[�\0\0\0�!0�Щ2��$���\0\0\0�7\�8�u\�.�\0\0\0\���\��i�\�\�|�\0\0\0�\�\�o\�]\�xy\0\0\0\0�!0�\�>\��m�\"^\0\0\0�~0���\�|�\0\0\0�\�\�J�\�\�\0\0\0�!0���\0\0\0X\�\�+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c�\�\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0\�\�`��y\0\0\0��\r0��W\0\0\0\0X\�\�+\0\0\0�ul0���\0\0\0X\�`\�+\0\0\0\0�c�\�\0\0\0�:6``^\0\0\0�c0\�\0\0\0\0ֱ�\0�\n\0\0\0`00�\0\0\0\0ֱ�\n\0\0\0\0\�\�`��y\0\0\0��\r�W\0\0\0\0\�\�\0�y\0\0\0��\r0��W�\0\0\0\0\�\�`��y\0\0\0��\r�W\0\0\0\0\�\�\0�y\0\0\0�ul0���\0\0\0X\�\�+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c�\�\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0\�\�`��y\0\0\0��\r0��W\0\0\0\0X\�,���R�SRRfN�8qolllC\�޽��:P�P={��\���\��l��\�Ϳ#�\0\0\0\��\0\��-[v\�ȑ#\�cbbԜ9�U~~�jh�\�\����:�\��,**T��ϩ�6�\�\���\�_L\�\0\0\0@?X�JM}e}�~�TR\�\�\�j4�\�&*���H�\�\�\�SO=�&\�\0\0\0�!0���پ\��TQ\�v�	��\nq�����}��Üc�\0\0\0\��\0�˖-�G�lm3�?�W-]��\Z3&A�\Zu����k\�\r�#U�f\�Q���\�SN�\�`�r\0\0\0\����R�G���>)\�y�\�7^�b�R5�\�ԭ��\�5v̍*>�Z5t\�j�n���:�\�ޫW�<b\0\0\0�!0�\"\\J\�11?R.W�\��5zU¨x\�h\�p\�H�~��\�\��aW�Mwl�\�Ω�\�>�Ss\�\�=\0\0\0\���&N��wΜ\'\�F\�\�f5bx�za�|��V�Jy1Ioپj\�P}��v���{;�c5mڽ;\�Y�H�\0\0\0@?X��Ґ��c6z\r\�\�\�\'���Tm\��\��\��\�\�T�>s����C�?S\'�o��\�\��ջ\�\�0g\�N�\0\0\0�!0�\"X\�޽UC\�\�f�W߬���*.ڢvoU�w�\�\�;vlW�=��\�\�P/�\�q=\0\0\0\��\���R_6+�\�\�j֬�j\�o&���BU�\�]�v\�P\�\��o5\���\�\�_\���Tǋ\0\0\0\��\0����Ϋ\Z?W\�ֽ�bc��?�TN�ϫJK�Ր\�/U��NU\r\r�5�=\��b�\0\0\0�!0���\���S\�}wL��!]\r\Z�j��\�{e�U\�\�*�\�?��\�W�\�W^2��4�{��W^�\�\�W�o��\�\�>��6\0\0\0\��\r�1��n٤k[�켼\�\�͌t\�h�X�D��x�Jz\�Y�̼��\���P]{\���\�5^�Au�X�\0\0�~��h��\�\�c�~��D.���\�ź�����-P\�\'\�S�;�I�\�\�Q3g�V=�ģf���~7�~���:^,\�\0\0\0@?XT4\�_8%\r��\�\�ݬ\�H{U7\�\�|?;��;\�	�ܳsu\�-M��\�	js\�\�V\��Չł\r\0\0\0�C`�EE\�}ԩ�{��G��~y�8\�Pˮ\��*.n�����zkwi\�^�Au�X�\0\0�~��h�?�*\�7S_~��J|\�i�0\�:5b��j\�\�+TܕC\�P�Ѿ\�\�\�\��\�Qǎ�EO\�{{�\�ł\r\0\0\0�C`�EE\�}�\n�b�\0\0\0�!0���\���\n�b�\0\0\0�!0���\�>L�Y�`\0\0\0�`Q\�p��\n�b�\0\0\0�!0���\�>D�Y�`\0\0\0�`Q\�p�¬X�\0\0�~��h�PaVmwO�\�@<\0\0@?XX7\��¬Zw\�hm]\�\�\0\0\0�C`��w\�]\�亅g�\�\�\�u\�\�W�/+)\��6��\�_ff�s:\'\�u}��z[�۔����\�\��z�\�K\�Ϛ5�\�c͟?K�>th�\�uUU[��G��7{�\�\�\�f�UV\�\�kj\n��\r��3\�8�\����\�Zi�i�\0\0@?X�7ܟ��\�\r��eYY+�.��\�5y�̆�H����\�;��r��sr�\�ٳ�JN�\�\\\�n\�ݧ\�\��l6\�o�3\�<CO[]�U?�\�`n\���\Z?�j[�i���v��+\�z>ϕ+_pN\�߿C���\�Wk�iyL\�\�gϞ��}_�\�r~ʔ�tþ/\�\���^\�/��\'z�ѣ�\�\�Ͼ\�\�G�\�\��\�\�s�E͘1\�l�\�շ��\��\�[�g�\�\�u\\(\0\0\0�~��m���-��LL|L�\�oٲ.\�m�.��\�*6�\���\�_�\�Ç�\���\�yy\�����*}^[ΟrJo\�|�o6\�w�\�\�J}��cX[��ԡC��˗,���KF\��`�\��euu��oA�\Z\�yH.�55\�\���\�[�\���Y�Xmذ\�\�y\�\�eg�R��Unn�~\�r^�����\��?\�\�w\�9?PÆ]����|�\�/�zm�[�i�\0\0@?X\�4\�iVee�Ԟ=٪��c���ݡD��\�x\�\�����?�k��S99����9\�\�N5�\�\nu�\�\'�;\�\�lb\�6�\�O�\�\�\�R����@����<O-\\���\\�w7\�x\�F��\�.W�*/߬/KM}N?VEş�u�\�җ��-R�_��y����\�\� �\��^�*\�\���T\�|�(\�q\�瓛�z��]�\�\��2��\��c\�}yN׆F��(��(wՙ�Ǭl��1+ެ^�\��C`��Iý�Y-Y2O]tѿ�-[֨ի����n��=�A}^nSX��\�\�I�\�K^/e\�-\�\�-\��\�=��\�c\�^����\�&%=��g���P\�\�O\�˦N�`}W�^���=}cc��&\\]]������Wx�\\�m\�:=}v����f�\�\�z+��m��=[o��ˏ-Sk֤\����U|�}\�O~2H�}��oy.�\�\\nߗL\'\�\�\�P�\\2\�l�W{=�\\\���X�\���5\�sw��5Ƭ\�\�\�5\�YIf�c\��#i��#��#�~��j�?iVr�]w�R�NK[��B{^���\�\�\�.�0\�j��_W_���]\�\��~d���.+\�v\����\�Ի\\\�\�_\�<�4�\�ٖ�U�\�U�^����\��+ӧ�η�Lo�\Z\�~�?�8zt��}\�\��|mm��\�\�iW�Nҧ\�\�\\&\���7^�O.[��I\�h74|��O\�\�\�\�X윗\r��j��\���f\�\�g>�\Z��7��AVt\�a��;G\�f}a\�L^��#�~��n���Y�\�۝\�ӧ\�\�u]f\�\�~o\'u�\��}q���v#+�rWW��v�\\\�\�\�_\�/^,����(V\�\�̦�bUS\�nV*��ý\�ld?V))���\�\�\�oذT7��&ݦ\�n�\����J�y�\�\nש�.�P7\�\�&<\�j\�6{}Ǝ�^\�zk�\�,o\���#�Tv�\n\�h\�zM\�n��_�\�\�G�YY�~_�\0�\�w�w��-\r��a�Y��ڝ�rý�,9x?\��\0�̆��Y�\'��P��\�[JK7�\�5fC[m6�\��\�Ʈ\�\r��\�kk\��\�\�Z?\���\�l\��\��j\�\��\�v7\�ǟKr򓺡ݷo�n�\�\�\���\�y\�.\�if�\�l\�?���>\�\�8v�\�y^r��>`Z�\�Hg[\�\�\�\�\��Oy\\�~�w�B\�V�_�`�3�\\�\�nu\�e��fϞ�/�\�\�\�\��^\���[�o�\�p&ߟ˲Vr\0�O+G\�\�Ix?\��\0�Ć�c�u\�H���]�\������\r\r��ÇK\�M7\�\�2e�\�<���ڞ{n}Z*--\�:\�z}CWz�\�,��ZC%�#\��\�\�\�\���Æ�\�l�SUFF�JM}F?�}�܇�w�^\�u���?�\�µ�	��4\�V]r?\�&8\�l�\�M\�\��\�}����\�\��[�x���{�\�kc\��=c6����\�{\�u\�P��7o����{\���Vjժ\��QCS^�1}\�?�Vrd\���k�eK�#�\0\�G\0�`\�pW{UN\�\nݼ�\��\�t\�lv�\�fڴ�\������M�\Z?\�\�\��\��>�\�j8_�w�|�|II�>\�r}h\�;K�oj�r�)(x\�\�6<����<\��\�\�u���}��|w��&O\�\�\��\�;\�\�c�?0\��������m\�\�\�\�\�ת[o\���\�ۗWTd����B7���z�����1&��}jp\�\Z��9����C`�E\\\��QDUSӇ�2M��K{��\�q\'�IbqtH29x?\��\0�����\n��\�q\'G��#\��T�\���S\��!f�\�N�;��\"萭\�\���,�\Z\�J*\�*J\�\�\�{W>\0\�7���C`�ET\��f�\�n�\��i#\0\�Q./��@?X\�4\�T�U��;9:\�)@�sT\�\�\0�~\��1\r��T�U��;�-\�:)\09\�@?t����\n��\�q\� G\09\�Н\Z\���0+\Zn\0\� G\0y,*\Z\�2*̊�\09\�@^�\0���{/fE\�\r�\� /`�EEý�\n��\�@�\0r�0���\�\�M�Y\�p G\09\�`\�\�O����\�l�vQaR_}U�Ϝ5.��\� /`�E���|(?�\�\�RaR\�\�?��9kv�\'\0\� G\0y,�]u\�e\�\�̙J�F5v\�Ui\�I$O\0\�@�\0�X0\����˵�f7<\�=zT��&�< G\09\�`���&%=H�5f\�UK\�Y�K�\0�#�\��\�0\�\�3O�/*ZA\�ۅ���t�9/�u1y@�\0r�0��G�9\��w�\�k�{�\�Qc·1\�	\09\�@^�\0�¦����l޼�>\�;ݡ�ζ���n\�l��\�@�\0�t\�6�g\�\�\�~����L�e��M/lh(�1\�\��\�\��䧿\�h\�\�\�\�;\��\'\0\� G\0y�{�Ԭ9fm5��z�\�)�\���m�\�8��\� /`�!�eY�/y\�\0r�0�\�9d+�˚W	�\�	 G\0\�@^�\0C\�\�4�﮽���<\�\09\�`\�!\��\�v�\�e!O\09@�\0�:&\�h~P2\�\�\�w�\�@�\0�#����v�uۮq�<\�	 G\0\�@^�\0C�d�z����<\�\09\�`^K[��.7y\�\0r�0�\�NY�4\���<\�\09\�``^1�\0�#�\�00��<\�@�\0�0��W`\�\09\�``^1�\0�#�\�00��<\�@�\0�0��W`\�\09\�``^1�\0�#�\�00��<\�@�\0�0��W`\� G\0\�``^1�\0�#�\�00��<\�@�\0�0��W`\� G\0\�``^1�\0�#�\�00��<\�@�\0�0��W`\� G\0\�``^1�\0r�\�00��<\�@�\0�0��W`\� G\0\�N�,k@�T;y�X�y�#�\�\��\\�4\�cx�X�y�#�\�^v\�v�Y�x�X�y�#�\�ސ\Z\�q�<,�<\�@�\0����\�r\�w�ٺ\�\�\0\�#�\� /@��.7\�\�fa\0\�@�\0r��d\Zl\�fa\0\�@�\0r��\�\�y4\�	�,�<\�@�\0�t��\�l\�fa\0\�@�\0r��\ra��0\0� G\09\�\"g�)\�;%%e\�ĉ�\�\�\�6�\�\�;\�\�pQ-TϞ=�;���?>|�F�\�HF\�@�\0�#��tc˖-�g\�ȑ�111jΜ\�*??O54|e�\�\�QA��nEE�*1�95p\��\����\�5_\�Y�y�#\0\� /\�Lj\�+\���맒�^P.W�\�46Q�X\�ɋT�>}�:�\�Soba\0\�@�\0�#��t�f��.PEE\�\�\��[\�Uyy�\�۷\�?�\���\�,�G\09@�\0�ҽ,[��ٲ]T�\�l\n]^�t\�Kj̘5j\��\��\�Q7ďTɋ��MG��\�\���SN9\���\�^\�y�#\0\� /\�h\�(\�{\�\�kꓒ�7O~\�U+�/U�>J\�z\�X]c\�ܨ\�\�UC�^�\������8��^�z\�0\0� G\0\�@^�TJ\�11?R.W�\�6zU¨x\�h\�p\�H�~��\�\��aW�Mwl�\�\�\�\�\��Ԝq,�<\�\0r��(4qℽs\�<i6�_7�\�\�\�櫬�2TʋIz\��U#�\�\�\�\���\�\�Qm�i\�\�\�i΂D`\�\09\�K��Ґ��c6�\r\�\�\�\'���Tm\��\��\��\�\�T�>s����C�?S\'�o��\�\��ջ\�\�0g�N`\�\09\�K\�ݻ�jh�\�l\0\�\�c�R\�E[Ԏ\�j��]rzǎ\�\�\��{�\�%��9\\\�d�%X�R\� G\0\�@^�\�R\�\�f\�r�]͚5SM�\�$URR�\�\�ۣk׮j\�}��f<x���\�\��ޖj{u��ě%GeO���!v,�r�䥛4\�u^\�\���Z�\�5�SU�Q�zp�}^UZZ��\\~�z}u�jh��\��W7H�O�-[�?�\�f�\r�#\0\� /ݤ\���S\�}wL��!]\r\Z�j��\�{e�U\�\�*�\�?��\�W�\�W^2��4�{��W^�\�\�W�o��\�\�>��W�ķ\�n\�r��\�\0r��hk��9�u\�&�[\�\�d\�\�mVof�\�F{\��%\�\�ŋT\�Ϫg\�=������\�\�kF��o���\�\�Ih����\�;\�,�r�Q��f\�g\�Z��ͪ��p�Y���i\�Lk�(n��\�\�c�~��D.���\�ź�����-P\�\'\�S�;�I�\�\�Q3g�V=�ģf���~7�~���\�^Q��\�\�f�-\�,�r�Q��qf\�ZM�+f\�f\� �N����1V#�dM�oք\�l��pJ\Zn�	�\�o�Y����n���~v�5w\�\�g\�\�[��1�\�朷�����o(�Fp[����\�\0\� G\0\�4/\�Dg�Un5ӽ���4�\�[ͺ �\Z\�N\�ݻM=�\��\�\�\�\�Zv%�WqqCԯ\'�\�[�KK\����\�eo(\�\�b-���\�f�\r�#\0\��ܼ�7\�\�\�E�W\�\�>\�~�ek�\��}\�U�o�����S��\�\�*a\�uj\��+\�СW��+���f�}\�\�\�\��ߣ����\���T\�+�\�P:�{8����\�\0rDh^d%^��\�I�w�u���\�>BuQE\�JkH����\� /!2\�j�c:�~c����-\�f\��\�Eo(�}�q�t���#\0\����HS,�ǝ���Ժ�A�\�p���\"�\r\���g\�3\�N\�o0|oǁ\�X�\�@�\0D@^\�H\�3O�c\�w��Fv\��7��*�\�P|�DK��\���\�t�M7+8\09\��0΋�����wk������\�!��*B\�P�\��}���� �n\�fۮ�\��nVp\0r�#\0a��\���K�[�\�\�\� \�E�o(��`\�sKM��\�S�L\�w�Y�\�@�\0�Y^\���\n\�cV�`��~\�0�m\r�����\�ֱ�\�N���\�t��\��m�ٽ��\�@\�E�W�8ď�h��\��\�+���k�\��k�J\�#3s�s:\'\'M���\��6\�\�\�={6����^�\�yޮ}�v��O>�M\�c����]�f\��\�gg�Vg�yF��甔y��څ�\�hO\�\�Z\�l�\����l\�f G\09\�\�yYk\�m!~Li�°\�+\��U\�l�j���={�\�\�9f3\\�\�?1�q\�4\�\�8��\�Z��ަ��V:\�e\�\�U�1�0\�}Z.��-\�eZ�\'םrJ\�\�\�С=z��Y\�g����\�\�^4�\��U]��\�\�;V\�\�~+*�TMM��\�\�[�&O��3}qq����p��lҤ_\��8qq?է�6lX�\�;\�ܠ_\�.n�[�\�v[�\�@Mw�v6\�6�\�\�\n@�\0r �\"�w_\�ǌ1\�\�0n�=�j��n�?mw\�\�g̘�ޫ\�8�K�\�\�������#}^\Zr�i\�\�Z�Ǝ�AM��f���\�z�\�z���?\�\�WJ��\�_�\�ǲo3q\�mzZ�\�\��\�ii�׫k��\�\�{\�y�\�x\�\��ȑ�԰aC��\�\�\�~ކ\�Z�\�\�\�X\�^�f�s�\�]nk����{�\��m�^�0\�i�[j��:\�lw����\� /��ά\�C���x\r\�p{nՌs7\������5��\�\�Ym6�s\�i��j6\�\�F�;Ʃ\�ҍ��i�3���2m]]�JOOQ��.|Z_.\�\�_�\�\�\�]x\�Ul\���<\�\�\�שI�n7\�j�\�yz�4\��er�ii\�\�m\��\�e�����,\�l\��O�\�\�^\�<gy�r���Z��\�\�z�.�n\�\��隚m�\�o\�\�f\r�\�\�\�\�eMwG�mߦ�\�t���#�\��TEb)��v�ܶ�*_��7\�!��\�k\��C_/\�=�MJzB\�]W��JN��/�:�\��\�Y�\�\�\�=\���u�\�\�\�_���\�4\�YY\��������?{\�\�\'\�\�[\�o�}�ڲe���~W\��С]\�s\�\�X\��?��-R��[[\�\�\�ٯ\�\�h\�k\�\��L\�n\�[���\�;\"ɺ�>,cY�\�@�\0�Zl\�\�@\�4\�[,\�#���߾����R]~�Ŏv��\�;\�I�.+\�\�4�g�u�:\�\�&Xn#�_r\�`UP�G�\�~Z\�\�\�[�W�zA_�o\�v\��8۶�S�\'�W����\�\�R�8˗\'\�i]���=7��\��\��2�\�\�**r�\�\�\�\�2���D\�Ǐ�&#\�e��#F\\\��\��\�\�lݾ�\�QA���}��\�h\�\�iiw[~�;�p���#�\�¼�\�֛)\�x\��I\�U\\�i6�K�}�^���@UW8����]\�L/\�/�\�\�+ԁ;Tzz�n\�kj\�\�;�\�popn\�\���s�\�ctC\�\����\�&M�\�l�����e\�3N�f߾m���}T�U*//\�j��9�m\�\�\�Wzݷ�?�\�o\��ii\�\���u��;\�ذ�\�:\�\�|��=M7\�\�f G\09\�\�y\�(\�Ǜ�\"�\���\�l��/読-T˗?�c���\�f;_�{\�\��zws��3��ON~J9�\�lj��\r�\"}Ycc�utr��\�o�}�\�\rw\�\�K\�\�\�\�яa��q^\�lZ��kj\n\�\�å\��몪\�q��\���\�\�6�\��Ч��=K͘1�]�c7ܭ�\r\�&��[�������\�ts�rVp\0r�#\0a�~��孖>\rwM\�e\�\�jZMj�JIq����ڹ\�\�p�~\�0��e*#\�%����\�\�ܾN\�C�fe�\���7\�\��.\�G֮໛=/\�ǵ/�w���\�[[��X\�ߦ��\\.��\��m\�����=��\����\��\�t�\�\��;ۭ�Nw C~���\�@X\�e�Y�\�Pt�\�\��3H����\�\�J\�\�Pa6�Ku\�t�p�����ڙ\�\�\�.�:_R�>\�r��,����\�75}\�LSP�f6�\�\�\��\�\�}P%&>b6\�睊S�SM�6Q��*,\\�N;\�u\�\�^�\�f8��ߪk\�\�T���\��QW��u\��\�\�\�~.�a�\��\�[�\�j�<\�\�\�\��D\�XimskͶ\�Φ\�ޭ}\�SVp\0r�#\0ᑗ\\#t[ä!\�\Z�3H�\�WSSUD\�\�z�|C	����\�v�M��x4۬\�\0\� G\0\�(/��^n�f+�\�;!r.�}C�-ݾ�w\�i�;\���\�>�\�w�Y�\�@�\0�i^���j���V#���wr\�]EuQE��\�O�y6\�mi��Vn\�O���#��ĘuЬ�t��Z�?(�g�RR]T��\�{�4\��\�\�\��v��o���#�\�%D\�\��Ŝ�f^\�wB�\� �*�.�(xC\�\�\�\����:X�\�@�\0�q^&Y\�qgm\�Ժ�G�a)�\�E%o(�\�twv�Vp\0r�#����l\�-g�\�|\�Z��}\�j\�b)UAuQE\�JGwg7r\�\09@��\�K�\�����v�\�\�ַ\"\�}��A\�4��z�ꢊ�7��U����\�\0rDQ^n�\Zo\�-|�\��	�\�:ݺ�t�9� Ѭj�ўdD\�\�\�[h�˩.�(|C	v�pv#g�\r�#\0\��Ҽ0\��\�Z\�w���\�\�fe\�]\�c�y)�\�E�o(mm���Ug}\�\�\09@�\0��\rw\�E\�I��\����f�6@�\0�#��Dyý�ꢊ�\�\�\�n\�,�r�䥻4\�{�.�n\�\�f�6@�\0�#��t\'�|\�w\r\r\�f�\nq}�U\�>s���0��\�$�m\�\09@�\0�\�m�\�C��K\�p\�Z����\�Y����ka�O��\�\0r��\�᪫.[7g\�T�,�B\\c\�^�f�v���G\09@�\0�m�A\�\�|\�r\�	m}ңG�\nsı0\0� G\0\�@^�T��?,MJz�&8�5f\�UK͗>���G\09@�\0�\��y\�i�EE+h�CP��Kכ��A�.fa\0\�@�\0�#��D��s\�9�\�4\�\'�\�\�ѣG�\�=�\�\�y�#\0\� /ݷ\�>\�\��7\�\��Nw\�g\�ڍ��\�}��� G\0\�@^��A={~/\��\�O=<e\�-�7mz�`CC!\rs;ꫯ�\�[����\�h\�\�\�\�;\��0\0� G\0\�@^��K͚c\�V�\Z�IW.\��;\��\�_q)\�#� G\0y�y�\� /\0X�y�#�\�\00�\0r�\�\0\�\0r�#��\0`a\0\�@�\0r�\0,�<\�\0r�\0,�G\0\�@�\0����G\09\�@^\0�0\0� G\0\�@^\0�0` G\09\�\0`\� G\0y�\�\0\�#� G\0y�y�\� /\0X�y�#�\�\00�\0r�#\0\�\0\�\0r�#��\0`a\0\�@�\0r�\0,�<\�@�\0�\0,�G\0\�@�\0����G\09\�@^\0�0\0� G\09@^\0�0`\�\09\�\0`\� G\0y�\�\0\�#�\�\0y�y�#\0\� /\0X0�x	\0r�#��\0`a\0\�@�\0r�\0`a�<\�\0r�\0,�G\0\�@�\0����G\09\�@^\0�0\0� G\0\�@^\0�[���j\'/l� G\0y�!f�Zi�\��2��\�\0r�\0�\�n�\�.2�/l� G\0y�!-4\�\�xyX`\�\09\�����]n�\�6[�Y`\�\09\����]n��\� G\0\�@^\0t�L��\�,�r�\�@���h�x9X`\�\09\��\�c���\�,�r�\�@\'\Z\�6@�\0�#��\0\�*�z���̜8q\�\�\�\�؆޽{��-*�\�ٳ\�w\��gÇ\�h�\��Q\��#rD�\�9\"/@7�lٲ{F�Y�\�̙����TC\�W\��;��%�cQQ�JL|N\r8����{͗�bVp\�E�\�9\"G\��#�D�\�\�W\��\�\�O%%��\\�Fsa\�D��JN^���\��թ��z+8\�\"G\��#rD�\�y�x�|����\�\�B\�[*DU^^���\���{�~�\"G9\"G\��#rD�\�Э,[�����h���py\�ҥ/�1cԨQ׫믿F\�?R%/Jj6\��*/߫N9\�/�\�ߝO�#rD�\�9\"G\��#�tr ��#��OJz\�<��W�X�T���(u\�-cu�s����V\rz�Z�\�\�P�T���?\�իW+8\�\"G\��#rD�\�y�DJ\�11?R.W���h���Q�z�|\�\r#��\�ϮSÇ]i.�c�MOu�\�>�\�O\�Y\�\n9�\�9\"G\��#rD^�(0qℽs\�<i.�nV#�ǩ\�WYoe����\'�W��/�\�.ח~oG���M�w�9KY�!G9\"G\��#rD�\�bc�4\�\�\���fu�\�\���~��nyGe�i�Z�j�Z��F}\\������շ\�~\��vT�\�\�ws��d\'+8\�\"G\��#rD�\�y�@\�޽UC\�\�悡�Y=6\�!U\\�E\�(ުv\�*\�%�w\�خ{\�!���\�_2\�Y\�b�Q\��#rD�\�9\"/@��\�(�e�r���f͚���f�*))T\�\�\�ѵk\�5\��V3�O}��\�~oK���|��\�9\"G\��#rD�\�y�Y\�]\�U����u\�^S��?U\�U��\�\�U��\�j\�嗪\�W����Ϛݞj��C�(rD�\�9\"G\�� �\��p\��6��aCcUMu�z�l�\�ݼQe��G���J��\�K\�B;M\�t啗���\�\�o����\�\n9�\�9\"G\��#rD^��Z0sj\�M�7ea���Y����\�+�/Q//^��^xV=3\�i}��\�/-T\�^3Bm|{�\�}P\�/Vp\�E�\�9\"G\��#�DՂ�\�N=6\�w����\0^��Xג��U�\��\�y\�\�>����#j\�ߪ\'�x\�\\(g�\�ͼ\�\�>��+8\�\"G\��#rD�\�y�j���S�`�������\�i�\��,���?G͝�z\�ٹz\�,\�1�\�朷��T\'+8\�\"G\��#rD�\�y�j�|ԩ�{��G��~y�8�\��]��U\\\��\�	\������\�z\�\��b�Q\��#rD�\�9\�\"Y\�sn�v\Z\0�]0\�U�o�����S��\�\�*a\�uj\��+\�СW��+���\������\�G;�=�\�\��+8\�\"G\��#rD�\�Qb�;���{\���&\�\n9�\�9�\�9\"G\�e�\�l�Ջ�	z��&\�\n9�\�9�\�9\"G\�\ri�\�G\��k�|�\n��╀\�K G9\"G\��#rD��\�r\�w�ٺ\r�o��7*L*JWp\�\��¬$\�\�rD�#rD�\�9\"G\�(l��.7\�\�ڿ`>D�IE\�\nN�\�J�lQ�,\nڌ_rD�\�9\"G䈊�e\Zl\�:k�|�\n�����\0[\�p\�\��#rD�\�9��)Gq\rw�~Ղ�\0&E+8	��\�\�\�\'�#��#rD�\�9\"Ga\��.7[���-��J�IE\�\nN[W^�i\�\��#rD�\�9�\"=G̺Ϭ�fU�Uo�\rf}b�w3�iM�\�\�Z*L*\nVp\�\�R\��\�\"G\�\"G\���\�%?��k5֪��o\�Z)�M\�O�0�_�i\��]]��\�0~\�9\"G\��#*\�rcVvM��\�j\��T@�\��T�T�\�ttw�Hߝ��K�\�9\"G\�Q�����H��ͳ\�j�\'�u�Y}�i��5Ⱥ�\�n\�%\\>�bk7x��*L*BWpZ; M�\��#rD�(rD�(r\�\��w�\�t�\�\�\�\���\�}�{2�\�w���\n����\�>�k�nY`��#rD�\�9\"GT$\�h�O�\\i��f��ܮܧ\�fK7\�|��I�K�߶m�����>}\���\�\�奩#��ɓ�CM�t�Wmܸ\\ee-S-=�\\7mڝm~^�W\'��\�;7\��55\�\�����@׆\r���\�s�߷o�\��%%TYY�>-?jVr\�͞��\�\�9\�\�\�*�~}#h\��`\�{f\�i�\r�\�\�\"��5\���\�:�E�\��9�1�w#�\�_�\�\�}\�\�湆�\�\�h�\0�����JK\�\�A��\�Qze_N\�{\��\�3\�<C-\\��3���\�<o߿�?�k��ӧ�TK�-\�\�t\�\rm~n���P]}ul�\�Hc \�TW\�\����n6,�\��\�^��~o\�\'ޢ�l���F\�?�\��\�;~�rs_\�Ӗ��\�\�/X�^.\�\�X�.�\�B}�}��\�\�/�\�\�s��\�O�e\�d������\�v���C�\�9\na��_\�QQ�#\�Ƹ��mϦ�ܧ�p|�\\\�j;V�t�\�;�\��\�̗�\�={���w7\n?�,=}��R�\�\\i\�b6\n��[��\�\"\��MM\��>\�:\�\�\�\�\�#��G�\�V��\�\�KJ2u3Q\\��.�\�\��\�{�\�W\�\��\�׿\�L\�r}��\�e2�<�Çw�\�\�g\�i�����5k�UL\�\0\�6r���\�\�m�\�ߦ�\���\�\��:���#p\�ư�x\�NԖ�ϕ�&z\\Iߡ#G\��(GTh��#*\�r4\���\��ŝ|�޻��k9p|��q�UW��\Z0��\�\�Z�N9��z��{Un\�:L�&ݪO�{n�\��\�{�\�\�^�F��JM�2\�\\YN\�ӟv\�)fðPUW��=vS�{7Si6ZzN��\�ر\�9\�e��i�y�fz\�i\�zk\�}�>���R���#GJ�i+*6\�\�jk����\�\��\�\�h��F\���\��w\�u���\�ѧ+�\�}�ܻ\�\�sh���@+�VVZZ\��7}��\�#\�;t\���\�\n]�#rDE]�<�n\'��\�x\�`+7\�o�\\\�b\�Օ\�7�����\�\�o�Sa\�\ZU^�Q�w\���\��-s\��yy�Y��\�\���@��g\�[֖�ș��\�\�\'%ӧ���9�a\�\�*&\�_��)j\�����\�\�K�ٳp�+.^�o/[\�<\�\�w��l64���V�Y��\��=--ɹy}bc�]M�6\�l2�\�\�4���\�Yg�i6;�m\�ױ��#D\�X�Ib�\�\�JN[Wn|Wr�bw���V\���\�\n]�#rDEU�Ƿ>���\'��\��\'\�bh�\0�`��M����:�\�tðj\�szW҇��\�����_{Zw�p�>�o_�\�$\�\�46V�@�-��}���V�nj��\�\�e\�e\�&\�2ْ8b\�\�^\�ee-ѻ\�N��_jҤ[t\��\�fd�\��y:T\�ܷ���@n#M���I�\\�\���\�\��\�\�7��\��ȑ\�\�X\�[�_B�`�G\�qm�M[W2Z[\�	v\�\���?\�-m}�\�9\"G!\�u\��#*�rt�\�tY\'����x���Z�^0W�XlS��+Ե\�ƪo�Z��;��y�TS����LΗ��ӷ��\�\�lke�Roɒ��\�\�W�[��\�\�\�\��rz��GZ|~2\���3�]v�\�	^�mܸT\�Ծ�ꫯpNoذؙn��=�\\\�\���[U����V9\�;1�!��\�\�ܦ�~��\�~}\�\�\�\�\�\�T\�q23SZ�_B�`�+��OF�ݍ.\�JN�v�\��n\�\�JN[_+rD�\�Qr\�9��m{\�Ɇ\�\�\�t2\�\�C�ɓow> :�A\�R����\�\�\�nѷ�|<ɩ�\�(/[_\�r}�\�\��8U]�Yh\�\��!�\�y^2PS�\��\'[}m~�7\�i\�\�\�ٳ>�טEw�\�2\�孜\�\�Y�O\�\�tɃ�3�}̾�\��Y�\�	�\��� e�9��\�\�%\�\��y\�\�\�\�S����O=�S��-[^WӦ�Z��=\�Z\�q�\�ȳ	�t��\��6�@�4\��XMM�+\�yY\�-t7\�t���m~i\n.�\���;z�\�\\`�h\�^z�����\\�{l�l\�\�_9竪6y4\�Gv;�\��w?�V=\�u��X�\�\'�\�\�z�\n\�+\�n?l\�e\�B6C_����\�~>���\�\�\�\�\��On\�r\����\��lY�/�\�yy���Zwт\��\�\\�ii%��+7}>\'��\"G\�� GR2f}��̦y�u���ԧ\�G�̙��^\"\�o/{V�?�\n�!{\�c\�\��\�̀\�=��T}��d�:v�Թ\���\�)V\�\�/\�LH�/������)S~\�d\�^V\�ʿ�_�&ݬ�\�^\'qq�\�\�R6�d}\����\\9\�9�f\���nK��\�\�Q��������\�\�s>�O��g\�1\�>�Ƈ��\���>�\�=\�\'L���\�\�Z��7\�ͯ�1j�7\��\�5\�y^\�Ϟ�[��Aɋ��}ʰ\�\��!]�\���Ӳ�\r��\'��W�o���W�^6\�\�\�m{_\�0\�Q�\�\��\�\�3\�\�>�\�􂹲MU]\�����\�m���\�B텤�45U8ӺWr\��m�\�o\��\�)\�\�6��~\�\�q7lH��\�|���\�\�\\.\�ᬳ�?\���#E\����^e�����y.\��\�\nG�nt\�\�\�\�}���\�\�칤�=�Zu\�\�N\�\�\��\�\�i�^�&%=��oh\�km\�\��&S`�i�c�<c6U���\�]�`��d4�>����ӑ�ߕ��0z�\�9\"G!ȑ=�d{\�oY	�\�2`��d\�YƗ�)�1�z�sz\\\�tr�B�{\���\�͛\�5�dѾ���>?�O�s\���c��r�iY\�_y\��X[�\�%k�m%s���s\�\�\�P\�\�~�^�ع�\�8���\�jtr����ܨ���,�\�Q���6�g\��/�̖�26导\'\�u����G9/����cGz5\�vfKJ\�\����%K�V^�#=N,x\�:F\�.\�$W9\�CƬ���>���j٢�!\�m�\�]\�[\�r���\�\�\�:\�r{����sb�\�ط\�\�\�&c\�+��}O��\�\��X\r�Z�^0\�b\�\�\�\���S\�;�m\����22\�9/+\n�\n�}^V��O�S7�%��W�e\�Ç�镆\�´�\�A�s�|\��\�z\�\�SO\�\�l�\�ҵ\�\'�����oP۶�\�[\�,x\�\�={\�t\�X<�����Rsee��\���w�\�\�^�\�ۗK54\�\rD�>���L�5�wO��\Z\�Ն�f�+��㫇�-	U\�\��n�9\"G\�\�\�\�H\�р�d�Կd\��=F\��\�4Ş�q\��\Z5j�\��\�q��z��>�܏d\���7\�\����\�9\r�\�!?T_����O\�_y�C��6��<\Zˬ�g<�p\'\�-𞙐9R�˽5o�>-9�\���e\Z��|�f/+\�\�\�ݤ��\��~\�R���\0\�\�yE���^�\�c\�J�=w\�1F�?45�\�l�ȴ�Qϲ\�\���-\�k�f�\�\�62��v�\���\�RS\�\�Ǫ�\�\�\�Iv\�\�&���\�\�ͼ}{�~\�GN{��~\�\�R�\�lL\���7\�/~\�y���<�}����\�\�~< \�����]��Z�.�$t�����5]kG�\�\����.j8oQ�}�\�9\"G\'8Guu;�ߍ\�\�Z\Z�}�r�\�\�͕��\��x\�\�x�\�>���\�\��\n�\�ݫ|777\�j�+Z��\n�t�sؿ�k��G�i\�\�2�-v+�cef��:/_>\�l8�\Z��V\���\�Ho�4�\�k<K\�a?W�9��\�\��\�o�K\�c?vi\�\Z\��\�.L�x?jӼ��\�h�\�g\\\�\�\�\�\�\�\�II\�\�d,\'\'?f}�i��]\�)z7u{z{�\�l��dڳ���j=��s�p\���\�L\�m\�C�a\�.�z���\�\�󹺛\�\�˔��\��\�\�z�^��������3\�y�~?�c7Х\r��T�T-�}߬}W&\����\�t�w\��V�_rD�B��\�֑̅�_R�V=c�\��P?|�>\�>\��Kδg�y�\�$_�O\�۷\�i�\�i\Z�(\�\�\�\�}\�\�\n��\�c��뮛��>\�\�^\�=Zh\�6[l�\�\�\�-\��}ڕ��\�\\y\�o6>\�\�w7\����\��\�m\�^k6��?u�\�\�ɷ\�\�\��_\�LW\\��&L\�4#��o�\�\��9\"G���T]~��9cMƿ�.+{\�K�\�\�9眭�\���3NdO-s\�ɳ��S�G_��i\�ݲ7;e�\�\�\�֖\�uVS��߱g�[;c�yi�\�\�fO�z�|�\�\�Ը�Pˇ\0˗\�\�_SZ�\�I\�q[z<C\�R�\�ܯ��ƕ\r\�G|�\�چ�<\�\����s��nG�ӯY��9\�ظ\�:�ҫ�\�.%\�V��*\��\�\�Y\�%�K\�Ef��bӑO��Ԋ��\���ӕG�m\�\�\�1���XgBN=�=\�t\�\�\�\�bN<\���<\��\�\�2�JԆ\r�����\�UFF�3��\�^�n�q�����g\�Ӿ\�\r\�ܑ�\�̑�ai�\�)�\�Νfm��_M�r�\�,����oc7ܕ�oY\�-3���><ǝ\�\�\�־�W��\�\�\�ͼ�3\�\�\�\�[�\�\�\�\����\'�+�\�j֬\�8�%+\�G�l5���\�Ƨܷ�?r�\�=v�H_\�;��(�h\�\���*��=�˵\�Yn\�\�\�\�\�s���~䯊�_w>�1,�rWWo�\�\�kL\�\�d�\�\�\�\'cW� M�\��\�{k8���\'\�\r�X�\�\����\�I�n\�e�\��\r\r�\���\�\nW\�ol۶\�j\�\�[\�|�\��`\�\�\�[\�7\�\�r\�\�\�9c_\�\�w�\�\�\�s��F\�Ο?\�\�\��\�hy?\�(\�@\�6\�JJ\�\�&y�Z�`��}��\�J�\��|s%~��\�\�d-����\\����>\�r��Hț�\���f.�S��v��t3.\�\��i)Y`�w9��oY�+\�\�M\�лC�\�9-ׅ\��	т��-�$��\�5m\�wQbt\���\��_U�e5�/;㡴4�\�t�\�;�\�˸\�\���*-\�Y�\"#Y�\�\�[\�\n�\�$&>�?��\�O\�e2�)\�\�s�-��\�o���?ֹ#Gљ����z�o��7\�֑�G:��-i�%\�\�o�\r�6�Q��u��I��\�\�]\��q�\�Y�?�A��\�t7\r�f�����~L{zόUTd\�\�\�1(\�m�\�G�l\�\�#�s�ǲ�*���H\�\�;�%��t�\'ߢO�\�\�G͘q�\��r\�\\\��O�\�k\�]e߱v\�\"G���\�\�?\��1C�L\�z�\��[>ܲǅ\�\�w�\�ȑ-zN\�\�2;[r{C\�u�\�lj78\�p�W?\�\�س\�Θ</{QƱ\������\�G���l\�߳\��Iɠ�\���ڙ�S�F���\�\rtm\�]�:|�@��76�\�rҟc}j��^�\�+���~G��k�LŃ~\�\��\�~�s\�}D\�\�Ӻ�\�:E�nh(QYY\��6s\�\�g�\���\��\�\�\�Դ\'$��\��h\��\�Vn�v�\�ػ�����\��\�9/[����\�\�\�m��/ԧ�\�.,\\e�Hqn\�^�\�u���^+��I�;�\'�՗ٗK\�`\�FV�d\�Ai:�oyx\�Z�ʲ�l��#Gѝ#�x�1{��>\"\�\�sܸ�p_\�?t\��y�}\�~�\�G�nu\�\�é\�o�Y�qe?����uw[�$yq7ǧu7\�e\�\���\�޲eE�\�]��ƶ�\����Ƿjɸ��s�2\��6���w�#ޏ\�w{l\�x��C\��ǹ^Ɨ\���j�2\�SS�\�\��fF������(\�_w\��s]�\�3��\�L\�\�eek�_\�Hu��l�1�\�\�~�;\�ƨ\�.\�u\����{��r����\�\Z\�L\'\�\�л��\Z\�\�G\�rY\�\�e�?�\�\�m\��{��\�{CZ�¬�2\��t�\�d[[�\��\�f�\�y\�b\�wC\�s!�N7\�vs�r\�}��\�mݠ��\�c��:/�!o\�����6a>^mYh\�\�M�+9�㍋��;i7��|Ĉ˼.��v�\�̕�_蕓ŋ\�[�g̘\�\\f\�-=\�\�GY\�\ZsE\�sf�\���\��Y�b=\�\�i��9�![4|W��i��-��p\�9�\�\�\�n\�ͳ�C(�e2\�/�\�_���>a�_\�\�ek��\�t6<Kn�a\���Ǖ��i\�~�)w~�\�\�d��\�q\�\�\�_�+u�՗7{_�\�H 9�i$��(��\r�D\�\�.	8���S�Fr�\����9?~ݨQ\��c�%_\���\���,\�\��^��\�W�ƅ\�{���\�\��i�k��~c�_\�\�,�͂3��\�^q�kN\�|\�+\�\'r?��ؙV\��r�i�=s\"�\�\���\�+Dꩧ\�q޿쪨x\�y\�\�p\�C\�\�(x?\��\�\'\�1��x���Y��`\����ۮ�DL�6^/e��oߟTj\�z!w\�H���k��^\�\�z\��z\ZC\�f��^IZ�\�q��8]_���\�Z�\�y�\�hl,�>�}A�����a?��\\�\�\��\�Ȋ�l-,.^e��,\�\�c?�3�e�ww�;�\�\�\�\�J\�\� �`DM�rs_6W\��\�۪Usu�;cƯ͕e��`i\�l\�d��l�iu7\���2\�%��e�r��a��?�*/_\�l�WU�w�}YI��\�\��D��ڽ`OX\�u�55\�\n\�2��+��/9\�\�G��\�\���\�,G\�<Ʒl\�\�샧]lߊ.5�6p̻CV.\�Ns\��s���us!Wj\�~��\�L\�[\�\�\�\�u;�\'����\�FkW���\�nd��E\��\�n֧�I��\�^Ӯ^=\��\���1xQ߿}{��\�\�14��9�W\��-�++mY�1Z�](j�KsTW�M�{���\rI\���QU�i6�;���\�\�\�y�\�\�\�FX\�5]m\�&�_���7\����\�\�z�\�x�\�\�\�<>�L�E\�n˖ea�;r\��rD�~D�\�9j�|���\�輟��+7��n�2\0\�\�]!��z�o#\�x\�p�)x\�j&޴v�K\�\�o\"�\�\�\�\�x\�9=u\�m\������\�\"}Z\�}D\�\�\�._��\�}o޼�����\"\��<\�\�\�\�\��rrC��D\�\n�\�J\�����F�?�\�{���\�jD\�\�\�\�m�}��n�\�@�p\�\�؋ԤIc�8�1{\���\�&�\�o[߁]\�wCN�J�\�/�\�_���\���s�2\�\�\�#t�~�\�6w\�Q��#��c��\n�l�;\�tK���\�`-\�`.\rY56y4�\�ֵuցd^q�𼼗�nw�\�.UG��<s\�)\'�\rɖf�a\�#�ƚ+��-m\��i�]\'8\�\�\��I�\\;�Ͼ\�455��ϖ\�\�\�\�\�!Z\�\�\'\�Vp��\�tƖ��8�kX\�\�ȑw�,\��mۖY\�\�\�\�\�\�\�4\�,�\�^-jv��V\�V+W>�\�\�\�\�\n\n��\r��A�LUWg6�y��o\��=�K\�\�Q�\�\��9b���\�\�vy\��-[�ۻ{�\�\�s\�6��]�`nhp�\\��j��\�\n�{�[�nrr^����\�\��q\�f$#\�9\'\�l\n���\�ima8a\�ϝ\�\'GT���x\�:�\��`%��W�\"*Gv6\�\�穦�}�\�`ذoq�H\�\�{YVVR�i\��\�z^��h;;�;C\�Ν\��1,��uC�&\�\�\�4��2w\��\�\����#r\�&�|�n9-R\�\�\�\�\�t\��܇\�#�V@�4ܲUK\�{n\�\�\�m���\�M��\��\�\���\�\�\�o\Zy�\�\���Eo}�\�\"�-\���co	\�\�nw��\�^�娴�5�\�j{\�\�\�Y�\�r>�ji�ػ��w�^h횝\�wz��JK��#�\�$2�\�6)\�A\�\0kl\�8\�\�ܑ�\�#��#rD�\�QP\�[c]�4\�YVC.[�\�\�\�e��A\�m\�0ܻ�{ޮκ\r�\�`��vt\Z\�A���E \�H69\n��N�#G\�\"G\�\"Gmcx��=�\�\�;\�\0f\�!\�nx��\�9\"G\��#rD��h\�\�mV\�\�\n�ўdp4r�3\�]\�b�wA\ZG�(rD�\�9\"G\�u�f=`\�Z�>1���\�阮{w�{\�8\0\�,��P���\�\���E\�\�\r9\"G\��#rD��h\�\0\�,�#h\�B�\�G�\�9\"G\��#��\0f\�a���+7\��#rD�\�9�h��`f�ܥ+9IQ�rC�\�9\"G\��#��\0f\�]&��\�\�E�\�9\"G\��#\04\�\�\�ՇQ\��#rD�\�9@\�M�`9\"G G\�\�\"G\0X0�`9�\�9�\�\�9���b�L�(rrD�@�\�\0\�f�#rrD�@�(r�3f�#rD�\�E�\�E�\0�`�X0�#���#�#r�3ł\���#�#�`�̂\��Q\�Q\�\0f�39�\��\�\��.\'�|\�w\r\r�,à��j�>s���\�\"G\�\"G G\�@<�Ǉ��`�Z����\�Y��QI�(rD�(rrD�\0D����lݜ9SY0�A�{U�9K�\�\"G\�\"G G\�@0\����˵��c\�\�\'=z��0gI��Q\�1�\�\�9%���aiR҃,��ƌ�j�9+r�\�\"G\��#�#r �:�\�\�ꋊV��\�\�\�_�ޜͺ��H�(rD�\�99\"G\0�O�9\��wΡ_(�\�ѣ\�|�\�0\�E�@�\�\�9\�\�N���y�\���\����\��X�d�L�(rrD�@�\��\�aPϞ\�\�9��SO�r\�\�M�^<\�\�9v\�\�1\�OD\�Q+�i\�w{\�݈Q\�\���#\0\�̥f\�1k�Y\rf)�\�\�2ܿ\�(?�Q+\�E�@�\�\�9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\���9��\�6BX\0\0\0\0IEND�B`�',0);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('next.dbid','1',1),('schema.history','create(5.15.1)',1),('schema.version','5.15.1',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
INSERT INTO `act_id_group` VALUES ('PRJ1_INSTMNG',1,'项目组A-仪器管理角色','user'),('PROJECT1',8,'项目组A','assignment'),('a',1,'本公司管理员','assignment'),('b',1,'部门管理员','assignment'),('c',1,'本部门管理员','assignment'),('d',8,'普通用户','assignment'),('dept',15,'系统管理员','assignment'),('hr',1,'公司管理员','assignment'),('jjbf',2,'仪器降级/报废人','assignment'),('jjbfsp',2,'仪器降级/报废审批人','assignment'),('wjzlgl',7,'文件资料管理岗','user'),('wjzljygh',8,'文件资料借阅归还岗','user'),('wjzlspg',7,'文件资料借阅审批岗','user'),('yqgl-gly',8,'仪器管理-管理员','user'),('yqgl-sp',4,'仪器管理-审批','user'),('yqgl-sqr',5,'仪器管理-借用申请角色','user'),('yqwx-sp',3,'仪器维修审批人','assignment'),('yqwx-sq',3,'仪器维修人','assignment');
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
INSERT INTO `act_id_membership` VALUES ('gaojie','jjbf'),('chenghua','jjbfsp'),('lixiang','wjzlgl'),('lisi','wjzljygh'),('zhangsan','wjzljygh'),('mawu','wjzlspg'),('lijian','yqgl-gly'),('huaqiang','yqgl-sp'),('wangfeng','yqgl-sqr'),('zhaowei','yqwx-sp'),('zhangli','yqwx-sq');
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
INSERT INTO `act_id_user` VALUES ('001',1,'仪器管理员','','','',NULL),('002',1,'仪器管理-审批','','','',NULL),('003',1,'003','','','',NULL),('444',1,'44','','','',NULL),('admin',1,'管理员','','','',NULL),('chenghua',1,'仪器降级/报废审批人','','','',NULL),('demo',3,'系统管理员','','','',NULL),('gaojie',1,'仪器降级/报废人','','','',NULL),('huaqiang',1,'仪器借用申请审批人','','','',NULL),('jn_zhb',3,'济南综合部','','','',NULL),('lijian',2,'仪器管理员','','','',NULL),('lisi',2,'李四','','','',NULL),('lixiang',5,'李湘','','','',NULL),('ljhai',1,'李久海','','','',NULL),('mawu',1,'马五','','','',NULL),('sa',1,'系统管理员','','','',NULL),('sd_admin',1,'管理员','',NULL,'',NULL),('sd_jsb',1,'技术部','',NULL,'',NULL),('sd_scb',2,'市场部','','','',NULL),('sd_yfb',1,'研发部','',NULL,'',NULL),('sd_zhb',1,'综合部','',NULL,'',NULL),('thinkgem',3,'系统管理员','','ll@163.com','',NULL),('wangfeng',1,'仪器借用人','','','',NULL),('zhangli',1,'仪器维修人','','','',NULL),('zhangsan',2,'张三','','','',NULL),('zhaowei',1,'仪器维修审批人','','','',NULL);
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('20150507107','SpringAutoDeployment',NULL,'','2015-05-07 08:06:56');
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('test_audit:1:20150507110',1,'http://www.activiti.org/test','流程审批测试流程','test_audit',1,'20150507107','test_audit.bpmn20.xml','test_audit.png',NULL,1,1,'');
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `link` varchar(255) DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article_data`
--

DROP TABLE IF EXISTS `cms_article_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `content` text COMMENT '文章内容',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章详表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article_data`
--

LOCK TABLES `cms_article_data` WRITE;
/*!40000 ALTER TABLE `cms_article_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_article_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) NOT NULL COMMENT '栏目名称',
  `image` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `sort` int(11) DEFAULT '30' COMMENT '排序（升序）',
  `in_menu` char(1) DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comment`
--

DROP TABLE IF EXISTS `cms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comment` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) DEFAULT NULL COMMENT '栏目内容的标题',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comment`
--

LOCK TABLES `cms_comment` WRITE;
/*!40000 ALTER TABLE `cms_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_guestbook`
--

DROP TABLE IF EXISTS `cms_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_guestbook` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) NOT NULL COMMENT '留言分类',
  `content` varchar(255) NOT NULL COMMENT '留言内容',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `phone` varchar(100) NOT NULL COMMENT '电话',
  `workunit` varchar(100) NOT NULL COMMENT '单位',
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) DEFAULT NULL COMMENT '回复人',
  `re_date` datetime DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_guestbook`
--

LOCK TABLES `cms_guestbook` WRITE;
/*!40000 ALTER TABLE `cms_guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_link`
--

DROP TABLE IF EXISTS `cms_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_link` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '链接名称',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_link`
--

LOCK TABLES `cms_link` WRITE;
/*!40000 ALTER TABLE `cms_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_site`
--

DROP TABLE IF EXISTS `cms_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_site` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '站点名称',
  `title` varchar(100) NOT NULL COMMENT '站点标题',
  `logo` varchar(255) DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) DEFAULT 'default' COMMENT '主题',
  `copyright` text COMMENT '版权信息',
  `custom_index_view` varchar(255) DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_site`
--

LOCK TABLES `cms_site` WRITE;
/*!40000 ALTER TABLE `cms_site` DISABLE KEYS */;
INSERT INTO `cms_site` VALUES ('1','默认站点','Web','',NULL,'Site ','Site ','basic','<p>\r\n	Copyright &copy; 2012-2013 <a href=\"#\" target=\"_blank\">ThinkGem</a> - Powered By <a href=\"#\" target=\"_blank\">Site</a> V1.0</p>','','1','2013-05-27 08:00:00','1','2015-04-16 13:00:38',NULL,'0'),('2','子站点测试','Subsite','',NULL,'subsite','Site ','basic','<p>\r\n	Copyright &copy; 2012-2013 Powered By V1.0</p>','','1','2013-05-27 08:00:00','1','2015-04-16 12:56:51',NULL,'0');
/*!40000 ALTER TABLE `cms_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_scheme`
--

DROP TABLE IF EXISTS `gen_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_scheme`
--

LOCK TABLES `gen_scheme` WRITE;
/*!40000 ALTER TABLE `gen_scheme` DISABLE KEYS */;
INSERT INTO `gen_scheme` VALUES ('08b3f80abe2647ae9e4f1db035f12c41','文件资料与借阅单号关联','curd','labs.modules','files','','文件资料与借阅单号关联','文件资料与借阅单号关联','YL','cc1aea94e07946ae8520485e8b5fd79c','1','2015-05-30 16:33:57','1','2015-05-30 16:33:57','','0'),('12d07b15cadf4abd954e9971340184eb','仪器设备借用申请与仪器基础信息关联表','curd','labs.modules','yq','','仪器设备借用申请与仪器基础信息关联表','借用申请与仪器基础信息关联表','yq','4fac809a15704ca8a7d778d6b12b85e0','1','2015-06-14 15:04:27','1','2015-06-14 15:04:27','','0'),('13415d399d8846fca006e2b09f4589f3','设备维修申请与仪器基础信息关联表','curd','labs.modules','yq','','设备维修申请与仪器基础信息关联表','设备维修申请与仪器基础信息关联表','yq','31aa87eed12f41ec8a5f5c06522b3ff1','1','2015-06-16 15:58:21','1','2015-06-16 15:58:21','','0'),('20150511101','数据字典类型','curd','labs.modules','sys','','数据字典类型','数据字典类型','数据字典类型','20150511101','1','2015-05-11 13:41:36','1','2015-05-11 13:53:08','','0'),('35a13dc260284a728a270db3f382664b','树结构','treeTable','com.thinkgem.jeesite.modules','test','sub','树结构生成','树结构','ThinkGem','f6e4dafaa72f4c509636484715f33a96','1','2013-08-12 13:10:05','1','2015-05-08 17:30:14','','0'),('82ae3575be15490f8aa6595a8fc8dd08','文件资料管理','curd','labs.modules','files','','文件资料管理','文件资料管理','YL','b2201709121d48959d37bf782bb2a836','1','2015-05-30 16:32:46','1','2015-05-30 16:32:46','','0'),('9b6c5e1084c54daa87298797d7d36483','仪器设备借用申请','curd','labs.modules','yq','','仪器设备借用申请','仪器设备借用申请','labs','05bebfc3649e47b3b30898052568e047','1','2015-06-01 17:14:33','1','2015-06-01 17:14:33','','0'),('9c9de9db6da743bb899036c6546061ac','单表','curd','com.thinkgem.jeesite.modules','test','','单表生成','单表','ThinkGem','aef6f1fc948f4c9ab1c1b780bc471cc2','1','2013-08-12 13:10:05','1','2015-04-25 13:47:31','','0'),('9cdbee32d448475da5dd863c028d6183','仪器降级/报废管理','curd','labs.modules','yq','','仪器降级/报废','仪器降级/报废','ljh','e61380a6338745f493c2201947d3f2db','1','2015-06-15 10:51:51','1','2015-06-15 10:51:51','','0'),('bc251bbb48524e3ba0998e6883cd970e','文件资料借阅记录','curd','labs.modules','files','','文件资料借阅记录','文件资料借阅记录','YL','79ea565269e94290811466e2009d2069','1','2015-05-30 16:33:09','1','2015-05-30 16:33:09','','0'),('bcd599e2405a4b37b2741542d1779113','仪器信息管理','curd','labs.modules','yq','','仪器信息管理','仪器信息','yq','f4a9dc141b664cf999a76180f4b1e688','1','2015-05-27 14:53:12','1','2015-05-27 14:53:12','','0'),('d7a9122dcc914c139d1e25075e954af8','仪器维修','curd','labs.modules','yq','仪器维修','仪器维修','仪器维修','仪器维修','ea5412a0e8214a6cb467071d3a4e8826','1','2015-06-17 16:18:38','1','2015-06-17 16:18:38','','0'),('db8474f196f645ef8674632a59226496','设备降级/报废申请与仪器基础信息关联表','curd','labs.modules','yq','','设备降级/报废申请与仪器基础信息关联表','设备降级/报废申请与仪器基础信息关联表','yq','417e2601a3f84d409920e61f1d52237a','1','2015-06-16 15:57:51','1','2015-06-16 15:57:51','','0'),('e6d905fd236b46d1af581dd32bdfb3b0','主子表','curd_many','com.thinkgem.jeesite.modules','test','sub','主子表生成','主子表','ThinkGem','43d6d5acffa14c258340ce6765e46c6f','1','2013-08-12 13:10:05','1','2015-05-08 17:30:25','','0');
/*!40000 ALTER TABLE `gen_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES ('05bebfc3649e47b3b30898052568e047','lab_borrow_request','仪器设备借用申请单','LabBorrowRequest','','','1','2015-06-01 17:13:35','1','2015-06-01 17:13:35','','0'),('20150511101','sys_dict_type','数据字典类型','SysDictType','','','1','2015-05-11 13:41:22','1','2015-05-25 13:25:06','','0'),('31aa87eed12f41ec8a5f5c06522b3ff1','lab_repair_request_and_baseinfo','设备维修申请与仪器基础信息关联表','LabRepairRequestAndBaseinfo','','','1','2015-06-16 15:56:29','1','2015-06-16 15:56:29','','0'),('417e2601a3f84d409920e61f1d52237a','lab_scrap_apply_and_baseinfo','设备降级/报废申请与仪器基础信息关联表','LabScrapApplyAndBaseinfo','','','1','2015-06-16 15:56:49','1','2015-06-16 15:56:49','','0'),('43d6d5acffa14c258340ce6765e46c6f','test_data_main','业务数据表','TestDataMain',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4fac809a15704ca8a7d778d6b12b85e0','lab_borrow_request_and_baseinfo','仪器设备借用申请与仪器基础信息关联表','LabBorrowRequestAndBaseinfo','','','1','2015-06-14 15:03:03','1','2015-06-14 15:03:03','','0'),('6e05c389f3c6415ea34e55e9dfb28934','test_data_child','业务数据子表','TestDataChild','test_data_main','test_data_main_id','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('7786840d0d84431d935d1e473daa06d9','newtable','newtable','Newtable','','','1','2015-06-04 10:08:41','1','2015-06-04 10:08:41','','0'),('79ea565269e94290811466e2009d2069','lab_file_borrow','文件资料借用归还记录','LabFileBorrow','','','1','2015-05-30 16:28:31','1','2015-05-30 16:28:31','','0'),('aef6f1fc948f4c9ab1c1b780bc471cc2','test_data','业务数据表','TestData','','','1','2013-08-12 13:10:05','1','2015-05-27 09:32:17','','0'),('b2201709121d48959d37bf782bb2a836','lab_file_attributes','文件资料属性','LabFileAttributes','','','1','2015-05-30 16:25:37','1','2015-05-30 16:25:37','','0'),('cc1aea94e07946ae8520485e8b5fd79c','lab_file_borrow_relationship','文件资料与借用记录之间的关系','LabFileBorrowRelationship','','','1','2015-05-30 16:29:40','1','2015-05-30 16:29:40','','0'),('e61380a6338745f493c2201947d3f2db','lab_scrap_apply','设备降级/报废申请表','LabScrapApply','','','1','2015-06-15 10:50:07','1','2015-06-15 10:50:07','','0'),('ea5412a0e8214a6cb467071d3a4e8826','lab_repair_request','设备维修申请表','LabRepairRequest','','','1','2015-06-17 16:17:37','1','2015-06-17 16:17:37','','0'),('f4a9dc141b664cf999a76180f4b1e688','lab_equipment_baseinfo','仪器基本信息','LabEquipmentBaseinfo','','','1','2015-05-27 14:52:05','1','2015-05-27 16:54:58','','0'),('f6e4dafaa72f4c509636484715f33a96','test_tree','树结构表','TestTree',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES ('013476c4ae314d089dfe2be8a993cb1f','31aa87eed12f41ec8a5f5c06522b3ff1','wxsqdh','仪器维修申请单号','varchar(20)','String','wxsqdh','0','0','1','1','1','1','=','input','',NULL,20,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('0424834d95f84f138a7faccb8bf0bdf1','05bebfc3649e47b3b30898052568e047','jcrq','借出日期','date','java.util.Date','jcrq','0','1','1','1','1','0','=','dateselect','',NULL,160,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('0547db21fd1a4ba5ba496b9b5f289d30','cc1aea94e07946ae8520485e8b5fd79c','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,20,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('05df3da7ed9f4117b5e5472af2640770','ea5412a0e8214a6cb467071d3a4e8826','remarks','备注','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,300,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('0637b22355f24b9ca26dca88cfb3d1f5','e61380a6338745f493c2201947d3f2db','amt','数量','int(11)','Integer','amt','0','1','1','1','0','0','=','input','',NULL,60,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('07893aecbd824f279e2964c57d5b066e','05bebfc3649e47b3b30898052568e047','approved_by','审批人','varchar(20)','String','approvedBy','0','1','1','1','0','0','=','input','',NULL,80,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('08329e2e691c440eb30f0c9059e0cb90','79ea565269e94290811466e2009d2069','t1','备用1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,80,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('0902a0cb3e8f434280c20e9d771d0658','aef6f1fc948f4c9ab1c1b780bc471cc2','sex','性别','char(1)','String','sex','0','1','1','1','1','1','=','radiobox','sex',NULL,6,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('09a7927e43ea4f1aa4f972b8e84e9db9','4fac809a15704ca8a7d778d6b12b85e0','create_by','创建者','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,40,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('0a032ad64a144ed3a99f1d548276459c','ea5412a0e8214a6cb467071d3a4e8826','yjfxfy','预计维修费用','varchar(100)','String','yjfxfy','0','1','1','1','1','0','=','input','',NULL,120,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('0b6b0d3766f64b3caa55ef9489c46716','e61380a6338745f493c2201947d3f2db','t2','备用2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,340,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('0c0cae906127482595b4247c42b1267d','e61380a6338745f493c2201947d3f2db','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,310,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('0c260625588043b6b50d33578cd3c2dd','f4a9dc141b664cf999a76180f4b1e688','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,230,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('0c99ce6b1ad34b8094a4aa398fa37c6d','79ea565269e94290811466e2009d2069','revertexecuter','归还经办人','varchar(64)','String','revertexecuter','0','1','1','1','0','0','=','input','',NULL,240,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('0d685bdcce0947078f1593e51c9a05b5','79ea565269e94290811466e2009d2069','approvename','审批人姓名','varchar(64)','String','approvename','0','1','1','1','0','0','=','input','',NULL,160,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('0e3cf308ca324b16b87c66a97b6040c6','ea5412a0e8214a6cb467071d3a4e8826','sbmc','仪器设备名称','varchar(100)','String','sbmc','0','1','1','1','0','0','=','input','',NULL,180,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('0f136c0ae7424bf7a4336eb7ebde6e87','05bebfc3649e47b3b30898052568e047','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,220,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('103fc05c88ff40639875c2111881996a','aef6f1fc948f4c9ab1c1b780bc471cc2','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,9,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('10c0163633ee4cca9c74d039351e6bd6','b2201709121d48959d37bf782bb2a836','fileid','文件资料ID','varchar(64)','String','fileid','0','1','1','1','1','1','like','input','',NULL,110,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('12494ce5de7a4159b37a617244d1e6b0','ea5412a0e8214a6cb467071d3a4e8826','control_no','控制编号','varchar(30)','String','controlNo','0','1','1','1','0','0','=','input','',NULL,20,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('12da64c7c12f4c90af00451864472eae','b2201709121d48959d37bf782bb2a836','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,20,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('12fa38dd986e41908f7fefa5839d1220','6e05c389f3c6415ea34e55e9dfb28934','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('13a01dfcf5f149f391359508d88a61a9','f4a9dc141b664cf999a76180f4b1e688','factory_no','出厂编号','varchar(30)','String','factoryNo','0','1','1','1','0','0','=','input','',NULL,50,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('14680c956a7e44b3be543894cf6f0b60','f4a9dc141b664cf999a76180f4b1e688','use_date','投入使用日期','date','java.util.Date','useDate','0','1','1','1','0','0','=','dateselect','',NULL,70,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('161a3e9b4a074796aec39302d455c0d0','b2201709121d48959d37bf782bb2a836','filename','文件资料名称','varchar(256)','String','filename','0','1','1','1','1','1','like','input','',NULL,120,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('17e05ac2836442ad98606e56e549ce05','4fac809a15704ca8a7d778d6b12b85e0','update_by','更新者','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,60,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('17fa9c4ce4054c48919a0cbe8208b830','4fac809a15704ca8a7d778d6b12b85e0','t3','备用3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,130,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('18b33c1366dd412cba6e681803063c10','e61380a6338745f493c2201947d3f2db','dqzt','当前状态','varchar(30)','String','dqzt','0','0','1','1','1','0','=','input','',NULL,220,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('19485845ecf74aa9964b970a6d6df117','4fac809a15704ca8a7d778d6b12b85e0','yq_no','仪器编号','varchar(30)','String','yqNo','0','0','1','1','1','0','=','input','',NULL,30,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('195ee9241f954d008fe01625f4adbfef','f6e4dafaa72f4c509636484715f33a96','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('197d281596924c5c93bf99bef6a95250','f4a9dc141b664cf999a76180f4b1e688','sbmc','仪器设备名称','varchar(200)','String','sbmc','0','0','1','1','1','1','=','input','',NULL,190,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('19bbdaa451774330bf73d790cce88fd4','05bebfc3649e47b3b30898052568e047','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,240,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('19c6478b8ff54c60910c2e4fc3d27503','43d6d5acffa14c258340ce6765e46c6f','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1ac6562f753d4e599693840651ab2bf7','43d6d5acffa14c258340ce6765e46c6f','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1b615745a8c1421bbe79d9237451c4f8','ea5412a0e8214a6cb467071d3a4e8826','create_by','创建者','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,260,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('1b8eb55f65284fa6b0a5879b6d8ad3ec','aef6f1fc948f4c9ab1c1b780bc471cc2','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','1','between','dateselect','',NULL,7,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('1c852652cc094159ad602cb9a4d109a7','b2201709121d48959d37bf782bb2a836','filetype','文件资料类型','int(11)','Integer','filetype','0','1','1','1','0','0','=','input','',NULL,160,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('1cbfa86f409f46f98c71197706a130aa','b2201709121d48959d37bf782bb2a836','create_by','创建者','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,10,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('1d5ca4d114be41e99f8dc42a682ba609','aef6f1fc948f4c9ab1c1b780bc471cc2','user_id','归属用户','varchar2(64)','String','user.id|name','0','1','1','1','1','1','=','userselect','',NULL,2,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('1e0f2af040084ffebb8499474326b2bd','79ea565269e94290811466e2009d2069','approveopinion','审批人意见','varchar(256)','String','approveopinion','0','1','1','1','0','0','=','input','',NULL,170,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('1e19c26fa94b451c88800c1ae404f3ce','ea5412a0e8214a6cb467071d3a4e8826','equip_type','型号','varchar(20)','String','equipType','0','1','1','1','0','0','=','input','',NULL,30,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('1e20cb7ffd9f4126a4b253cd82679a3d','b2201709121d48959d37bf782bb2a836','stamp','时间戳','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,70,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('1e3ffe11096542f4acc4575801a09507','ea5412a0e8214a6cb467071d3a4e8826','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,310,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('1f0a326925334994b19c607dfdda241c','e61380a6338745f493c2201947d3f2db','jjbfly','降级报废理由','varchar(200)','String','jjbfly','0','1','1','1','0','0','=','input','',NULL,140,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('2007cf98379b4ee3a2076d65454ddfdc','79ea565269e94290811466e2009d2069','t2','备用2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,90,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('20150511101','20150511101','id','id','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511102','20150511101','code','类型代码','varchar(30)','String','code','0','0','1','1','1','1','=','input','',NULL,20,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511103','20150511101','name','类别名称','varchar(64)','String','name','0','0','1','1','0','1','like','input','',NULL,30,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511104','20150511101','create_by','创建者','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,40,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511105','20150511101','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','1','0','=','dateselect','',NULL,50,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511106','20150511101','update_by','更新者','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,60,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511107','20150511101','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,70,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511108','20150511101','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,80,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511109','20150511101','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,90,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511110','20150511101','stamp','时间戳','timestamp','java.sql.Timestamp','stamp','0','0','1','0','0','0','=','input','',NULL,100,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511111','20150511101','t1','备用1','varchar(20)','String','t1','0','1','1','0','0','0','=','input','',NULL,110,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511112','20150511101','t2','备用2','varchar(40)','String','t2','0','1','1','0','0','0','=','input','',NULL,120,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('20150511113','20150511101','t3','备用3','decimal(10,0)','String','t3','0','1','1','0','0','0','=','input','',NULL,130,'1','2015-05-11 13:41:22','1','2015-05-25 13:25:06',NULL,'0'),('21630557f915453b8b7b3ccfbf89793f','f4a9dc141b664cf999a76180f4b1e688','sbshrq','设备收货日期','date','java.util.Date','sbshrq','0','1','1','1','0','0','=','dateselect','',NULL,170,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('21756504ffdc487eb167a823f89c0c06','43d6d5acffa14c258340ce6765e46c6f','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('22dd4c098ae647d6b65bb2128a54c2df','e61380a6338745f493c2201947d3f2db','filled_by','申请人','varchar(20)','String','filledBy','0','1','1','1','1','0','=','input','',NULL,190,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('2358b714feca44dfa9735285699772fd','e61380a6338745f493c2201947d3f2db','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('24bbdc0a555e4412a106ab1c5f03008e','f6e4dafaa72f4c509636484715f33a96','parent_ids','所有父级编号','varchar2(2000)','String','parentIds','0','0','1','1','0','0','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('250cafe9c3334cf5b5908e7f066f8e82','e61380a6338745f493c2201947d3f2db','approved_by','审批人','varchar(20)','String','approvedBy','0','1','1','1','0','0','=','input','',NULL,170,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('2708a9b66e2b4a25a24834ab6a6b9971','31aa87eed12f41ec8a5f5c06522b3ff1','update_by','更新者','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,60,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('279fb643714c4f01b8069462086808a4','79ea565269e94290811466e2009d2069','borrowrecheckdate','借阅执行日期','date','java.util.Date','borrowrecheckdate','0','1','1','1','0','0','=','dateselect','',NULL,230,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('280891b414684ffda69bc0896487543c','79ea565269e94290811466e2009d2069','approvedate','审批的日期','date','java.util.Date','approvedate','0','1','1','1','0','0','=','dateselect','',NULL,200,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('28b3e529a39b47389cbb37cf13a88937','ea5412a0e8214a6cb467071d3a4e8826','wxly','维修理由','varchar(200)','String','wxly','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('2b3ec47a7a7d4b69a5c3181b5e77d252','cc1aea94e07946ae8520485e8b5fd79c','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,40,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('2c6adcfa3d13425da24f66983ef203f5','f4a9dc141b664cf999a76180f4b1e688','zcyz','财产原值','float','Float','zcyz','0','1','1','1','0','0','=','input','',NULL,130,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('2c8da90517534232acd07e9a2e17a18f','05bebfc3649e47b3b30898052568e047','remarks','备注','varchar(100)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,250,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('2d814b12f4e546859e9c171fd66d734e','417e2601a3f84d409920e61f1d52237a','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,70,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('3035b6aa77c34e339a51c969e5006103','e61380a6338745f493c2201947d3f2db','equip_type','型号','varchar(20)','String','equipType','0','1','1','1','1','0','=','input','',NULL,40,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('31e790f3a79f41aca8a195d09dd54f52','f4a9dc141b664cf999a76180f4b1e688','accepted_state','收货时状态','varchar(10)','String','acceptedState','0','1','1','1','0','0','=','select','sys_office_type',NULL,90,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('33152ce420904594b3eac796a27f0560','6e05c389f3c6415ea34e55e9dfb28934','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3324ef1a963a45f99c1a0bb1384adcd9','b2201709121d48959d37bf782bb2a836','t1','备用1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,80,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('34f7443214334cd7b18e6c2e3225cf2e','05bebfc3649e47b3b30898052568e047','jcfhr','借出复核人','varchar(200)','String','jcfhr','0','1','1','1','0','0','=','input','',NULL,150,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('350100bed5e24cab999753f2aa39a709','e61380a6338745f493c2201947d3f2db','t3','备用3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,350,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('35af241859624a01917ab64c3f4f0813','aef6f1fc948f4c9ab1c1b780bc471cc2','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('37b92cb7cd0a4368b099d23d6d68ca54','ea5412a0e8214a6cb467071d3a4e8826','sig_date','审批日期','date','java.util.Date','sigDate','0','1','1','1','0','0','=','dateselect','',NULL,130,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('39080d975f3343bcbca3baa7d993b88d','ea5412a0e8214a6cb467071d3a4e8826','zcyz','财产原值','float','Float','zcyz','0','1','1','1','1','0','=','input','',NULL,80,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('39487bf03d1143c49fbe22f19a91c678','e61380a6338745f493c2201947d3f2db','update_by','更新者','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,280,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('396a34cc22ff42448a99ec08047d132f','cc1aea94e07946ae8520485e8b5fd79c','id','ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,110,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('398b4a03f06940bfb979ca574e1911e3','aef6f1fc948f4c9ab1c1b780bc471cc2','create_by','创建者','varchar2(64)','String','createBy.id','0','0','1','0','0','0','=','input','',NULL,8,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('39af03e4bc49431aa37f8316e7177a06','cc1aea94e07946ae8520485e8b5fd79c','fileid','文件资料编号','varchar(64)','String','fileid','0','1','1','1','1','1','=','input','',NULL,120,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('3a715b18041e49158f3f84a68a3151f4','05bebfc3649e47b3b30898052568e047','syly','使用理由','varchar(200)','String','syly','0','1','1','1','1','0','=','input','',NULL,60,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('3a7cf23ae48a4c849ceb03feffc7a524','43d6d5acffa14c258340ce6765e46c6f','area_id','归属区域','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','0','0','=','areaselect',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3a9a4d6205854e9ba06bca22769ab3e7','05bebfc3649e47b3b30898052568e047','jydh','仪器设备借用申请单号','varchar(20)','String','jydh','0','0','1','1','1','1','=','input','',NULL,100,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('3c630e396d994daeaa9123260c49dc1a','f4a9dc141b664cf999a76180f4b1e688','remarks','备注','varchar(100)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,240,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('3cf6fe6772ab4a999f83ac172aeaa766','ea5412a0e8214a6cb467071d3a4e8826','mcwxrq','末次维修日期','date','java.util.Date','mcwxrq','0','1','1','1','0','0','=','dateselect','',NULL,100,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('3d9c32865bb44e85af73381df0ffbf3d','43d6d5acffa14c258340ce6765e46c6f','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3e0c42f512624c47b2c76416b0a602ab','05bebfc3649e47b3b30898052568e047','stamp','时间戳','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,270,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('3ee9bb42410b41e5bba20dfc43744bce','31aa87eed12f41ec8a5f5c06522b3ff1','remarks','备注','varchar(100)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,80,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('40159dee0b5a465ea96a00ac143e3625','b2201709121d48959d37bf782bb2a836','t2','备用2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,90,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('416c76d2019b4f76a96d8dc3a8faf84c','f6e4dafaa72f4c509636484715f33a96','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('42b59ce4471b45268d87a52f6645984d','f4a9dc141b664cf999a76180f4b1e688','sno','序号','varchar(10)','String','sno','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('42edfe01dc69434b8e20ea2c6ee71759','b2201709121d48959d37bf782bb2a836','filestatus','当前状态','int(11)','Integer','filestatus','0','1','1','1','1','0','=','input','',NULL,200,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('437695a3fd6047b3910c69d7c0fbb09f','f4a9dc141b664cf999a76180f4b1e688','zcjz','财产净值','float','Float','zcjz','0','1','1','1','0','0','=','input','',NULL,150,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('4494156acd5541e69053a8316a0ae4e8','4fac809a15704ca8a7d778d6b12b85e0','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,50,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('460431c8225547db92f481806b004e61','31aa87eed12f41ec8a5f5c06522b3ff1','stamp','时间戳','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,100,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('46e6d8283270493687085d29efdecb05','f6e4dafaa72f4c509636484715f33a96','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('46eb5b7e4c194557b1094102b858d181','05bebfc3649e47b3b30898052568e047','sbjsl','借用仪器设备名称及数量','varchar(200)','String','sbjsl','0','1','1','1','1','1','like','input','',NULL,110,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('48f1fad24b85487d917f6e499f9c61a9','ea5412a0e8214a6cb467071d3a4e8826','factory_date','出厂日期','date','java.util.Date','factoryDate','0','1','1','1','1','0','=','dateselect','',NULL,60,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('4a0a1fff86ca46519477d66b82e01991','aef6f1fc948f4c9ab1c1b780bc471cc2','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input','',NULL,5,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('4a22d64765dc4e178739dce1dd1d1c3c','417e2601a3f84d409920e61f1d52237a','t2','备用2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('4bc24b6854e3445f89038f55a183df3b','cc1aea94e07946ae8520485e8b5fd79c','create_by','创建者','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,10,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('4c8d5fca0dde4c0f863404af5ba630a8','05bebfc3649e47b3b30898052568e047','jybm','借用部门','varchar(60)','String','jybm','0','1','1','1','1','0','=','input','',NULL,20,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('4c8ef12cb6924b9ba44048ba9913150b','43d6d5acffa14c258340ce6765e46c6f','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4c9708a18cf04d5cb1e4a3a0c900c9e4','f4a9dc141b664cf999a76180f4b1e688','place','目前放置地点','varchar(60)','String','place','0','1','1','1','0','0','=','input','',NULL,80,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('4e34dbf9122949bfbf6b7856a9cade4b','79ea565269e94290811466e2009d2069','borrowexecuter','借阅经办人','varchar(64)','String','borrowexecuter','0','1','1','1','0','0','=','input','',NULL,210,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('4f72551508a74ac8844c5743621f0dbe','417e2601a3f84d409920e61f1d52237a','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,90,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('523fe9fc2db34d318136a48f4e9b2f96','e61380a6338745f493c2201947d3f2db','wxly','维修理由','varchar(200)','String','wxly','0','1','1','1','0','0','=','input','',NULL,130,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('528ec67939a74da6a543f147e5797e8c','05bebfc3649e47b3b30898052568e047','create_by','创建者','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,210,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('529a50606c514df18cc2097d083b71e9','ea5412a0e8214a6cb467071d3a4e8826','applicant','申请人','varchar(20)','String','applicant','0','1','1','1','0','0','=','input','',NULL,140,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('53d65a3d306d4fac9e561db9d3c66912','6e05c389f3c6415ea34e55e9dfb28934','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('55af237190c942d493c90e345c61b127','e61380a6338745f493c2201947d3f2db','yjzccz','预计净残值','float','Float','yjzccz','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('56fa71c0bd7e4132931874e548dc9ba5','6e05c389f3c6415ea34e55e9dfb28934','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5898afacf61f47749af0f2efa8de7218','b2201709121d48959d37bf782bb2a836','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,60,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('5a4a1933c9c844fdba99de043dc8205e','aef6f1fc948f4c9ab1c1b780bc471cc2','update_by','更新者','varchar2(64)','String','updateBy.id','0','0','1','1','0','0','=','input','',NULL,10,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('5ad4183b35a74344b8d2cafa4942713d','05bebfc3649e47b3b30898052568e047','t3','备用3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,300,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('5e5c69bd3eaa4dcc9743f361f3771c08','aef6f1fc948f4c9ab1c1b780bc471cc2','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input','',NULL,1,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('5ebd1e5b10b84f5094f06d7825b71377','b2201709121d48959d37bf782bb2a836','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,40,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('5eef359a4e0643c9bf8ddd4763e8efe5','79ea565269e94290811466e2009d2069','update_by','更新者','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,30,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('5ef1e111624349d6966a450b0113857a','f4a9dc141b664cf999a76180f4b1e688','equip_type','型号','varchar(20)','String','equipType','0','1','1','1','1','0','=','input','',NULL,40,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('5efd6293f1c54302928c8422585ff64a','31aa87eed12f41ec8a5f5c06522b3ff1','create_by','创建者','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,40,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('5f6573f4887e4566805f411a2bea2fa4','f4a9dc141b664cf999a76180f4b1e688','dqzt','当前状态','varchar(30)','String','dqzt','0','0','1','1','1','0','=','input','',NULL,180,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('5ff4b587857447d484564e380d827a1a','e61380a6338745f493c2201947d3f2db','equip_name','设备名称','varchar(60)','String','equipName','0','1','1','1','1','0','=','input','',NULL,30,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('6087acf0c0cb4e0e95b7a02be3e97794','79ea565269e94290811466e2009d2069','reqenddate','预计申请截止日期','date','java.util.Date','reqenddate','0','1','1','1','1','0','=','dateselect','',NULL,150,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('61617f0dd34f4e4ba2c82c860ed75c60','f4a9dc141b664cf999a76180f4b1e688','fj','附件','varchar(200)','String','fj','0','1','1','1','0','0','=','input','',NULL,100,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('62678a0088314cda8ee13d5d45288202','f4a9dc141b664cf999a76180f4b1e688','euip_no','表号','varchar(30)','String','euipNo','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('633f5a49ec974c099158e7b3e6bfa930','f6e4dafaa72f4c509636484715f33a96','name','名称','nvarchar2(100)','String','name','0','0','1','1','1','1','like','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('6361359aaa3c4c118449b73396da7cab','b2201709121d48959d37bf782bb2a836','usedate','投入使用日期','date','java.util.Date','usedate','0','1','1','1','0','0','=','dateselect','',NULL,180,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('6459206248254e30941a669d864e29b4','417e2601a3f84d409920e61f1d52237a','remarks','备注','varchar(100)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,80,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('649df51124564b678eed071de14138db','79ea565269e94290811466e2009d2069','revertrecheck','归还复核人','varchar(64)','String','revertrecheck','0','1','1','1','0','0','=','input','',NULL,250,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('652491500f2641ffa7caf95a93e64d34','6e05c389f3c6415ea34e55e9dfb28934','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('6580aa9069f24e0f83274287a305bc54','417e2601a3f84d409920e61f1d52237a','create_by','创建者','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,40,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('65c32ee57fcc417e827423202aa024e8','417e2601a3f84d409920e61f1d52237a','t3','备用3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,130,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('6665665fcce9423cabe3347da0f03ea8','79ea565269e94290811466e2009d2069','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,20,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('669737fa28374be68c7298e01329f5dd','f4a9dc141b664cf999a76180f4b1e688','yq_no','仪器编号','varchar(30)','String','yqNo','0','0','1','1','1','1','=','input','',NULL,160,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('6763ff6dc7cd4c668e76cf9b697d3ff6','f6e4dafaa72f4c509636484715f33a96','sort','排序','number(10)','Integer','sort','0','0','1','1','1','0','=','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('67d0331f809a48ee825602659f0778e8','43d6d5acffa14c258340ce6765e46c6f','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('68345713bef3445c906f70e68f55de38','6e05c389f3c6415ea34e55e9dfb28934','test_data_main_id','业务主表','varchar2(64)','String','testDataMain.id','0','1','1','1','0','0','=','input',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('696ec920de0e4f6387decc4bf577900c','e61380a6338745f493c2201947d3f2db','create_by','创建者','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,260,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('6e43b2195ac946d4863f15dc0a97fa55','79ea565269e94290811466e2009d2069','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,60,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('6eb75a920785452789078c307f20d978','cc1aea94e07946ae8520485e8b5fd79c','stamp','时间戳','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,70,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('705ba1bc2a304c3f8bd6d4d0690da89a','79ea565269e94290811466e2009d2069','reqcontentcount','申请文件资料名称及数量','varchar(1024)','String','reqcontentcount','0','1','1','1','0','0','=','input','',NULL,280,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('716a39d0fd5448ad990ef33507c89ddf','ea5412a0e8214a6cb467071d3a4e8826','t1','备用1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,330,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('71ea4bc10d274911b405f3165fc1bb1a','aef6f1fc948f4c9ab1c1b780bc471cc2','area_id','归属区域','nvarchar2(64)','String','area.id|name','0','1','1','1','1','1','=','areaselect','',NULL,4,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('751704ce45ab48099296f6ef6b8a62f6','e61380a6338745f493c2201947d3f2db','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,270,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('7701199d82e4416eb0f5e4583352e9d7','79ea565269e94290811466e2009d2069','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','0','0','=','dateselect','',NULL,40,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('77a9893a57ee48cf88de9fe965644a3f','ea5412a0e8214a6cb467071d3a4e8826','zcjz','财产净值','float','Float','zcjz','0','1','1','1','0','0','=','input','',NULL,90,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('780bee8abd7c46038f5419c43ae170e6','05bebfc3649e47b3b30898052568e047','ydjbr','预定经办人','varchar(100)','String','ydjbr','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('79fb95c16eda4de285ae9be81fd8dab0','417e2601a3f84d409920e61f1d52237a','jjbfdh','仪器降级/报废申请单号','varchar(20)','String','jjbfdh','0','0','1','1','1','1','=','input','',NULL,20,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('7a13ae19f1c948dd91e13bc3cb9dea44','cc1aea94e07946ae8520485e8b5fd79c','t1','备用1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,80,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('7a1945ba6a7540d9816cfbf26f7ac94d','417e2601a3f84d409920e61f1d52237a','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('7a3f6d2fe84b4300bad09b1b30f6bb4f','05bebfc3649e47b3b30898052568e047','yjjysj1','预计借用时间-开始','datetime','java.util.Date','yjjysj1','0','1','1','1','1','1','between','dateselect','',NULL,40,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('7c834e1efb184f90ae628739aaedd130','4fac809a15704ca8a7d778d6b12b85e0','remarks','备注','varchar(100)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,80,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('7e5db2df128f4eb0b51fde5cd7536a4e','05bebfc3649e47b3b30898052568e047','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,260,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('7f871058d94c4d9a89084be7c9ce806d','6e05c389f3c6415ea34e55e9dfb28934','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('7fa17f6d135742e8aa86e73c7fdb97bd','f4a9dc141b664cf999a76180f4b1e688','update_by','更新者','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,220,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('813b5764cbac4b388d9c2d667d7a6612','b2201709121d48959d37bf782bb2a836','filearchivedate','文件资料归档日期','date','java.util.Date','filearchivedate','0','1','1','1','0','0','=','dateselect','',NULL,170,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('81cf15e588734ea4a4ea34f6f1932c8c','05bebfc3649e47b3b30898052568e047','approval_advice','审批意见','varchar(200)','String','approvalAdvice','0','1','1','1','0','0','=','input','',NULL,70,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('8450c975f2e04da1a6a27cc92a7c1de9','f4a9dc141b664cf999a76180f4b1e688','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,210,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('849ef405385748d9a7d1e2baf8993780','ea5412a0e8214a6cb467071d3a4e8826','stamp','时间戳','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,320,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('8556402e28b34ede8205aeb5635a6beb','31aa87eed12f41ec8a5f5c06522b3ff1','t3','备用3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,130,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('85874b2a4c59441f8803dca567fbc960','f4a9dc141b664cf999a76180f4b1e688','create_by','创建者','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,200,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('8646e48e322c475583ff4c22b966c65a','e61380a6338745f493c2201947d3f2db','wxsqdh','仪器维修申请单号','varchar(20)','String','wxsqdh','0','0','1','1','1','1','=','input','',NULL,210,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('8713ae3250aa4197a16c585dbc52359b','79ea565269e94290811466e2009d2069','reqdepartment','申请借阅部门','varchar(128)','String','reqdepartment','0','1','1','1','1','0','=','input','',NULL,130,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('873c6ddd0ca2469d9a087f55161fc346','417e2601a3f84d409920e61f1d52237a','update_by','更新者','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,60,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('87b370094d2f42918e770a214a1a4e99','417e2601a3f84d409920e61f1d52237a','yq_no','仪器编号','varchar(30)','String','yqNo','0','0','1','1','1','1','=','input','',NULL,30,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('87c6e844307543029b3c9f3fc4511ae6','05bebfc3649e47b3b30898052568e047','yjjysj2','预计借用时间-结束','datetime','java.util.Date','yjjysj2','0','1','1','1','1','0','=','dateselect','',NULL,50,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('88431684da79426b99761e463970bc17','79ea565269e94290811466e2009d2069','reqname','申请人姓名','varchar(64)','String','reqname','0','1','1','1','1','1','like','input','',NULL,180,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('88f4ca21e3bc450097f159b5df4b4063','cc1aea94e07946ae8520485e8b5fd79c','update_by','更新者','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,30,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('89cb8ec0078e48c09864ffc3f6a15662','e61380a6338745f493c2201947d3f2db','yjsynx','预计使用年限','int(11)','Integer','yjsynx','0','1','1','1','0','0','=','input','',NULL,90,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('8b48774cfe184913b8b5eb17639cf12d','43d6d5acffa14c258340ce6765e46c6f','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b4b5ab14ece45adac263ff3775c63c4','e61380a6338745f493c2201947d3f2db','control_no','控制编号','varchar(30)','String','controlNo','0','1','1','1','0','0','=','input','',NULL,20,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('8b7cf0525519474ebe1de9e587eb7067','6e05c389f3c6415ea34e55e9dfb28934','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b9de88df53e485d8ef461c4b1824bc1','43d6d5acffa14c258340ce6765e46c6f','user_id','归属用户','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8da38dbe5fe54e9bb1f9682c27fbf403','aef6f1fc948f4c9ab1c1b780bc471cc2','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,12,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('8de218656ed7425ab3326ee8e23cb681','417e2601a3f84d409920e61f1d52237a','stamp','时间戳','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,100,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('90454f858f59474c802b353343a7951b','79ea565269e94290811466e2009d2069','revertrecheckdate','归还执行日期','date','java.util.Date','revertrecheckdate','0','1','1','1','0','0','=','dateselect','',NULL,260,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('921872d40f4a40ec8830c546b1673553','b2201709121d48959d37bf782bb2a836','filestandard','图书标准名称','varchar(128)','String','filestandard','0','1','1','1','1','1','like','input','',NULL,150,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('92481c16a0b94b0e8bba16c3c54eb1e4','f6e4dafaa72f4c509636484715f33a96','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('9337f20ff3e04808868f7992287b1ad2','ea5412a0e8214a6cb467071d3a4e8826','t2','备用2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,340,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('9588b5ce8d584d6a80a308bf545aae96','ea5412a0e8214a6cb467071d3a4e8826','apply_date','申请日期','date','java.util.Date','applyDate','0','1','1','1','1','0','=','dateselect','',NULL,150,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('96b91f57ec464ad7b302d29bb348304c','ea5412a0e8214a6cb467071d3a4e8826','wxsqdh','仪器维修申请单号','varchar(20)','String','wxsqdh','0','0','1','1','1','1','=','input','',NULL,160,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('976341acaf0443f1bdb5a0fa4da967ed','ea5412a0e8214a6cb467071d3a4e8826','t3','备用3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,350,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('9902c5cd8c494e2c9dfb293b16d6816e','b2201709121d48959d37bf782bb2a836','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,50,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('991a57079e2a4b8c9a09f226e65aac52','31aa87eed12f41ec8a5f5c06522b3ff1','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('9a012c1d2f934dbf996679adb7cc827a','f6e4dafaa72f4c509636484715f33a96','parent_id','父级编号','varchar2(64)','This','parent.id|name','0','0','1','1','0','0','=','treeselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('9ae29e090f4c48a48e3559b2dcf08e5f','f4a9dc141b664cf999a76180f4b1e688','stamp','时间戳','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,260,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('9b819d448b3e4a2ea211ca50d1f17488','4fac809a15704ca8a7d778d6b12b85e0','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,70,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('9b81e899b99e4aef8be013a8dc8c5794','e61380a6338745f493c2201947d3f2db','remarks','备注','varchar(100)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,300,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('9c098cff934246728179616b3346c0a8','e61380a6338745f493c2201947d3f2db','factory','生产厂家','varchar(60)','String','factory','0','1','1','1','0','0','=','input','',NULL,70,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('9e3677ad93434c079c23b1bd39d41627','05bebfc3649e47b3b30898052568e047','ghrq','归还日期','date','java.util.Date','ghrq','0','1','1','1','1','0','=','dateselect','',NULL,190,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('9f0e2e52fb384b8b9f3d11f08a891c21','cc1aea94e07946ae8520485e8b5fd79c','t2','备用2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,90,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('a0572a24db1b48208a41bc2e3ccb083f','31aa87eed12f41ec8a5f5c06522b3ff1','yq_no','仪器编号','varchar(30)','String','yqNo','0','0','1','1','1','1','=','input','',NULL,30,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('a228518927f04bedb8eb5a9f095fc769','79ea565269e94290811466e2009d2069','fileborrowstatus','文件资料借阅状态','int(11)','Integer','fileborrowstatus','0','1','1','1','1','0','=','input','',NULL,120,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('a3f01f8dc05f4976875bf80d3b3fb647','4fac809a15704ca8a7d778d6b12b85e0','stamp','时间戳','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,100,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('a4cd15b9cc004b409e844583bb1a9009','e61380a6338745f493c2201947d3f2db','ytzj','已提折旧','float','Float','ytzj','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('a526f5f55f484d3c8dbdcefc4007272b','7786840d0d84431d935d1e473daa06d9','id','id','int(11)','Integer','id','1','0','1','0','1','0','=','input','',NULL,20,'1','2015-06-04 10:08:41','1','2015-06-04 10:08:41',NULL,'0'),('a5bf757c291e4dbd9692a9d0c50dafe4','b2201709121d48959d37bf782bb2a836','id','ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,130,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('a6546e0da9ec4788abaf142e1193dc07','ea5412a0e8214a6cb467071d3a4e8826','czrq','操作日期','date','java.util.Date','czrq','0','1','1','1','0','0','=','dateselect','',NULL,220,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('a744b19b832a46a78f4506d7776e1cf7','e61380a6338745f493c2201947d3f2db','approval_advice','审批意见','varchar(200)','String','approvalAdvice','0','1','1','1','0','0','=','input','',NULL,160,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('a7bf04e10d5d42adb15af256e9aecc16','ea5412a0e8214a6cb467071d3a4e8826','spr','审批人','varchar(30)','String','spr','0','1','1','1','0','0','=','input','',NULL,190,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('a916157372be4e93825a777e8c9341c9','ea5412a0e8214a6cb467071d3a4e8826','euip_no','表号','varchar(30)','String','euipNo','0','1','1','1','1','0','=','input','',NULL,40,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('a9382e2c0fc84dd3a40f362b4c3a0021','79ea565269e94290811466e2009d2069','reqreason','申请借阅原因','varchar(256)','String','reqreason','0','1','1','1','0','0','=','input','',NULL,190,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('aaac2740f7e64164b0c685a5d95f71e8','79ea565269e94290811466e2009d2069','borrowrecheck','借阅复核人','varchar(64)','String','borrowrecheck','0','1','1','1','0','0','=','input','',NULL,220,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('aaf7bdfb98a04e4ba0a8a968b11753d6','05bebfc3649e47b3b30898052568e047','pzrq','批准日期','date','java.util.Date','pzrq','0','1','1','1','0','0','=','dateselect','',NULL,90,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('ac8143c8748c4638a76df57bb7b5831f','05bebfc3649e47b3b30898052568e047','jcjbr','借出经办人','varchar(200)','String','jcjbr','0','1','1','1','0','0','=','input','',NULL,140,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('acca4749bfbc4a768adf42cc7292fb8f','4fac809a15704ca8a7d778d6b12b85e0','t2','备用2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('accf87fb39a04e8eba4bce7084e0ce5f','ea5412a0e8214a6cb467071d3a4e8826','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,270,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('ad2443b790884e489eec153eb579be44','417e2601a3f84d409920e61f1d52237a','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,50,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('ad2c679089ce4263a0374695185166f3','4fac809a15704ca8a7d778d6b12b85e0','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,90,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('ad3bf0d4b44b4528a5211a66af88f322','aef6f1fc948f4c9ab1c1b780bc471cc2','office_id','归属部门','varchar2(64)','String','office.id|name','0','1','1','1','1','1','=','officeselect','',NULL,3,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('ad813f722efd4a05887c88b5084d3ec9','cc1aea94e07946ae8520485e8b5fd79c','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,50,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('aedf8563248d4a92bdbee687052781b4','05bebfc3649e47b3b30898052568e047','ydrq','预定日期','date','java.util.Date','ydrq','0','1','1','1','1','0','=','dateselect','',NULL,130,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('b0a3192ee11c4d3fb2fd2a39f2eebb10','4fac809a15704ca8a7d778d6b12b85e0','t1','备用1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('b3665bfd1b7d4724bd507c95a22b2562','e61380a6338745f493c2201947d3f2db','sig_date','审批日期','date','java.util.Date','sigDate','0','1','1','1','0','0','=','dateselect','',NULL,180,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('b45d2f567b994066a3cda453aeeba049','f4a9dc141b664cf999a76180f4b1e688','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,250,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('b467e85476f74358b249de3824d96228','f4a9dc141b664cf999a76180f4b1e688','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('b577b0bc23dc4a96b03ac0875137cf40','ea5412a0e8214a6cb467071d3a4e8826','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,290,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('b643a16ce7d442d4a48bb1efd62fe9b2','b2201709121d48959d37bf782bb2a836','filecontrolid','文件资料控制编号','varchar(64)','String','filecontrolid','0','1','1','1','1','1','like','input','',NULL,140,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('b66aa05da4b64493bc1d9354e3eff2e7','05bebfc3649e47b3b30898052568e047','ghfhr','归还复核人','varchar(200)','String','ghfhr','0','1','1','1','0','0','=','input','',NULL,180,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('b71a3a12f48641dd89bc82a4b22cb440','ea5412a0e8214a6cb467071d3a4e8826','spyj','审批意见','varchar(200)','String','spyj','0','1','1','1','0','0','=','input','',NULL,200,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('b856ad3fb2744e7683fce6775d2b7363','f4a9dc141b664cf999a76180f4b1e688','factory','生产厂家','varchar(60)','String','factory','0','1','1','1','1','0','=','input','',NULL,30,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('b95e2f94bc27409f9249e1980c261ea0','e61380a6338745f493c2201947d3f2db','czrq','操作日期','date','java.util.Date','czrq','0','1','1','1','0','0','=','dateselect','',NULL,250,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('ba8219bc166b4aaf82fd67cf9140bd14','31aa87eed12f41ec8a5f5c06522b3ff1','t1','备用1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('bab5e859cc46491289c578ea24756225','b2201709121d48959d37bf782bb2a836','update_by','更新者','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,30,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('bb1256a8d1b741f6936d8fed06f45eed','f6e4dafaa72f4c509636484715f33a96','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('bb360419878f4ed79a110b84c03ee36e','417e2601a3f84d409920e61f1d52237a','t1','备用1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,110,'1','2015-06-16 15:56:49','1','2015-06-16 15:56:49',NULL,'0'),('bc4ca2c5c4ba4f9a9665acdff11fb256','05bebfc3649e47b3b30898052568e047','update_by','更新者','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,230,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('be9ffd4c861242db87b9836a8b94b517','ea5412a0e8214a6cb467071d3a4e8826','factory','生产厂家','varchar(60)','String','factory','0','1','1','1','1','0','=','input','',NULL,50,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('bf29eebdb1fe49e8a29432110fb5a453','e61380a6338745f493c2201947d3f2db','zcyz','财产原值','float','Float','zcyz','0','1','1','1','0','0','=','input','',NULL,100,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('c5463da128354a45b7f4e3eeac31d4ab','e61380a6338745f493c2201947d3f2db','sjshnx','实际使用年限','int(11)','Integer','sjshnx','0','1','1','1','0','0','=','input','',NULL,230,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('c6cb14246ca24469908977d52c71de24','ea5412a0e8214a6cb467071d3a4e8826','ghjbr','归还经办人','varchar(30)','String','ghjbr','0','1','1','1','0','0','=','input','',NULL,230,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('c6d63773858941cb891e67fdd0f6956a','e61380a6338745f493c2201947d3f2db','jbr','经办人','varchar(30)','String','jbr','0','1','1','1','0','0','=','input','',NULL,240,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('c7f7438374734768834895a474c68f89','4fac809a15704ca8a7d778d6b12b85e0','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('ca68a2d403f0449cbaa1d54198c6f350','43d6d5acffa14c258340ce6765e46c6f','office_id','归属部门','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','0','0','=','officeselect',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cb51d7c682f64b15b33c0c0b47c4f0ea','e61380a6338745f493c2201947d3f2db','made_date','生产日期','date','java.util.Date','madeDate','0','1','1','1','0','0','=','dateselect','',NULL,80,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('cb9c0ec3da26432d9cbac05ede0fd1d0','43d6d5acffa14c258340ce6765e46c6f','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,12,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cc73478365b647ff9a0111ae8229faca','ea5412a0e8214a6cb467071d3a4e8826','dqzt','当前状态','varchar(30)','String','dqzt','0','0','1','1','0','1','=','input','',NULL,170,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('ccba1e24a04c4e11b3ee90f8b3c2e039','7786840d0d84431d935d1e473daa06d9','c1','c1','blob','String','c1','0','1','1','1','1','0','=','input','',NULL,10,'1','2015-06-04 10:08:41','1','2015-06-04 10:08:41',NULL,'0'),('cd111644c5564e74abbcadfa54232a39','05bebfc3649e47b3b30898052568e047','dqzt','当前状态','varchar(30)','String','dqzt','0','0','1','1','0','0','=','input','',NULL,200,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('ce49b9a4380947ffb77562878f866ef5','f4a9dc141b664cf999a76180f4b1e688','ytzj','已提折旧','float','Float','ytzj','0','1','1','1','0','0','=','input','',NULL,140,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('cfcfa06ea61749c9b4c4dbc507e0e580','f6e4dafaa72f4c509636484715f33a96','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('d0db576beb3e44debc5d292be3df0f59','05bebfc3649e47b3b30898052568e047','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('d1669e6f2e5c470e84ae9574af38e908','05bebfc3649e47b3b30898052568e047','ghjbr','归还经办人','varchar(200)','String','ghjbr','0','1','1','1','0','0','=','input','',NULL,170,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('d27c318d3c8c4a059a55f6cf77dcba33','ea5412a0e8214a6cb467071d3a4e8826','ghfhr','归还复核人','varchar(30)','String','ghfhr','0','1','1','1','0','0','=','input','',NULL,240,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('d546d5dba9ce4c4f9bda99a0ac40ba45','ea5412a0e8214a6cb467071d3a4e8826','update_by','更新者','varchar(64)','labs.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,280,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('d5c2d932ae904aa8a9f9ef34cd36fb0b','43d6d5acffa14c258340ce6765e46c6f','sex','性别','char(1)','String','sex','0','1','1','1','0','1','=','select','sex',NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('d74c3f55edfd45dea37d3f69f741a048','f4a9dc141b664cf999a76180f4b1e688','control_no','控制编号','varchar(30)','String','controlNo','0','1','1','1','0','0','=','input','',NULL,20,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('d8c2f766498544d7a460d0892833d9b5','e61380a6338745f493c2201947d3f2db','t1','备用1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,330,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('d8c45d8dbc2843ea975a5024f44e5095','cc1aea94e07946ae8520485e8b5fd79c','borrowid','文件资料借阅编号','varchar(64)','String','borrowid','0','1','1','1','1','1','=','input','',NULL,130,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('d941b85de680482faec34cfbb8c1fc0e','79ea565269e94290811466e2009d2069','create_by','创建者','varchar(64)','labs.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,10,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('e3ad58153cce4e4792121885690e9402','31aa87eed12f41ec8a5f5c06522b3ff1','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,70,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('e5687d12f4524fb6ba5cef91eedb7da6','31aa87eed12f41ec8a5f5c06522b3ff1','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,50,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('e5c6e728a64e4718a199bf4594592025','ea5412a0e8214a6cb467071d3a4e8826','jbr','经办人','varchar(30)','String','jbr','0','1','1','1','0','0','=','input','',NULL,210,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('e602ffde42b7457182e75479b6d55e3e','cc1aea94e07946ae8520485e8b5fd79c','t3','备用3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,100,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('e64050a2ebf041faa16f12dda5dcf784','6e05c389f3c6415ea34e55e9dfb28934','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e6935c77bb1a4d16ae7f38078a22202d','79ea565269e94290811466e2009d2069','id','ID','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,270,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('e84ff9e8d12241969dd71d9098f56a5b','31aa87eed12f41ec8a5f5c06522b3ff1','t2','备用2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,120,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('e8ace0e340b24628ad06700af7c4a82b','79ea565269e94290811466e2009d2069','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','0','0','=','textarea','',NULL,50,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('e8d11127952d4aa288bb3901fc83127f','43d6d5acffa14c258340ce6765e46c6f','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e976ae1d71894a85ac86d51f819c5270','b2201709121d48959d37bf782bb2a836','t3','备用3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,100,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('ea1d0bd4777a4cf8b580336347b08907','f4a9dc141b664cf999a76180f4b1e688','accepted_date','验收日期','date','java.util.Date','acceptedDate','0','1','1','1','0','0','=','dateselect','',NULL,60,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('ea9ebf77931c4684b339647875a5ce28','e61380a6338745f493c2201947d3f2db','filled_date','申请日期','date','java.util.Date','filledDate','0','1','1','1','1','0','=','dateselect','',NULL,200,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('eaf58f49768c41f3ad83115424031a87','79ea565269e94290811466e2009d2069','reqstartdate','预计申请开始日期','date','java.util.Date','reqstartdate','0','1','1','1','1','0','=','dateselect','',NULL,140,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('eb2e5afd13f147a990d30e68e7f64e12','aef6f1fc948f4c9ab1c1b780bc471cc2','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,11,'1','2013-08-12 13:10:05','1','2015-05-27 09:32:17',NULL,'0'),('ebe4bd9520314cfb9a8ae2bbd0dcf0ad','ea5412a0e8214a6cb467071d3a4e8826','use_date','投入使用日期','date','java.util.Date','useDate','0','1','1','1','1','0','=','dateselect','',NULL,70,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('ed5204a9901a450dba875deb44a622d0','05bebfc3649e47b3b30898052568e047','applicant','申请人','varchar(20)','String','applicant','0','1','1','1','1','0','=','input','',NULL,30,'1','2015-06-01 17:13:35','1','2015-06-01 17:13:35',NULL,'0'),('ee8a465ef49d49e9acda74c622ea1e01','79ea565269e94290811466e2009d2069','fileborrowid','文件资料借阅单号','varchar(64)','String','fileborrowid','0','1','1','1','1','1','like','input','',NULL,110,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('ef25413501c94a2c9519ad16f4db02f5','f4a9dc141b664cf999a76180f4b1e688','t3','备用3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,290,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('ef52c5c2fb55423fba10f65feeb823ae','05bebfc3649e47b3b30898052568e047','t1','备用1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,280,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('f281fe14652b48b4bde7cc48ef19de33','4fac809a15704ca8a7d778d6b12b85e0','jjbfdh','仪器降级/报废申请单号','varchar(20)','String','jjbfdh','0','0','1','1','1','0','=','input','',NULL,20,'1','2015-06-14 15:03:03','1','2015-06-14 15:03:03',NULL,'0'),('f3b18afdf19d4eab81af69355288a0ca','e61380a6338745f493c2201947d3f2db','factory_no','出厂编号','varchar(30)','String','factoryNo','0','1','1','1','0','0','=','input','',NULL,50,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('f5974f524d3c4d9d851ae9a67387eadd','31aa87eed12f41ec8a5f5c06522b3ff1','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,90,'1','2015-06-16 15:56:29','1','2015-06-16 15:56:29',NULL,'0'),('f5bcbf7cdeb64a9f891ce6472e799a69','cc1aea94e07946ae8520485e8b5fd79c','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,60,'1','2015-05-30 16:29:40','1','2015-05-30 16:29:40',NULL,'0'),('f5ed8c82bad0413fbfcccefa95931358','f6e4dafaa72f4c509636484715f33a96','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('f8b0b2cccc79498fb10b4f4c4f8f49d7','ea5412a0e8214a6cb467071d3a4e8826','ghrq','归还日期','date','java.util.Date','ghrq','0','1','1','1','0','0','=','dateselect','',NULL,250,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('f90400186f0046578afc8ae0442019f3','ea5412a0e8214a6cb467071d3a4e8826','id','主键','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2015-06-17 16:17:37','1','2015-06-17 16:17:37',NULL,'0'),('f966aead5fae4a37b8ac6765a8574b50','e61380a6338745f493c2201947d3f2db','stamp','时间戳','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,320,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('f9ff49fad9f541baa332224dac464abd','05bebfc3649e47b3b30898052568e047','t2','备用2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,290,'1','2015-06-01 17:13:36','1','2015-06-01 17:13:36',NULL,'0'),('fab66f75605c4c348e9f1206a76feefb','e61380a6338745f493c2201947d3f2db','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,290,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0'),('fb3a8860c30343b4ad2a54e6343cde70','79ea565269e94290811466e2009d2069','t3','备用3','decimal(10,0)','java.math.BigDecimal','t3','0','1','1','1','0','0','=','input','',NULL,100,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('fb5c524609324f61ba2f06cfce9c5301','b2201709121d48959d37bf782bb2a836','placeaddress','目前存在地点','varchar(256)','String','placeaddress','0','1','1','1','0','0','=','input','',NULL,190,'1','2015-05-30 16:25:37','1','2015-05-30 16:25:37',NULL,'0'),('fbb48d33ac8c4c758c7835e011d42a44','79ea565269e94290811466e2009d2069','stamp','时间戳','timestamp','java.sql.Timestamp','stamp','0','0','1','1','0','0','=','input','',NULL,70,'1','2015-05-30 16:28:31','1','2015-05-30 16:28:31',NULL,'0'),('fd00d99949a34a93a29e2eae8e2c9356','f4a9dc141b664cf999a76180f4b1e688','t2','备用2','varchar(40)','String','t2','0','1','1','1','0','0','=','input','',NULL,280,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('fe18236252454825b171cd6d2952c738','f4a9dc141b664cf999a76180f4b1e688','t1','备用1','varchar(20)','String','t1','0','1','1','1','0','0','=','input','',NULL,270,'1','2015-05-27 14:52:05','1','2015-05-27 16:54:58',NULL,'0'),('ff99786f0b074892b56a9734f132f512','e61380a6338745f493c2201947d3f2db','jdxzyj','鉴定小组意见','varchar(200)','String','jdxzyj','0','1','1','1','0','0','=','input','',NULL,150,'1','2015-06-15 10:50:07','1','2015-06-15 10:50:07',NULL,'0');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_template`
--

DROP TABLE IF EXISTS `gen_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码模板表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_template`
--

LOCK TABLES `gen_template` WRITE;
/*!40000 ALTER TABLE `gen_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_accept_record`
--

DROP TABLE IF EXISTS `lab_accept_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_accept_record` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) NOT NULL COMMENT '控制编号',
  `equip_name` varchar(60) NOT NULL COMMENT '设备名称',
  `equip_type` varchar(20) NOT NULL COMMENT '型号',
  `factory_no` varchar(30) DEFAULT NULL COMMENT '出厂编号',
  `factory_date` date DEFAULT NULL COMMENT '出厂日期',
  `supplier` varbinary(40) NOT NULL COMMENT '供应商名称',
  `received_date` date DEFAULT NULL COMMENT '到货日期',
  `accepted_date` date DEFAULT NULL COMMENT '验收日期',
  `accepted_state` varchar(10) DEFAULT NULL COMMENT '收货时状态',
  `yjsynx` int(11) DEFAULT NULL COMMENT '预计使用年限',
  `zcyz` float DEFAULT NULL COMMENT '财产原值',
  `euip_no` varchar(30) DEFAULT NULL COMMENT '表号',
  `accept_advice` varbinary(200) DEFAULT NULL COMMENT '验收意见',
  `accepter` varchar(20) DEFAULT NULL COMMENT '验收人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备消耗性材料验收记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_accept_record`
--

LOCK TABLES `lab_accept_record` WRITE;
/*!40000 ALTER TABLE `lab_accept_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_accept_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_accept_record_detail`
--

DROP TABLE IF EXISTS `lab_accept_record_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_accept_record_detail` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父级编号',
  `accept_item` varchar(100) DEFAULT NULL COMMENT '验收内容',
  `accept_doc` varchar(100) DEFAULT NULL COMMENT '装箱单/合同',
  `accept_on_spot` varchar(100) DEFAULT NULL COMMENT '现场验收 ',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备消耗性材料验收记录明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_accept_record_detail`
--

LOCK TABLES `lab_accept_record_detail` WRITE;
/*!40000 ALTER TABLE `lab_accept_record_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_accept_record_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_borrow_request`
--

DROP TABLE IF EXISTS `lab_borrow_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_borrow_request` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `jybm` varchar(60) DEFAULT NULL COMMENT '借用部门',
  `applicant` varchar(20) DEFAULT NULL COMMENT '申请人',
  `yjjysj1` datetime DEFAULT NULL COMMENT '预计借用时间-开始',
  `yjjysj2` datetime DEFAULT NULL COMMENT '预计借用时间-结束',
  `syly` varchar(200) DEFAULT NULL COMMENT '使用理由',
  `approval_advice` varchar(200) DEFAULT NULL COMMENT '审批意见',
  `approved_by` varchar(20) DEFAULT NULL COMMENT '审批人',
  `pzrq` date DEFAULT NULL COMMENT '批准日期',
  `jydh` varchar(20) NOT NULL COMMENT '仪器设备借用申请单号',
  `sbjsl` varchar(200) DEFAULT NULL COMMENT '借用仪器设备名称及数量',
  `ydjbr` varchar(100) DEFAULT NULL COMMENT '预定经办人',
  `ydrq` datetime DEFAULT NULL COMMENT '预定日期',
  `jcjbr` varchar(200) DEFAULT NULL COMMENT '借出经办人',
  `jcfhr` varchar(200) DEFAULT NULL COMMENT '借出复核人',
  `jcrq` datetime DEFAULT NULL COMMENT '借出日期',
  `ghjbr` varchar(200) DEFAULT NULL COMMENT '归还经办人',
  `ghfhr` varchar(200) DEFAULT NULL COMMENT '归还复核人',
  `ghrq` datetime DEFAULT NULL COMMENT '归还日期',
  `dqzt` varchar(30) NOT NULL COMMENT '当前状态',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jydh` (`jydh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备借用申请单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_borrow_request`
--

LOCK TABLES `lab_borrow_request` WRITE;
/*!40000 ALTER TABLE `lab_borrow_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_borrow_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_borrow_request_and_baseinfo`
--

DROP TABLE IF EXISTS `lab_borrow_request_and_baseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_borrow_request_and_baseinfo` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `jjbfdh` varchar(20) NOT NULL COMMENT '仪器降级/报废申请单号',
  `yq_no` varchar(30) NOT NULL COMMENT '仪器编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备借用申请与仪器基础信息关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_borrow_request_and_baseinfo`
--

LOCK TABLES `lab_borrow_request_and_baseinfo` WRITE;
/*!40000 ALTER TABLE `lab_borrow_request_and_baseinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_borrow_request_and_baseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_borrow_request_detail`
--

DROP TABLE IF EXISTS `lab_borrow_request_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_borrow_request_detail` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `equip_name` varchar(60) DEFAULT NULL COMMENT '设备名称',
  `amt` int(11) DEFAULT NULL COMMENT '数量',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备借用申请单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_borrow_request_detail`
--

LOCK TABLES `lab_borrow_request_detail` WRITE;
/*!40000 ALTER TABLE `lab_borrow_request_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_borrow_request_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_plan`
--

DROP TABLE IF EXISTS `lab_check_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_plan` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) DEFAULT NULL COMMENT '控制编号',
  `jhhcts` int(11) DEFAULT NULL COMMENT '计划核查台数',
  `filled_by` varchar(20) DEFAULT NULL COMMENT '填表人',
  `approved_by` varchar(20) DEFAULT NULL COMMENT '批准人',
  `bzrq` date DEFAULT NULL COMMENT '编制日期',
  `final_appr_date` date DEFAULT NULL COMMENT '审批日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备期间核查计划';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_plan`
--

LOCK TABLES `lab_check_plan` WRITE;
/*!40000 ALTER TABLE `lab_check_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_plan_detail`
--

DROP TABLE IF EXISTS `lab_check_plan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_plan_detail` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父级编号',
  `sno` varchar(10) DEFAULT NULL COMMENT '序号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `equip_type` varchar(20) DEFAULT NULL COMMENT '型号',
  `euip_no` varchar(30) DEFAULT NULL COMMENT '表号',
  `scjdrq` date DEFAULT NULL COMMENT '上次检定日期',
  `jhjcrq` date DEFAULT NULL COMMENT '计划检查日期',
  `sjjcrq` date DEFAULT NULL COMMENT '实际检查日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备期间核查计划明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_plan_detail`
--

LOCK TABLES `lab_check_plan_detail` WRITE;
/*!40000 ALTER TABLE `lab_check_plan_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_plan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_record`
--

DROP TABLE IF EXISTS `lab_check_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_record` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `control_no` varchar(30) DEFAULT NULL COMMENT '控制编号',
  `equip_name` varchar(60) DEFAULT NULL COMMENT '设备名称',
  `check_date` date DEFAULT NULL COMMENT '核查日期',
  `equip_type` varchar(20) DEFAULT NULL COMMENT '型号',
  `euip_no` varchar(30) DEFAULT NULL COMMENT '表号',
  `hcff` varchar(200) DEFAULT NULL COMMENT '期间核查方法',
  `hcjg` varchar(200) DEFAULT NULL COMMENT '核查结果',
  `hcr` varchar(20) DEFAULT NULL COMMENT '核查人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备期间核查记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_record`
--

LOCK TABLES `lab_check_record` WRITE;
/*!40000 ALTER TABLE `lab_check_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_result`
--

DROP TABLE IF EXISTS `lab_check_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_result` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) DEFAULT NULL COMMENT '控制编号',
  `applicant` varchar(20) DEFAULT NULL COMMENT '申请人',
  `apply_date` date DEFAULT NULL COMMENT '申请日期',
  `approved_by` varchar(20) DEFAULT NULL COMMENT '批准人',
  `pzrq` date DEFAULT NULL COMMENT '批准日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备检定、校准计划、完成表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_result`
--

LOCK TABLES `lab_check_result` WRITE;
/*!40000 ALTER TABLE `lab_check_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_result_detail`
--

DROP TABLE IF EXISTS `lab_check_result_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_result_detail` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `sno` varchar(10) DEFAULT NULL COMMENT '序号',
  `manage_no` varchar(30) DEFAULT NULL COMMENT '管理号',
  `equip_name` varchar(60) DEFAULT NULL COMMENT '设备名称',
  `equip_type` varchar(20) DEFAULT NULL COMMENT '型号',
  `euip_no` varchar(30) DEFAULT NULL COMMENT '表号',
  `jdzq` varchar(6) DEFAULT NULL COMMENT '检定周期',
  `scjdrq` date DEFAULT NULL COMMENT '上次检定日期',
  `jhjcrq` date DEFAULT NULL COMMENT '计划检查日期',
  `sjjcrq` date DEFAULT NULL COMMENT '实际检查日期',
  `hcjg` varchar(200) DEFAULT NULL COMMENT '核查结果',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备检定、校准计划、完成明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_result_detail`
--

LOCK TABLES `lab_check_result_detail` WRITE;
/*!40000 ALTER TABLE `lab_check_result_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_result_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_check_review`
--

DROP TABLE IF EXISTS `lab_check_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_check_review` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) DEFAULT NULL COMMENT '控制编号',
  `jhhcts` int(11) DEFAULT NULL COMMENT '计划核查台数',
  `sjjcts` int(11) DEFAULT NULL COMMENT '实际核查台数',
  `ssqk` varchar(200) DEFAULT NULL COMMENT '实施情况',
  `psjl` varchar(200) DEFAULT NULL COMMENT '评审结论',
  `psry` varchar(20) DEFAULT NULL COMMENT '评审人员',
  `psrq` date DEFAULT NULL COMMENT '评审日期',
  `approval_advice` varchar(200) DEFAULT NULL COMMENT '审批意见',
  `signature` varchar(20) DEFAULT NULL COMMENT '主管生产副总经理签字',
  `sig_date` date DEFAULT NULL COMMENT '签字日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备期间核查评审表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_check_review`
--

LOCK TABLES `lab_check_review` WRITE;
/*!40000 ALTER TABLE `lab_check_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_check_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_analyses`
--

DROP TABLE IF EXISTS `lab_equipment_analyses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_analyses` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `equip_name` varchar(60) NOT NULL COMMENT '设备名称',
  `equip_type` varchar(20) NOT NULL COMMENT '型号',
  `product_name` varchar(60) DEFAULT NULL COMMENT '产品名称',
  `standard_no` varchar(20) DEFAULT NULL COMMENT '依据标准号',
  `sno` varchar(10) DEFAULT NULL COMMENT '序号',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `standard_clause` varchar(200) DEFAULT NULL COMMENT '标准条款',
  `tech_index` varchar(60) DEFAULT NULL COMMENT '技术指标',
  `ranges` varchar(60) DEFAULT NULL COMMENT '测量范围',
  `precisions` varchar(60) DEFAULT NULL COMMENT '扩展不确定度/最大允差/准确度',
  `is_match` varchar(10) DEFAULT NULL COMMENT '仪器设备符合规范否',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备能力分析表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_analyses`
--

LOCK TABLES `lab_equipment_analyses` WRITE;
/*!40000 ALTER TABLE `lab_equipment_analyses` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_analyses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_baseinfo`
--

DROP TABLE IF EXISTS `lab_equipment_baseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_baseinfo` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) DEFAULT NULL COMMENT '控制编号',
  `factory` varchar(60) DEFAULT NULL COMMENT '生产厂家',
  `equip_type` varchar(20) DEFAULT NULL COMMENT '型号',
  `factory_no` varchar(30) DEFAULT NULL COMMENT '出厂编号',
  `accepted_date` datetime DEFAULT NULL COMMENT '验收日期',
  `use_date` datetime DEFAULT NULL COMMENT '投入使用日期',
  `place` varchar(60) DEFAULT NULL COMMENT '目前放置地点',
  `accepted_state` varchar(10) DEFAULT NULL COMMENT '收货时状态',
  `fj` varchar(200) DEFAULT NULL COMMENT '附件',
  `sno` varchar(10) DEFAULT NULL COMMENT '序号',
  `euip_no` varchar(30) DEFAULT NULL COMMENT '表号',
  `zcyz` float DEFAULT NULL COMMENT '财产原值',
  `ytzj` float DEFAULT NULL COMMENT '已提折旧',
  `zcjz` float DEFAULT NULL COMMENT '财产净值',
  `yq_no` varchar(30) NOT NULL COMMENT '仪器编号',
  `sbshrq` datetime DEFAULT NULL COMMENT '设备收货日期',
  `dqzt` varchar(30) NOT NULL COMMENT '当前状态',
  `sbmc` varchar(200) NOT NULL COMMENT '仪器设备名称',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yq_no` (`yq_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器基本信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_baseinfo`
--

LOCK TABLES `lab_equipment_baseinfo` WRITE;
/*!40000 ALTER TABLE `lab_equipment_baseinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_baseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_borrow`
--

DROP TABLE IF EXISTS `lab_equipment_borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_borrow` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `jybm` varchar(60) DEFAULT NULL COMMENT '借用部门',
  `sy` varchar(200) DEFAULT NULL COMMENT '事由',
  `jbr` varchar(20) DEFAULT NULL COMMENT '借表人',
  `jsr` varchar(20) DEFAULT NULL COMMENT '经手人',
  `hbr` varchar(20) DEFAULT NULL COMMENT '还表人',
  `accepter` varchar(20) DEFAULT NULL COMMENT '验收人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪表工具借用清单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_borrow`
--

LOCK TABLES `lab_equipment_borrow` WRITE;
/*!40000 ALTER TABLE `lab_equipment_borrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_borrow_detail`
--

DROP TABLE IF EXISTS `lab_equipment_borrow_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_borrow_detail` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `equip_name` varchar(60) DEFAULT NULL COMMENT '设备名称',
  `equip_type` varchar(20) DEFAULT NULL COMMENT '型号',
  `euip_no` varchar(30) DEFAULT NULL COMMENT '表号',
  `fj` varchar(200) DEFAULT NULL COMMENT '附件',
  `lend_date` date DEFAULT NULL COMMENT '借出日期',
  `jczt` varchar(6) DEFAULT NULL COMMENT '借出状态',
  `ghrq` date DEFAULT NULL COMMENT '归还日期',
  `ghzt` varchar(6) DEFAULT NULL COMMENT '归还状态',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪表工具借用清单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_borrow_detail`
--

LOCK TABLES `lab_equipment_borrow_detail` WRITE;
/*!40000 ALTER TABLE `lab_equipment_borrow_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_borrow_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_exception`
--

DROP TABLE IF EXISTS `lab_equipment_exception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_exception` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `equip_name` varchar(60) DEFAULT NULL COMMENT '设备名称',
  `factory_no` varchar(30) DEFAULT NULL COMMENT '出厂编号',
  `sydd` varchar(60) DEFAULT NULL COMMENT '使用地点',
  `fxgzsj` datetime DEFAULT NULL COMMENT '发现故障时间',
  `gzgznr` varchar(200) DEFAULT NULL COMMENT '发现故障时正进行的工作内容',
  `gzxx` varchar(200) DEFAULT NULL COMMENT '故障现象',
  `jbr` varchar(20) DEFAULT NULL COMMENT '借表人',
  `syrq` date DEFAULT NULL COMMENT '使用日期',
  `gzhsqk` varchar(200) DEFAULT NULL COMMENT '故障核实情况',
  `xmfzr` varchar(20) DEFAULT NULL COMMENT '项目负责人',
  `sig_date` date DEFAULT NULL COMMENT '签字日期',
  `clyj` varchar(200) DEFAULT NULL COMMENT '处理意见',
  `jsfzr` varchar(20) DEFAULT NULL COMMENT '技术负责人',
  `c_date` date DEFAULT NULL COMMENT '日期',
  `jssj` datetime DEFAULT NULL COMMENT '仪表室接收时间',
  `ybgly` varchar(20) DEFAULT NULL COMMENT '仪表管理员',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备异常登记表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_exception`
--

LOCK TABLES `lab_equipment_exception` WRITE;
/*!40000 ALTER TABLE `lab_equipment_exception` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_exception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_resume`
--

DROP TABLE IF EXISTS `lab_equipment_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_resume` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) DEFAULT NULL COMMENT '控制编号',
  `factory` varchar(60) DEFAULT NULL COMMENT '生产厂家',
  `equip_type` varchar(20) DEFAULT NULL COMMENT '型号',
  `factory_no` varchar(30) DEFAULT NULL COMMENT '出厂编号',
  `accepted_date` date DEFAULT NULL COMMENT '验收日期',
  `use_date` date DEFAULT NULL COMMENT '投入使用日期',
  `place` varchar(60) DEFAULT NULL COMMENT '目前放置地点',
  `accepted_state` varchar(10) DEFAULT NULL COMMENT '收货时状态',
  `fj` varchar(200) DEFAULT NULL COMMENT '附件',
  `sno` varchar(10) DEFAULT NULL COMMENT '序号',
  `euip_no` varchar(30) DEFAULT NULL COMMENT '表号',
  `zcyz` float DEFAULT NULL COMMENT '财产原值',
  `ytzj` float DEFAULT NULL COMMENT '已提折旧',
  `zcjz` float DEFAULT NULL COMMENT '财产净值',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备履历卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_resume`
--

LOCK TABLES `lab_equipment_resume` WRITE;
/*!40000 ALTER TABLE `lab_equipment_resume` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_resume_detail`
--

DROP TABLE IF EXISTS `lab_equipment_resume_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_resume_detail` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `lend_date` date DEFAULT NULL COMMENT '借出日期',
  `sydw` varchar(60) DEFAULT NULL COMMENT '使用单位',
  `jsr` varchar(20) DEFAULT NULL COMMENT '经手人',
  `syly` varchar(200) DEFAULT NULL COMMENT '使用理由',
  `ybs_jsr` varchar(20) DEFAULT NULL COMMENT '仪表室经手人',
  `ghrq` date DEFAULT NULL COMMENT '归还日期',
  `ysjl` varchar(200) DEFAULT NULL COMMENT '验收记录',
  `accepter` varchar(20) DEFAULT NULL COMMENT '验收人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备履历卡明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_resume_detail`
--

LOCK TABLES `lab_equipment_resume_detail` WRITE;
/*!40000 ALTER TABLE `lab_equipment_resume_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_resume_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_transfer`
--

DROP TABLE IF EXISTS `lab_equipment_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_transfer` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `yjbm` varchar(60) DEFAULT NULL COMMENT '移交部门',
  `yjr` varchar(20) DEFAULT NULL COMMENT '移交人',
  `jsbm` varchar(200) DEFAULT NULL COMMENT '接收部门',
  `jsr` varchar(20) DEFAULT NULL COMMENT '接收人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备及工具移交清单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_transfer`
--

LOCK TABLES `lab_equipment_transfer` WRITE;
/*!40000 ALTER TABLE `lab_equipment_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_equipment_transfer_list`
--

DROP TABLE IF EXISTS `lab_equipment_transfer_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_equipment_transfer_list` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `equip_name` varchar(60) DEFAULT NULL COMMENT '设备名称',
  `equip_type` varchar(20) DEFAULT NULL COMMENT '型号',
  `euip_no` varchar(30) DEFAULT NULL COMMENT '表号',
  `fj` varchar(200) DEFAULT NULL COMMENT '附件',
  `yjrq` date DEFAULT NULL COMMENT '移交日期',
  `yjzt` varchar(6) DEFAULT NULL COMMENT '移交状态',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备及工具移交清单明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_equipment_transfer_list`
--

LOCK TABLES `lab_equipment_transfer_list` WRITE;
/*!40000 ALTER TABLE `lab_equipment_transfer_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_equipment_transfer_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_examine_clause`
--

DROP TABLE IF EXISTS `lab_examine_clause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_examine_clause` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) DEFAULT NULL COMMENT '控制编号',
  `filled_by` varchar(20) DEFAULT NULL COMMENT '填表人',
  `c_date` date DEFAULT NULL COMMENT '日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备送检要求说明表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_examine_clause`
--

LOCK TABLES `lab_examine_clause` WRITE;
/*!40000 ALTER TABLE `lab_examine_clause` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_examine_clause` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_examine_clause_detail`
--

DROP TABLE IF EXISTS `lab_examine_clause_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_examine_clause_detail` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父级编号',
  `sno` varchar(10) DEFAULT NULL COMMENT '序号',
  `equip_name` varchar(60) DEFAULT NULL COMMENT '设备名称',
  `equip_type` varchar(20) DEFAULT NULL COMMENT '型号',
  `jzxm` varchar(200) DEFAULT NULL COMMENT '校准项目',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备送检要求说明明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_examine_clause_detail`
--

LOCK TABLES `lab_examine_clause_detail` WRITE;
/*!40000 ALTER TABLE `lab_examine_clause_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_examine_clause_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_examine_reult`
--

DROP TABLE IF EXISTS `lab_examine_reult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_examine_reult` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) DEFAULT NULL COMMENT '控制编号',
  `filled_by` varchar(20) DEFAULT NULL COMMENT '填表人',
  `c_date` date DEFAULT NULL COMMENT '日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备完检结果确认记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_examine_reult`
--

LOCK TABLES `lab_examine_reult` WRITE;
/*!40000 ALTER TABLE `lab_examine_reult` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_examine_reult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_examine_reult_detail`
--

DROP TABLE IF EXISTS `lab_examine_reult_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_examine_reult_detail` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `parent_id` varchar(64) DEFAULT NULL COMMENT '父级编号',
  `sno` varchar(10) DEFAULT NULL COMMENT '序号',
  `equip_name` varchar(60) DEFAULT NULL COMMENT '设备名称',
  `equip_type` varchar(20) DEFAULT NULL COMMENT '型号',
  `euip_no` varchar(30) DEFAULT NULL COMMENT '表号',
  `zslx` varchar(60) DEFAULT NULL COMMENT '证书类型',
  `jbxxzqf` varchar(6) DEFAULT NULL COMMENT '基本信息正确否',
  `ybgly` varchar(20) NOT NULL COMMENT '仪器管理员',
  `c_date` date DEFAULT NULL COMMENT '日期',
  `mzjcff` varchar(6) DEFAULT NULL COMMENT '满足检测方法的要求否',
  `ztbz` varchar(6) DEFAULT NULL COMMENT '粘贴标识',
  `check_manager` varchar(20) DEFAULT NULL COMMENT '检测部门经理',
  `sig_date` date DEFAULT NULL COMMENT '签字日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仪器设备完检结果确认记录明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_examine_reult_detail`
--

LOCK TABLES `lab_examine_reult_detail` WRITE;
/*!40000 ALTER TABLE `lab_examine_reult_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_examine_reult_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_file_attributes`
--

DROP TABLE IF EXISTS `lab_file_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_file_attributes` (
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  `fileID` varchar(64) DEFAULT NULL COMMENT '文件资料ID',
  `fileName` varchar(256) DEFAULT NULL COMMENT '文件资料名称',
  `ID` varchar(64) NOT NULL COMMENT 'ID',
  `fileControlID` varchar(64) DEFAULT NULL COMMENT '文件资料控制编号',
  `fileStandard` varchar(128) DEFAULT NULL COMMENT '图书标准名称',
  `fileType` int(11) DEFAULT NULL COMMENT '文件资料类型',
  `fileArchiveDate` date DEFAULT NULL COMMENT '文件资料归档日期',
  `useDate` date DEFAULT NULL COMMENT '投入使用日期',
  `placeAddress` varchar(256) DEFAULT NULL COMMENT '目前存在地点',
  `fileStatus` int(11) DEFAULT NULL COMMENT '当前状态',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件资料属性';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_file_attributes`
--

LOCK TABLES `lab_file_attributes` WRITE;
/*!40000 ALTER TABLE `lab_file_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_file_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_file_borrow`
--

DROP TABLE IF EXISTS `lab_file_borrow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_file_borrow` (
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  `fileBorrowID` varchar(64) DEFAULT NULL COMMENT '文件资料借阅单号',
  `fileBorrowStatus` int(11) DEFAULT NULL COMMENT '文件资料借阅状态',
  `reqDepartment` varchar(128) DEFAULT NULL COMMENT '申请借阅部门',
  `reqStartDate` date DEFAULT NULL COMMENT '预计申请开始日期',
  `reqEndDate` date DEFAULT NULL COMMENT '预计申请截止日期',
  `approveName` varchar(64) DEFAULT NULL COMMENT '审批人姓名',
  `approveOpinion` varchar(256) DEFAULT NULL COMMENT '审批人意见',
  `reqName` varchar(64) DEFAULT NULL COMMENT '申请人姓名',
  `reqReason` varchar(256) DEFAULT NULL COMMENT '申请借阅原因',
  `approveDate` date DEFAULT NULL COMMENT '审批的日期',
  `borrowExecuter` varchar(64) DEFAULT NULL COMMENT '借阅经办人',
  `borrowRecheck` varchar(64) DEFAULT NULL COMMENT '借阅复核人',
  `borrowRecheckDate` date DEFAULT NULL COMMENT '借阅执行日期',
  `revertExecuter` varchar(64) DEFAULT NULL COMMENT '归还经办人',
  `revertRecheck` varchar(64) DEFAULT NULL COMMENT '归还复核人',
  `revertRecheckDate` date DEFAULT NULL COMMENT '归还执行日期',
  `ID` varchar(64) NOT NULL COMMENT 'ID',
  `reqContentCount` varchar(1024) DEFAULT NULL COMMENT '申请文件资料名称及数量',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件资料借用归还记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_file_borrow`
--

LOCK TABLES `lab_file_borrow` WRITE;
/*!40000 ALTER TABLE `lab_file_borrow` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_file_borrow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_file_borrow_relationship`
--

DROP TABLE IF EXISTS `lab_file_borrow_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_file_borrow_relationship` (
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  `ID` varchar(64) NOT NULL COMMENT 'ID',
  `fileID` varchar(64) DEFAULT NULL COMMENT '文件资料编号',
  `borrowID` varchar(64) DEFAULT NULL COMMENT '文件资料借阅编号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件资料与借用记录之间的关系';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_file_borrow_relationship`
--

LOCK TABLES `lab_file_borrow_relationship` WRITE;
/*!40000 ALTER TABLE `lab_file_borrow_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_file_borrow_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_provider_estimate`
--

DROP TABLE IF EXISTS `lab_provider_estimate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_provider_estimate` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) DEFAULT NULL COMMENT '控制编号',
  `supplier` varbinary(40) DEFAULT NULL COMMENT '供应商名称',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `tel` varchar(30) DEFAULT NULL COMMENT '电话',
  `zz` varchar(2) DEFAULT NULL COMMENT '资质',
  `zlbztx` varchar(2) DEFAULT NULL COMMENT '质量保证体系',
  `fwzl` varchar(2) DEFAULT NULL COMMENT '服务质量',
  `lxhtqk` varchar(2) DEFAULT NULL COMMENT '履行合同情况',
  `bzyszl` varchar(2) DEFAULT NULL COMMENT '包装运输质量',
  `shfw` varchar(2) DEFAULT NULL COMMENT '售后服务',
  `wxnl` varchar(2) DEFAULT NULL COMMENT '维修能力',
  `a1234` varchar(200) DEFAULT NULL COMMENT '备注信息',
  `pjjl` varchar(600) DEFAULT NULL COMMENT '评价结论',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务方供应商评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_provider_estimate`
--

LOCK TABLES `lab_provider_estimate` WRITE;
/*!40000 ALTER TABLE `lab_provider_estimate` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_provider_estimate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_purchase_plan`
--

DROP TABLE IF EXISTS `lab_purchase_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_purchase_plan` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) NOT NULL COMMENT '控制编号',
  `apply_dept` varchar(20) NOT NULL COMMENT '申报部门',
  `request_by` varchar(20) DEFAULT NULL COMMENT '申报人',
  `request_desc` varchar(200) DEFAULT NULL COMMENT '申报理由',
  `tech_approval` varchar(200) DEFAULT NULL COMMENT '技术主管审核意见',
  `tech_appr_date` date DEFAULT NULL COMMENT '审核日期',
  `final_approval` varchar(200) DEFAULT NULL COMMENT '最高管理者审批',
  `final_appr_date` date DEFAULT NULL COMMENT '审批日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备消耗性材料采购计划';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_purchase_plan`
--

LOCK TABLES `lab_purchase_plan` WRITE;
/*!40000 ALTER TABLE `lab_purchase_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_purchase_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_purchase_plan_detail`
--

DROP TABLE IF EXISTS `lab_purchase_plan_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_purchase_plan_detail` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `plan_id` varchar(64) NOT NULL COMMENT '采购计划ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `amt` int(11) DEFAULT NULL COMMENT '数量',
  `price` float DEFAULT NULL COMMENT '单价',
  `sum` float DEFAULT NULL COMMENT '合价',
  `operate_clause` varchar(200) DEFAULT NULL COMMENT '使用要求',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备消耗性材料采购计划明细';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_purchase_plan_detail`
--

LOCK TABLES `lab_purchase_plan_detail` WRITE;
/*!40000 ALTER TABLE `lab_purchase_plan_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_purchase_plan_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_repair_request`
--

DROP TABLE IF EXISTS `lab_repair_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_repair_request` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) DEFAULT NULL COMMENT '控制编号',
  `equip_type` varchar(20) DEFAULT NULL COMMENT '型号',
  `euip_no` varchar(30) DEFAULT NULL COMMENT '表号',
  `factory` varchar(60) DEFAULT NULL COMMENT '生产厂家',
  `factory_date` date DEFAULT NULL COMMENT '出厂日期',
  `use_date` date DEFAULT NULL COMMENT '投入使用日期',
  `zcyz` float DEFAULT NULL COMMENT '财产原值',
  `zcjz` float DEFAULT NULL COMMENT '财产净值',
  `mcwxrq` date DEFAULT NULL COMMENT '末次维修日期',
  `wxly` varchar(200) DEFAULT NULL COMMENT '维修理由',
  `yjfxfy` varchar(100) DEFAULT NULL COMMENT '预计维修费用',
  `sig_date` date DEFAULT NULL COMMENT '审批日期',
  `applicant` varchar(20) DEFAULT NULL COMMENT '申请人',
  `apply_date` date DEFAULT NULL COMMENT '申请日期',
  `wxsqdh` varchar(20) NOT NULL COMMENT '仪器维修申请单号',
  `dqzt` varchar(30) NOT NULL COMMENT '当前状态',
  `sbmc` varchar(100) DEFAULT NULL COMMENT '仪器设备名称',
  `spr` varchar(30) DEFAULT NULL COMMENT '审批人',
  `spyj` varchar(200) DEFAULT NULL COMMENT '审批意见',
  `jbr` varchar(30) DEFAULT NULL COMMENT '经办人',
  `czrq` date DEFAULT NULL COMMENT '操作日期',
  `ghjbr` varchar(30) DEFAULT NULL COMMENT '归还经办人',
  `ghfhr` varchar(30) DEFAULT NULL COMMENT '归还复核人',
  `ghrq` date DEFAULT NULL COMMENT '归还日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wxsqdh` (`wxsqdh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备维修申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_repair_request`
--

LOCK TABLES `lab_repair_request` WRITE;
/*!40000 ALTER TABLE `lab_repair_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_repair_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_repair_request_and_baseinfo`
--

DROP TABLE IF EXISTS `lab_repair_request_and_baseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_repair_request_and_baseinfo` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `wxsqdh` varchar(20) NOT NULL COMMENT '仪器维修申请单号',
  `yq_no` varchar(30) NOT NULL COMMENT '仪器编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备维修申请与仪器基础信息关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_repair_request_and_baseinfo`
--

LOCK TABLES `lab_repair_request_and_baseinfo` WRITE;
/*!40000 ALTER TABLE `lab_repair_request_and_baseinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_repair_request_and_baseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_scrap_apply`
--

DROP TABLE IF EXISTS `lab_scrap_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_scrap_apply` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `control_no` varchar(30) DEFAULT NULL COMMENT '控制编号',
  `equip_name` varchar(60) DEFAULT NULL COMMENT '设备名称',
  `equip_type` varchar(20) DEFAULT NULL COMMENT '型号',
  `factory_no` varchar(30) DEFAULT NULL COMMENT '出厂编号',
  `amt` int(11) DEFAULT NULL COMMENT '数量',
  `factory` varchar(60) DEFAULT NULL COMMENT '生产厂家',
  `made_date` date DEFAULT NULL COMMENT '生产日期',
  `yjsynx` int(11) DEFAULT NULL COMMENT '预计使用年限',
  `zcyz` float DEFAULT NULL COMMENT '财产原值',
  `ytzj` float DEFAULT NULL COMMENT '已提折旧',
  `yjzccz` float DEFAULT NULL COMMENT '预计净残值',
  `wxly` varchar(200) DEFAULT NULL COMMENT '维修理由',
  `jjbfly` varchar(200) DEFAULT NULL COMMENT '降级报废理由',
  `jdxzyj` varchar(200) DEFAULT NULL COMMENT '鉴定小组意见',
  `approval_advice` varchar(200) DEFAULT NULL COMMENT '审批意见',
  `approved_by` varchar(20) DEFAULT NULL COMMENT '审批人',
  `sig_date` date DEFAULT NULL COMMENT '审批日期',
  `filled_by` varchar(20) DEFAULT NULL COMMENT '申请人',
  `filled_date` date DEFAULT NULL COMMENT '申请日期',
  `wxsqdh` varchar(20) NOT NULL COMMENT '仪器维修申请单号',
  `dqzt` varchar(30) NOT NULL COMMENT '当前状态',
  `sjshnx` int(11) DEFAULT NULL COMMENT '实际使用年限',
  `jbr` varchar(30) DEFAULT NULL COMMENT '经办人',
  `czrq` date DEFAULT NULL COMMENT '操作日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `wxsqdh` (`wxsqdh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备降级/报废申请表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_scrap_apply`
--

LOCK TABLES `lab_scrap_apply` WRITE;
/*!40000 ALTER TABLE `lab_scrap_apply` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_scrap_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_scrap_apply_and_baseinfo`
--

DROP TABLE IF EXISTS `lab_scrap_apply_and_baseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_scrap_apply_and_baseinfo` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `jjbfdh` varchar(20) NOT NULL COMMENT '仪器降级/报废申请单号',
  `yq_no` varchar(30) NOT NULL COMMENT '仪器编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备降级/报废申请与仪器基础信息关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_scrap_apply_and_baseinfo`
--

LOCK TABLES `lab_scrap_apply_and_baseinfo` WRITE;
/*!40000 ALTER TABLE `lab_scrap_apply_and_baseinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_scrap_apply_and_baseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_leave`
--

DROP TABLE IF EXISTS `oa_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_leave` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假流程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_leave`
--

LOCK TABLES `oa_leave` WRITE;
/*!40000 ALTER TABLE `oa_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_notify`
--

DROP TABLE IF EXISTS `oa_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_notify` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT NULL COMMENT '类型',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) DEFAULT NULL COMMENT '附件',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_notify`
--

LOCK TABLES `oa_notify` WRITE;
/*!40000 ALTER TABLE `oa_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_notify_record`
--

DROP TABLE IF EXISTS `oa_notify_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_notify_record` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告发送记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_notify_record`
--

LOCK TABLES `oa_notify_record` WRITE;
/*!40000 ALTER TABLE `oa_notify_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_notify_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_test_audit`
--

DROP TABLE IF EXISTS `oa_test_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_test_audit` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批流程测试表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_test_audit`
--

LOCK TABLES `oa_test_audit` WRITE;
/*!40000 ALTER TABLE `oa_test_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_test_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_area`
--

DROP TABLE IF EXISTS `sys_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_area`
--

LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;
INSERT INTO `sys_area` VALUES ('06230000000001','2','0,1,2,','海淀区',30,'110201','3','1','2015-06-23 15:34:19','1','2015-06-23 15:37:15','','0'),('1','0','0,','中国',10,'100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','北京市',20,'110000','2','1','2013-05-27 08:00:00','1','2015-06-23 14:54:09','','0'),('3','2','0,1,2,','西城区',30,'110101','3','1','2013-05-27 08:00:00','1','2015-06-23 15:02:01','','0'),('4','3','0,1,2,3,','金融街街道',40,'110102','4','1','2013-05-27 08:00:00','1','2015-06-23 15:04:14','','0'),('5','3','0,1,2,3,','三里河街道',50,'110104','4','1','2013-05-27 08:00:00','1','2015-06-23 15:05:23','','0'),('6','3','0,1,2,3,','西长安街',60,'110105','4','1','2013-05-27 08:00:00','1','2015-06-23 15:06:10','','0');
/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '编号',
  `value` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) CHARACTER SET utf8 DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES ('06030000006001','01','待预定','JYSQZT','借用申请单状态',10,'0','1','2015-06-03 14:47:08','1','2015-06-03 14:47:35','','0'),('06030000006002','02','已预定','JYSQZT','借用申请单状态',20,'0','1','2015-06-03 14:47:57','1','2015-06-03 14:47:57','','0'),('06030000006003','03','已借出','JYSQZT','借用申请单状态',30,'0','1','2015-06-03 14:48:07','1','2015-06-03 14:48:07','','0'),('06030000006004','04','已归还','JYSQZT','借用申请单状态',40,'0','1','2015-06-03 14:48:15','1','2015-06-03 14:48:15','','0'),('06040000006101','05','待审批','JYSQZT','借用申请单状态',50,'0','1','2015-06-04 11:40:29','1','2015-06-04 11:40:29','','0'),('06040000006102','06','已拒绝','JYSQZT','借用申请单状态',60,'0','1','2015-06-04 11:40:39','1','2015-06-04 11:40:39','','0'),('06090000007201','6','已拒绝','file_borrow_status','已拒绝',60,'0','1','2015-06-09 14:00:10','1','2015-06-09 14:00:10','已拒绝','0'),('06170000007301','01','待审批','yq_repair_status','待审批',10,'0','1','2015-06-17 14:43:08','1','2015-06-17 14:43:08','','0'),('06170000007302','02','待维修','yq_repair_status','待维修',20,'0','1','2015-06-17 14:44:18','1','2015-06-17 14:45:11','','0'),('06170000007303','03','维修中','yq_repair_status','维修中',30,'0','1','2015-06-17 14:45:47','1','2015-06-17 14:45:47','','0'),('06170000007304','04','已维修','yq_repair_status','已维修',40,'0','1','2015-06-17 14:46:17','1','2015-06-17 14:46:17','','0'),('06170000007305','05','已拒绝','yq_repair_status','已拒绝',50,'0','1','2015-06-17 14:46:38','1','2015-06-17 14:46:38','','0'),('06170000007306','01','待审批','yq_scrap_status','待审批',10,'0','1','2015-06-17 14:48:22','1','2015-06-17 14:48:22','','0'),('06170000007307','02','待处理','yq_scrap_status','待处理',20,'0','1','2015-06-17 14:48:45','1','2015-06-17 14:48:45','','0'),('06170000007308','03','已报废','yq_scrap_status','已报废',30,'0','1','2015-06-17 14:49:13','1','2015-06-17 14:49:13','','0'),('06170000007309','04','已拒绝','yq_scrap_status','已拒绝',40,'0','1','2015-06-17 14:49:39','1','2015-06-17 14:49:39','','0'),('1','0','正常','del_flag','删除标记',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','yellow','黄色','color','颜色值',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('100','java.util.Date','Date','gen_java_type','Java类型',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('101','labs.modules.sys.entity.User','User','gen_java_type','Java类型',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('102','labs.modules.sys.entity.Office','Office','gen_java_type','Java类型',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('103','labs.modules.sys.entity.Area','Area','gen_java_type','Java类型',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('104','Custom','Custom','gen_java_type','Java类型',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('105','1','会议通告\0\0\0\0','oa_notify_type','通知通告类型',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('106','2','奖惩通告\0\0\0\0','oa_notify_type','通知通告类型',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('107','3','活动通告\0\0\0\0','oa_notify_type','通知通告类型',30,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('108','0','草稿','oa_notify_status','通知通告状态',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('109','1','发布','oa_notify_status','通知通告状态',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('11','orange','橙色','color','颜色值',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('110','0','未读','oa_notify_read','通知通告状态',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('111','1','已读','oa_notify_read','通知通告状态',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('12','default','默认主题','theme','主题方案',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','cerulean','天蓝主题','theme','主题方案',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','readable','橙色主题','theme','主题方案',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','united','红色主题','theme','主题方案',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','flat','Flat主题','theme','主题方案',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','1','国家','sys_area_type','区域类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','2','省份、直辖市','sys_area_type','区域类型',20,'0','1','2013-05-27 08:00:00','1','2015-04-24 13:39:40','','0'),('19','3','地市','sys_area_type','区域类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','删除','del_flag','删除标记',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','4','区县','sys_area_type','区域类型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('201505111','3','测试','act_type','流程类型',30,'0','1','2015-05-11 13:19:20','1','2015-05-11 13:19:20','','1'),('201505120000001001','3','未知','sex','未知',10,'0','1','2015-05-12 17:28:53','1','2015-05-12 17:28:53','','0'),('201505250000002001','1','1','gen_java_type','1',10,'0','1','2015-05-25 16:48:12','1','2015-05-25 16:48:12','','1'),('201505270000003001','1','空闲','file_borrow_status','空闲',10,'0','1','2015-05-27 15:50:13','1','2015-05-27 17:01:06','空闲','0'),('201505270000003002','2','待审批','file_borrow_status','待审批',20,'0','1','2015-05-27 15:50:35','1','2015-05-27 17:01:17','待审批','0'),('201505270000004001','3','已审批','file_borrow_status','已审批',30,'0','1','2015-05-27 17:00:20','1','2015-05-27 17:01:27','已审批','0'),('201505270000004002','4','已借出','file_borrow_status','已借出',40,'0','1','2015-05-27 17:00:36','1','2015-05-27 17:01:34','已借出','0'),('201505270000004003','5','已归还','file_borrow_status','已归还',50,'0','1','2015-05-27 17:00:57','1','2015-05-27 17:00:57','已归还','0'),('201505280000005001','01','空闲','SBZT','设备状态',1,'0','1','2015-05-28 10:57:59','1','2015-05-28 10:58:28','','0'),('201505280000005002','02','预定','SBZT','设备状态',11,'0','1','2015-05-28 10:58:40','1','2015-05-28 10:58:40','','0'),('201505280000005003','03','已借出','SBZT','设备状态',21,'0','1','2015-05-28 10:58:58','1','2015-05-28 10:58:58','','0'),('201505280000005004','04','维修中','SBZT','设备状态',31,'0','1','2015-05-28 10:59:14','1','2015-05-28 10:59:14','','0'),('201505280000005005','05','已报废','SBZT','设备状态',41,'0','1','2015-05-28 10:59:28','1','2015-05-28 10:59:28','','0'),('201506040000006201','1','图书标准','file_standard_type','图书标准',10,'0','1','2015-06-04 13:53:16','1','2015-06-04 13:53:16','图书标准','0'),('201506040000006202','2','受控文件','file_standard_type','受控文件',20,'0','1','2015-06-04 13:53:38','1','2015-06-04 13:53:38','受控文件','0'),('21','1','公司','sys_office_type','机构类型',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','2','部门','sys_office_type','机构类型',70,'0','1','2013-05-27 08:00:00','1','2015-05-20 16:03:23','','0'),('23','3','小组','sys_office_type','机构类型',80,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','4','其它','sys_office_type','机构类型',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','综合部','sys_office_common','快捷通用部门',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','2','开发部','sys_office_common','快捷通用部门',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','3','人力部','sys_office_common','快捷通用部门',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','1','一级','sys_office_grade','机构等级',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','2','二级','sys_office_grade','机构等级',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','显示','show_hide','显示/隐藏',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','3','三级','sys_office_grade','机构等级',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','4','四级','sys_office_grade','机构等级',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','1','所有数据','sys_data_scope','数据范围',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','2','所在公司及以下数据','sys_data_scope','数据范围',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','3','所在公司数据','sys_data_scope','数据范围',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','4','所在部门及以下数据','sys_data_scope','数据范围',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35d4a7f0257a413996786e721921f2f6','zise','紫色','color','颜色值',60,'0','1','2015-04-15 10:20:46','1','2015-04-15 10:20:46','紫色','0'),('36','5','所在部门数据','sys_data_scope','数据范围',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','8','仅本人数据','sys_data_scope','数据范围',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','9','按明细设置','sys_data_scope','数据范围',100,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','1','系统管理','sys_user_type','用户类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','0','隐藏','show_hide','显示/隐藏',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','2','部门经理','sys_user_type','用户类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','3','普通用户','sys_user_type','用户类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','basic','基础主题','cms_theme','站点主题',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','blue','蓝色主题','cms_theme','站点主题',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('43a110e160c9485aa5426635f2caabbc','weixin','威信','cms_theme','站点主题',20,'0','1','2015-04-16 12:55:03','1','2015-04-16 12:55:03','','0'),('44','red','红色主题','cms_theme','站点主题',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('45','article','文章模型','cms_module','栏目模型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','picture','图片模型','cms_module','栏目模型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('47','download','下载模型','cms_module','栏目模型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48','link','链接模型','cms_module','栏目模型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','special','专题模型','cms_module','栏目模型',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','1','是','yes_no','是/否',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','0','默认展现方式','cms_show_modes','展现方式',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','1','首栏目内容列表','cms_show_modes','展现方式',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','2','栏目第一条内容','cms_show_modes','展现方式',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','0','发布','cms_del_flag','内容状态',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','1','删除','cms_del_flag','内容状态',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','2','审核','cms_del_flag','内容状态',15,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','1','首页焦点图','cms_posid','推荐位',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','2','栏目页文章推荐','cms_posid','推荐位',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','1','咨询','cms_guestbook','留言板分类',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','2','建议','cms_guestbook','留言板分类',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','0','否','yes_no','是/否',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','3','投诉','cms_guestbook','留言板分类',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','4','其它','cms_guestbook','留言板分类',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','公休','oa_leave_type','请假类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('63','2','病假','oa_leave_type','请假类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','3','事假','oa_leave_type','请假类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','4','调休','oa_leave_type','请假类型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','5','婚假','oa_leave_type','请假类型',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','1','接入日志','sys_log_type','日志类型',30,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','2','异常日志','sys_log_type','日志类型',40,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','leave','请假流程','act_type','流程类型',10,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('7','red','红色','color','颜色值',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','test_audit','审批测试流程','act_type','流程类型',20,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('71','1','分类1','act_category','流程分类',10,'0','1','2013-06-03 08:00:00','1','2015-05-25 16:47:28','3','0'),('72','2','分类2','act_category','流程分类',20,'0','1','2013-06-03 08:00:00','1','2015-05-18 13:30:26','','0'),('73','crud','增删改查','gen_category','代码生成分类',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('74','crud_many','增删改查（包含从表）','gen_category','代码生成分类',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('75','tree','树结构','gen_category','代码生成分类',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('76','=','=','gen_query_type','查询方式',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('77','!=','!=','gen_query_type','查询方式',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('78','&gt;','&gt;','gen_query_type','查询方式',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('79','&lt;','&lt;','gen_query_type','查询方式',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('8','green','绿色','color','颜色值',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','between','Between','gen_query_type','查询方式',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('81','like','Like','gen_query_type','查询方式',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('82','left_like','Left Like','gen_query_type','查询方式',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('83','right_like','Right Like','gen_query_type','查询方式',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('84','input','文本框','gen_show_type','字段生成方案',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('85','textarea','文本域','gen_show_type','字段生成方案',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('86','select','下拉框','gen_show_type','字段生成方案',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('87','checkbox','复选框','gen_show_type','字段生成方案',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('88','radiobox','单选框','gen_show_type','字段生成方案',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('89','dateselect','日期选择','gen_show_type','字段生成方案',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('9','blue','蓝色','color','颜色值',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','userselect','人员选择\0','gen_show_type','字段生成方案',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('91','officeselect','部门选择','gen_show_type','字段生成方案',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('92','areaselect','区域选择','gen_show_type','字段生成方案',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('93','String','String','gen_java_type','Java类型',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('94','Long','Long','gen_java_type','Java类型',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('95','dao','仅持久层','gen_category','代码生成分类',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('96','1','男','sex','性别',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('97','2','女','sex','性别',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('98','Integer','Integer','gen_java_type','Java类型',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('99','Double','Double','gen_java_type','Java类型',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('edc3538d74f84048a4da3f325b385404','heise','黑色','color','颜色值',70,'0','1','2015-04-15 10:21:36','1','2015-04-15 10:21:36','黑色','0');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `code` varchar(64) NOT NULL COMMENT '类型代码',
  `name` varchar(64) NOT NULL COMMENT '类别名称',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  `t1` varchar(20) DEFAULT NULL COMMENT '备用1',
  `t2` varchar(40) DEFAULT NULL COMMENT '备用2',
  `t3` decimal(10,0) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sys_dict_type_uk` (`code`),
  KEY `sys_dict_type_code_IDX` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据字典类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES ('06030000127001','JYSQZT','借用申请单状态','1','2015-06-03 14:46:19','1','2015-06-03 14:46:19','借用申请单状态','0','2015-06-03 06:46:47','','',NULL),('06170000128101','yq_repair_status','仪器维修状态','1','2015-06-17 14:41:56','1','2015-06-17 14:41:56','仪器维修状态','0','2015-06-17 06:42:24','','',NULL),('06170000128102','yq_scrap_status','仪器降级/报废状态','1','2015-06-17 14:47:42','1','2015-06-17 14:47:42','仪器降级/报废状态','0','2015-06-17 06:48:10','','',NULL),('1','del_flag','删除标记','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('10','color','颜色值','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('100','gen_java_type','Java类型','1','2013-10-28 09:00:00','1','2015-05-18 17:25:37','','0','2015-05-18 09:26:05','','',NULL),('105','oa_notify_type','通知通告类型','1','2013-11-08 09:00:00','1','2013-11-08 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('108','oa_notify_status','通知通告状态','1','2013-11-08 09:00:00','1','2013-11-08 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('110','oa_notify_read','通知通告状态','1','2013-11-08 09:00:00','1','2015-05-18 17:25:33','','0','2015-05-18 09:26:01','','',NULL),('12','theme','主题方案','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('17','sys_area_type','区域类型','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('2','act_type','流程类型','1','2015-05-11 14:19:20','1','2015-05-11 14:19:20',NULL,'0','2015-05-11 09:58:31',NULL,NULL,NULL),('201505270000125001','file_borrow_status','文件资料借用记录状态','1','2015-05-27 15:49:14','1','2015-06-04 13:52:05','','0','2015-06-04 05:52:34','','',NULL),('201505280000126001','SBZT','设备状态','1','2015-05-28 10:56:06','1','2015-05-28 10:56:06','','0','2015-05-28 02:56:34','','',NULL),('201506040000127101','file_standard_type','文件资料标准类型','1','2015-06-04 13:52:37','1','2015-06-04 13:52:37','文件资料标准类型','0','2015-06-04 05:53:06','','',NULL),('21','sys_office_type','机构类型','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('25','sys_office_common','快捷通用部门','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('28','sys_office_grade','机构等级','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('3','show_hide','显示/隐藏','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('32','sys_data_scope','数据范围','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('39','sys_user_type','用户类型','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('42','cms_theme','站点主题','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('45','cms_module','栏目模型','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('5','yes_no','是/否','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('50','cms_show_modes','展现方式','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('53','cms_del_flag','内容状态','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('56','cms_posid','推荐位','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('58','cms_guestbook','留言板分类','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('62','oa_leave_type','请假类型','1','2013-05-27 09:00:00','1','2013-05-27 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('67','sys_log_type','日志类型','1','2013-06-03 09:00:00','1','2013-06-03 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('71','act_category','流程分类','1','2013-06-03 09:00:00','1','2013-06-03 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('73','gen_category','代码生成分类','1','2013-10-28 09:00:00','1','2013-10-28 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('76','gen_query_type','查询方式','1','2013-10-28 09:00:00','1','2013-10-28 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('84','gen_show_type','字段生成方案','1','2013-10-28 09:00:00','1','2013-10-28 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL),('96','sex','性别','1','2013-10-28 09:00:00','1','2013-10-28 09:00:00',NULL,'0','2015-05-11 07:57:29',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_mdict`
--

DROP TABLE IF EXISTS `sys_mdict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_mdict`
--

LOCK TABLES `sys_mdict` WRITE;
/*!40000 ALTER TABLE `sys_mdict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_mdict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('0680741fef2643ff9070f93ac64ad318','79a6d9d5ae224a58ad4104f8ddad285a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,79a6d9d5ae224a58ad4104f8ddad285a,','借出',120,'','','','0','yq:labBorrowRequest:lend','1','2015-06-10 10:53:55','1','2015-06-10 10:53:55','借出权限','0'),('1','0','0,','功能菜单',0,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','字典管理',60,'/sys/dict/',NULL,'icon-th-list','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,2,3,10,','查看',30,NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,2,3,10,','修改',40,NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','2','0,1,2,','机构用户',970,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','13','0,1,2,13,','区域管理',50,'/sys/area/',NULL,'icon-th','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','14','0,1,2,13,14,','查看',30,NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','14','0,1,2,13,14,','修改',40,NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','13','0,1,2,13,','机构管理',40,'/sys/office/',NULL,'icon-th-large','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,2,13,17,','查看',30,NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('186552005fef485ab9004164e68460d5','8c24cbb7270b4c459859e8d2645faa86','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,','仪器信息管理',30,'/yq/labEquipmentBaseinfo','','icon-wrench','1','','1','2015-05-27 09:41:48','1','2015-06-02 14:17:58','','0'),('19','17','0,1,2,13,17,','修改',40,NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('1aad42421be64487b3f59617a1414414','9e129245e0ce4acdb0c5bde2910c270a','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,','文件资料查询',30,'/files/labFileAttributes','','','1','','1','2015-05-25 13:56:33','1','2015-05-25 13:56:33','','0'),('1cddfa10d23049c88d3a0bc38608bbfb','62073fd9426148a59e9a901d947542b2','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,62073fd9426148a59e9a901d947542b2,','编辑',60,'','','','0','yq:labScrapApply:edit','1','2015-06-23 14:59:25','1','2015-06-23 15:00:48','','0'),('2','1','0,1,','系统设置',900,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','13','0,1,2,13,','用户管理',30,'/sys/user/index',NULL,'icon-user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','20','0,1,2,13,20,','查看',30,NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','20','0,1,2,13,20,','修改',40,NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','2','0,1,2,','关于帮助',990,NULL,NULL,NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23c823cd92004d16a1184a71fb0cf775','186552005fef485ab9004164e68460d5','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,186552005fef485ab9004164e68460d5,','编辑',60,'','','','0','yq:labEquipmentBaseinfo:edit','1','2015-05-27 09:42:16','1','2015-05-27 16:49:04','','0'),('27','1','0,1,','我的面板',100,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','27','0,1,27,','个人信息',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','28','0,1,27,28,','个人信息',30,'/sys/user/info',NULL,'icon-user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','系统设置',980,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','28','0,1,27,28,','修改密码',40,'/sys/user/modifyPwd',NULL,'icon-lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','1','0,1,','内容管理',500,'','','','0','','1','2013-05-27 08:00:00','1','2015-06-23 14:50:31','','0'),('32','31','0,1,31,','栏目设置',990,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','32','0,1,31,32','栏目管理',30,'/cms/category/',NULL,'icon-align-justify','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','33','0,1,31,32,33,','查看',30,NULL,NULL,NULL,'0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','33','0,1,31,32,33,','修改',40,NULL,NULL,NULL,'0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','32','0,1,31,32','站点设置',40,'/cms/site/',NULL,'icon-certificate','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','36','0,1,31,32,36,','查看',30,NULL,NULL,NULL,'0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','36','0,1,31,32,36,','修改',40,NULL,NULL,NULL,'0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','32','0,1,31,32','切换站点',50,'/cms/site/select',NULL,'icon-retweet','1','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3bdbe6d4a8984606a95759b2fdf24021','3','0,1,2,3,','字典类型管理',55,'/sys/sysDictType','','icon-info-sign','1','','1','2015-05-13 14:03:40','1','2015-05-13 14:03:40','','0'),('4','3','0,1,2,3,','菜单管理',30,'/sys/menu/',NULL,'icon-list-alt','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','31','0,1,31,','内容管理',500,NULL,NULL,NULL,'1','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','40','0,1,31,40,','内容发布',30,'/cms/',NULL,'icon-briefcase','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','41','0,1,31,40,41,','文章模型',40,'/cms/article/',NULL,'icon-file','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','42','0,1,31,40,41,42,','查看',30,NULL,NULL,NULL,'0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','42','0,1,31,40,41,42,','修改',40,NULL,NULL,NULL,'0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','42','0,1,31,40,41,42,','审核',50,NULL,NULL,NULL,'0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45ff42fb8d024602816b9384813d2ede','f42c05c410624b7884de7d7357886e7a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,f42c05c410624b7884de7d7357886e7a,','审批',90,'','','','0','yq:labRepairRequest:approve','1','2015-06-19 11:16:55','1','2015-06-19 11:16:55','','0'),('46','41','0,1,31,40,41,','链接模型',60,'/cms/link/',NULL,'icon-random','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','46','0,1,31,40,41,46,','查看',30,NULL,NULL,NULL,'0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','46','0,1,31,40,41,46,','修改',40,NULL,NULL,NULL,'0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','46','0,1,31,40,41,46,','审核',50,NULL,NULL,NULL,'0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','4','0,1,2,3,4,','查看',30,NULL,NULL,NULL,'0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','40','0,1,31,40,','评论管理',40,'/cms/comment/?status=2',NULL,'icon-comment','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','50','0,1,31,40,50,','查看',30,NULL,NULL,NULL,'0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','50','0,1,31,40,50,','审核',40,NULL,NULL,NULL,'0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','40','0,1,31,40,','公共留言',80,'/cms/guestbook/?status=2',NULL,'icon-glass','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('537a1b39122a4bdcac8aa3ab5a2f8cac','f42c05c410624b7884de7d7357886e7a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,f42c05c410624b7884de7d7357886e7a,','查看',30,'','','','0','yq:labRepairRequest:view','1','2015-06-19 11:15:38','1','2015-06-19 11:15:38','','0'),('54','53','0,1,31,40,53,','查看',30,NULL,NULL,NULL,'0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','53','0,1,31,40,53,','审核',40,NULL,NULL,NULL,'0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','71','0,1,27,71,','文件管理',90,'/../static/ckfinder/ckfinder.html',NULL,'icon-folder-open','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','56','0,1,27,40,56,','查看',30,NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','56','0,1,27,40,56,','上传',40,NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','56','0,1,27,40,56,','修改',50,NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','4','0,1,2,3,4,','修改',40,NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','31','0,1,31,','统计分析',600,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','60','0,1,31,60,','信息量统计',30,'/cms/stats/article',NULL,'icon-tasks','1','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61537afe08ca4d459433cad959cc68fb','1aad42421be64487b3f59617a1414414','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,1aad42421be64487b3f59617a1414414,','查看权限',30,'','','','0','files:labFileAttributes:view','1','2015-05-26 13:49:21','1','2015-05-26 13:49:21','','0'),('62','1','0,1,','在线办公',200,'','','','0','','1','2013-05-27 08:00:00','1','2015-06-23 14:50:24','','0'),('62073fd9426148a59e9a901d947542b2','8c24cbb7270b4c459859e8d2645faa86','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,','仪器降级/报废管理',300,'/yq/labScrapApply','','icon-bolt','1','','1','2015-06-23 14:58:16','1','2015-06-23 15:14:05','','0'),('63','62','0,1,62,','个人办公',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','63','0,1,62,63,','请假办理',300,'/oa/leave',NULL,'icon-leaf','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','64','0,1,62,63,64,','查看',30,NULL,NULL,NULL,'0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','64','0,1,62,63,64,','修改',40,NULL,NULL,NULL,'0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6634019181464aec9c01b27c9b020d8e','79a6d9d5ae224a58ad4104f8ddad285a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,79a6d9d5ae224a58ad4104f8ddad285a,','审批',90,'','','','0','yq:labBorrowRequest:approve','1','2015-06-04 11:38:29','1','2015-06-04 11:38:29','','0'),('67','2','0,1,2,','日志查询',985,NULL,NULL,NULL,'1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','67','0,1,2,67,','日志查询',30,'/sys/log',NULL,'icon-pencil','1','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('680224ca70354f68be34c92e483b8743','1aad42421be64487b3f59617a1414414','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,1aad42421be64487b3f59617a1414414,','借阅权限',90,'','','','0','files:labFileAttributes:lend','1','2015-06-11 13:29:12','1','2015-06-15 14:20:18','借阅权限','0'),('69','62','0,1,62,','流程管理',300,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6a51ba918617408988c6eba913e9ca51','bf32921976b34458b0d13a36d3ce7f5d','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,bf32921976b34458b0d13a36d3ce7f5d,','查看权限',30,'','','','0','files:labFileBorrow:view','1','2015-05-26 13:50:20','1','2015-05-27 09:36:36','','0'),('7','3','0,1,2,3,','角色管理',50,'/sys/role/',NULL,'icon-lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','69','0,1,62,69,','流程管理',50,'/act/process',NULL,'icon-road','1','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('71','27','0,1,27,','文件管理',90,'','','','0','','1','2013-05-27 08:00:00','1','2015-06-23 14:50:16','','0'),('7142b3a3946642e181a6a5d1e1e93e1a','1','0,1,','仪器管理',5060,'','','','1','','1','2015-05-22 08:56:32','1','2015-05-22 08:56:32','','0'),('72','69','0,1,62,69,','模型管理',100,'/act/model',NULL,'icon-road','1','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'0'),('73','63','0,1,62,63,','我的任务',50,'/act/task/todo/',NULL,'icon-tasks','1',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('74','63','0,1,62,63,','审批测试',100,'/oa/testAudit',NULL,NULL,'1','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('77373185e4a54fd799fec170f7f395b0','62073fd9426148a59e9a901d947542b2','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,62073fd9426148a59e9a901d947542b2,','审批',90,'','','','0','yq:labScrapApply:approve','1','2015-06-23 14:59:42','1','2015-06-23 15:01:10','','0'),('79','1','0,1,','代码生成',5000,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('79a6d9d5ae224a58ad4104f8ddad285a','8c24cbb7270b4c459859e8d2645faa86','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,','仪器借用管理',60,'/yq/labBorrowRequest','','icon-star-half','1','','1','2015-06-02 14:19:05','1','2015-06-02 14:20:55','','0'),('7a784723be7c476e99b0c34c4f85f26f','79a6d9d5ae224a58ad4104f8ddad285a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,79a6d9d5ae224a58ad4104f8ddad285a,','归还',150,'','','','0','yq:labBorrowRequest:return','1','2015-06-10 10:54:46','1','2015-06-10 10:54:46','','0'),('7ad9feb4b07d4df6894921817095830a','f42c05c410624b7884de7d7357886e7a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,f42c05c410624b7884de7d7357886e7a,','编辑',60,'','','','0','yq:labRepairRequest:edit','1','2015-06-19 11:16:04','1','2015-06-19 11:16:04','','0'),('7ca622df322a4acaace7bbb576706a5c','186552005fef485ab9004164e68460d5','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,186552005fef485ab9004164e68460d5,','仪器设备预订',90,'','','','0','yq:labEquipmentBaseinfo:reserve','1','2015-05-28 15:00:42','1','2015-06-01 14:31:58','','0'),('7f07d3f9a04e4c858be9ee6a189b5f37','1','0,1,','文件资料管理',5090,'','','','1','','1','2015-05-22 10:58:44','1','2015-05-22 10:58:44','','0'),('8','7','0,1,2,3,7,','查看',30,NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','79','0,1,79,','代码生成',50,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('81','80','0,1,79,80,','生成方案配置',30,'/gen/genScheme',NULL,NULL,'1','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('811bcf4a6d234936a213bdb87539575f','bf32921976b34458b0d13a36d3ce7f5d','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,bf32921976b34458b0d13a36d3ce7f5d,','借阅权限',120,'','','','0','files:labFileBorrow:lend','1','2015-06-11 13:30:57','1','2015-06-15 14:20:27','借阅权限','0'),('82','80','0,1,79,80,','业务表配置',20,'/gen/genTable',NULL,NULL,'1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('84','67','0,1,2,67,','连接池监视',40,'/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),('88','62','0,1,62,','通知通告',20,'','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('89','88','0,1,62,88,','我的通告',30,'/oa/oaNotify/self','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('8a208fdb0d2e4b0b9e97a7abae357c9c','186552005fef485ab9004164e68460d5','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,186552005fef485ab9004164e68460d5,','仪器设备降级报废',150,'','','','0','yq:labEquipmentBaseinfo:scrap','1','2015-06-01 14:33:05','1','2015-06-01 14:33:05','','0'),('8c24cbb7270b4c459859e8d2645faa86','7142b3a3946642e181a6a5d1e1e93e1a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,','仪器管理',30,'','','','1','','1','2015-05-22 10:31:56','1','2015-06-02 14:17:52','','0'),('8ccb8869530747eb97164e635d4e7be0','79a6d9d5ae224a58ad4104f8ddad285a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,79a6d9d5ae224a58ad4104f8ddad285a,','查看',30,'','','','0','yq:labBorrowRequest:view','1','2015-06-02 14:21:35','1','2015-06-02 14:21:35','','0'),('9','7','0,1,2,3,7,','修改',40,NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','88','0,1,62,88,','通告管理',50,'/oa/oaNotify','','','1','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('92fc77d8ab4d4e18bd4889c57300ab72','62073fd9426148a59e9a901d947542b2','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,62073fd9426148a59e9a901d947542b2,','查看',30,'','','','0','yq:labScrapApply:view','1','2015-06-23 14:59:03','1','2015-06-23 15:00:34','','0'),('93b1116630ad40b584bd6c455f526186','186552005fef485ab9004164e68460d5','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,186552005fef485ab9004164e68460d5,','查看',30,'','','','0','yq:labEquipmentBaseinfo:view','1','2015-05-27 09:42:06','1','2015-05-27 16:48:46','','0'),('9e129245e0ce4acdb0c5bde2910c270a','7f07d3f9a04e4c858be9ee6a189b5f37','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,','文件资料管理',30,'','','','1','','1','2015-05-22 14:44:06','1','2015-05-22 14:44:25','','0'),('9fcf821aa9dc4792b8b0edbf05356fb4','bf32921976b34458b0d13a36d3ce7f5d','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,bf32921976b34458b0d13a36d3ce7f5d,','修改权限',60,'','','','0','files:labFileBorrow:edit','1','2015-05-26 13:50:41','1','2015-05-27 09:36:47','','0'),('b519acf461ef41b4a7515d1407248f58','79a6d9d5ae224a58ad4104f8ddad285a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,79a6d9d5ae224a58ad4104f8ddad285a,','编辑',60,'','','','0','yq:labBorrowRequest:edit','1','2015-06-02 14:22:00','1','2015-06-02 14:22:20','','0'),('bf32921976b34458b0d13a36d3ce7f5d','9e129245e0ce4acdb0c5bde2910c270a','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,','文件资料借阅查询',60,'/files/labFileBorrow','','','1','','1','2015-05-26 13:43:25','1','2015-06-08 13:28:07','','0'),('c0e209a036d346c8b279eeabaf9705ce','3bdbe6d4a8984606a95759b2fdf24021','0,1,2,3,3bdbe6d4a8984606a95759b2fdf24021,','编辑',60,'','','','0','sys:sysDictType:edit','1','2015-05-13 14:05:20','1','2015-05-13 14:05:28','','0'),('d4d9d8bf547848b6b274452a50005bc4','3bdbe6d4a8984606a95759b2fdf24021','0,1,2,3,3bdbe6d4a8984606a95759b2fdf24021,','查看',30,'','','','0','sys:sysDictType:view','1','2015-05-13 14:04:59','1','2015-05-13 14:04:59','','0'),('e1ea756d50734459a96579bb7d09baa2','1aad42421be64487b3f59617a1414414','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,1aad42421be64487b3f59617a1414414,','编辑权限',60,'','','','0','files:labFileAttributes:edit','1','2015-05-26 13:49:46','1','2015-05-26 13:49:46','','0'),('eb4beaae012247fdb84e840e960a906e','f42c05c410624b7884de7d7357886e7a','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,f42c05c410624b7884de7d7357886e7a,','管理',120,'','','','0','yq:labRepairRequest:manage','1','2015-06-19 11:17:18','1','2015-06-30 11:14:33','','0'),('ee399f542d0f4d5ab0710e451988a890','bf32921976b34458b0d13a36d3ce7f5d','0,1,7f07d3f9a04e4c858be9ee6a189b5f37,9e129245e0ce4acdb0c5bde2910c270a,bf32921976b34458b0d13a36d3ce7f5d,','审批权限',90,'','','','0','files:labFileBorrow:approve','1','2015-05-26 13:54:26','1','2015-06-09 14:03:50','','0'),('f42526191fe440039b2feb260104ab60','186552005fef485ab9004164e68460d5','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,186552005fef485ab9004164e68460d5,','仪器设备维修',120,'','','','0','yq:labEquipmentBaseinfo:maintain','1','2015-06-01 14:32:36','1','2015-06-01 14:32:36','','0'),('f42c05c410624b7884de7d7357886e7a','8c24cbb7270b4c459859e8d2645faa86','0,1,7142b3a3946642e181a6a5d1e1e93e1a,8c24cbb7270b4c459859e8d2645faa86,','仪器维修管理',270,'/yq/labRepairRequest','','icon-wrench','1','','1','2015-06-19 11:15:10','1','2015-06-23 15:13:52','','0');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_office`
--

DROP TABLE IF EXISTS `sys_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_office`
--

LOCK TABLES `sys_office` WRITE;
/*!40000 ALTER TABLE `sys_office` DISABLE KEYS */;
INSERT INTO `sys_office` VALUES ('1','0','0,','总公司',10,'2','100000','1','1','','','','','','','1','','','1','2013-05-27 08:00:00','1','2015-06-23 14:53:48','','0'),('2','1','0,1,','公司领导',10,'2','100001','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25412c1ef4c047868860b9859b36ae46','54ec081ed00a447a8c09961e0ce1acc8','0,54ec081ed00a447a8c09961e0ce1acc8,','项目组A',30,'2','2000001','2','1','','','','','','','1','','','1','2015-04-21 16:21:50','1','2015-04-21 16:21:50','','0'),('296b3712f737447db7d212513dd13cb7','54ec081ed00a447a8c09961e0ce1acc8','0,54ec081ed00a447a8c09961e0ce1acc8,','项目组B',30,'2','2000002','2','1','','','','','','','1','','','1','2015-04-21 16:22:14','1','2015-04-21 16:22:14','','0'),('3','1','0,1,','综合部',20,'2','100002','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','0,1,','市场部',30,'2','100003','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','1','0,1,','技术部',40,'2','100004','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54ec081ed00a447a8c09961e0ce1acc8','0','0,','公司项目组',30,'2','2000','1','1','','','','','','','1','','','1','2015-04-21 16:11:13','1','2015-04-21 16:17:28','','0'),('6','1','0,1,','研发部',50,'2','100005','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `sys_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('0df038d9138a428ebb901367951edd4e','2','项目组A-仪器管理角色','PRJ1_INSTMNG','user','1','1','1','1','2015-04-21 16:48:00','1','2015-04-27 15:14:25','','0'),('1','2','系统管理员','dept','assignment','1','1','1','1','2013-05-27 08:00:00','1','2015-06-23 13:47:38','','0'),('13d47db92fe74c4194fb13a181d9d1d0','2','文件资料借阅归还岗','wjzljygh','user','8','1','1','1','2015-06-08 13:19:10','1','2015-06-30 15:52:51','','0'),('2','1','公司管理员','hr','assignment','2',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21ac2c5fb3554e44a210b072af968a6b','2','仪器维修人','yqwx-sq','assignment','8','1','1','1','2015-07-01 14:50:41','1','2015-07-01 15:01:46','','0'),('3','1','本公司管理员','a','assignment','3',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','部门管理员','b','assignment','4',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4ef5f5ec4fc64d0ba60b01ff715740ae','2','仪器维修审批人','yqwx-sp','assignment','8','1','1','1','2015-07-01 14:49:59','1','2015-07-01 15:02:00','','0'),('5','1','本部门管理员','c','assignment','5',NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('509e55188a034f67b20761e5db8adbb5','2','文件资料借阅审批岗','wjzlspg','user','8','1','1','1','2015-06-08 13:19:46','1','2015-06-30 15:53:44','','0'),('5525a6248bd24defa5716e78e90e7527','2','仪器管理-审批','yqgl-sp','user','8','0','1','1','2015-06-04 14:05:00','1','2015-06-24 11:18:41','','0'),('5d3b32dd0cf743618dcc44f92fa9546c','2','项目组A','PROJECT1','assignment','4','1','1','1','2015-04-21 16:46:38','1','2015-05-25 13:48:57','','0'),('6','2','普通用户','d','assignment','8','1','1','1','2013-05-27 08:00:00','1','2015-05-25 16:04:36','','0'),('64c51ff2129142bfbb18570e19e146cf','2','仪器管理-管理员','yqgl-gly','user','8','0','1','1','2015-06-04 14:06:17','1','2015-06-26 10:05:13','','0'),('66eb91788fd74fedad045a64af70512b','2','仪器降级/报废人','jjbf','assignment','8','1','1','1','2015-07-01 15:02:38','1','2015-07-01 15:02:38','','0'),('76888a683b96489eab3b7258569fa7a0','2','仪器管理-借用申请角色','yqgl-sqr','user','8','0','1','1','2015-06-04 15:48:14','1','2015-07-01 14:45:58','','0'),('93dc5c9814534369b4b3c2d165376fef','2','仪器降级/报废审批人','jjbfsp','assignment','8','1','1','1','2015-07-01 15:02:59','1','2015-07-01 15:02:59','','0'),('cc35e8fe019440b3a64bfba41a89331a','2','文件资料管理岗','wjzlgl','user','8','1','1','1','2015-06-08 13:17:44','1','2015-06-30 15:45:21','','0');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES ('0df038d9138a428ebb901367951edd4e','1'),('0df038d9138a428ebb901367951edd4e','13'),('0df038d9138a428ebb901367951edd4e','14'),('0df038d9138a428ebb901367951edd4e','15'),('0df038d9138a428ebb901367951edd4e','16'),('0df038d9138a428ebb901367951edd4e','17'),('0df038d9138a428ebb901367951edd4e','18'),('0df038d9138a428ebb901367951edd4e','19'),('0df038d9138a428ebb901367951edd4e','2'),('0df038d9138a428ebb901367951edd4e','20'),('0df038d9138a428ebb901367951edd4e','21'),('0df038d9138a428ebb901367951edd4e','22'),('0df038d9138a428ebb901367951edd4e','27'),('0df038d9138a428ebb901367951edd4e','28'),('0df038d9138a428ebb901367951edd4e','29'),('0df038d9138a428ebb901367951edd4e','3'),('0df038d9138a428ebb901367951edd4e','30'),('0df038d9138a428ebb901367951edd4e','56'),('0df038d9138a428ebb901367951edd4e','57'),('0df038d9138a428ebb901367951edd4e','58'),('0df038d9138a428ebb901367951edd4e','59'),('0df038d9138a428ebb901367951edd4e','62'),('0df038d9138a428ebb901367951edd4e','63'),('0df038d9138a428ebb901367951edd4e','64'),('0df038d9138a428ebb901367951edd4e','65'),('0df038d9138a428ebb901367951edd4e','66'),('0df038d9138a428ebb901367951edd4e','69'),('0df038d9138a428ebb901367951edd4e','7'),('0df038d9138a428ebb901367951edd4e','70'),('0df038d9138a428ebb901367951edd4e','71'),('0df038d9138a428ebb901367951edd4e','72'),('0df038d9138a428ebb901367951edd4e','73'),('0df038d9138a428ebb901367951edd4e','74'),('0df038d9138a428ebb901367951edd4e','8'),('0df038d9138a428ebb901367951edd4e','88'),('0df038d9138a428ebb901367951edd4e','89'),('0df038d9138a428ebb901367951edd4e','9'),('0df038d9138a428ebb901367951edd4e','90'),('1','1'),('1','10'),('1','11'),('1','12'),('1','120e5c17c94642fa9b9eaf818edca2ef'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','1aad42421be64487b3f59617a1414414'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','27'),('1','28'),('1','29'),('1','2e5226b7c087467fba3cb979d0e8428c'),('1','3'),('1','30'),('1','31'),('1','32'),('1','33'),('1','34'),('1','35'),('1','36'),('1','37'),('1','38'),('1','39'),('1','3efff8556dfd40679ba304b5170ba57e'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','45'),('1','46'),('1','47'),('1','48'),('1','49'),('1','5'),('1','50'),('1','51'),('1','52'),('1','53'),('1','537a1b39122a4bdcac8aa3ab5a2f8cac'),('1','54'),('1','55'),('1','56'),('1','57'),('1','58'),('1','59'),('1','6'),('1','60'),('1','61'),('1','61537afe08ca4d459433cad959cc68fb'),('1','62'),('1','63'),('1','64'),('1','65'),('1','654eb1eac83b4f4c8540665ee414b733'),('1','66'),('1','67'),('1','68'),('1','69'),('1','6a51ba918617408988c6eba913e9ca51'),('1','7'),('1','70'),('1','71'),('1','7142b3a3946642e181a6a5d1e1e93e1a'),('1','71a296d089bc4cebb3c8f236fec26fde'),('1','72'),('1','7ad9feb4b07d4df6894921817095830a'),('1','7f07d3f9a04e4c858be9ee6a189b5f37'),('1','8'),('1','8c24cbb7270b4c459859e8d2645faa86'),('1','9'),('1','9e129245e0ce4acdb0c5bde2910c270a'),('1','9fcf821aa9dc4792b8b0edbf05356fb4'),('1','bf32921976b34458b0d13a36d3ce7f5d'),('1','d48110ce5b9449a8a0551af39cc58d78'),('1','e1ea756d50734459a96579bb7d09baa2'),('1','f42c05c410624b7884de7d7357886e7a'),('13d47db92fe74c4194fb13a181d9d1d0','1'),('13d47db92fe74c4194fb13a181d9d1d0','1aad42421be64487b3f59617a1414414'),('13d47db92fe74c4194fb13a181d9d1d0','61537afe08ca4d459433cad959cc68fb'),('13d47db92fe74c4194fb13a181d9d1d0','6a51ba918617408988c6eba913e9ca51'),('13d47db92fe74c4194fb13a181d9d1d0','7f07d3f9a04e4c858be9ee6a189b5f37'),('13d47db92fe74c4194fb13a181d9d1d0','9e129245e0ce4acdb0c5bde2910c270a'),('13d47db92fe74c4194fb13a181d9d1d0','bf32921976b34458b0d13a36d3ce7f5d'),('13d47db92fe74c4194fb13a181d9d1d0','ee399f542d0f4d5ab0710e451988a890'),('2','1'),('2','10'),('2','11'),('2','12'),('2','13'),('2','14'),('2','15'),('2','16'),('2','17'),('2','18'),('2','19'),('2','2'),('2','20'),('2','21'),('2','22'),('2','23'),('2','24'),('2','25'),('2','26'),('2','27'),('2','28'),('2','29'),('2','3'),('2','30'),('2','31'),('2','32'),('2','33'),('2','34'),('2','35'),('2','36'),('2','37'),('2','38'),('2','39'),('2','4'),('2','40'),('2','41'),('2','42'),('2','43'),('2','44'),('2','45'),('2','46'),('2','47'),('2','48'),('2','49'),('2','5'),('2','50'),('2','51'),('2','52'),('2','53'),('2','54'),('2','55'),('2','56'),('2','57'),('2','58'),('2','59'),('2','6'),('2','60'),('2','61'),('2','62'),('2','63'),('2','64'),('2','65'),('2','66'),('2','67'),('2','68'),('2','69'),('2','7'),('2','70'),('2','71'),('2','72'),('2','8'),('2','9'),('21ac2c5fb3554e44a210b072af968a6b','1'),('21ac2c5fb3554e44a210b072af968a6b','537a1b39122a4bdcac8aa3ab5a2f8cac'),('21ac2c5fb3554e44a210b072af968a6b','7142b3a3946642e181a6a5d1e1e93e1a'),('21ac2c5fb3554e44a210b072af968a6b','7ad9feb4b07d4df6894921817095830a'),('21ac2c5fb3554e44a210b072af968a6b','8c24cbb7270b4c459859e8d2645faa86'),('21ac2c5fb3554e44a210b072af968a6b','f42c05c410624b7884de7d7357886e7a'),('3','1'),('3','10'),('3','11'),('3','12'),('3','13'),('3','14'),('3','15'),('3','16'),('3','17'),('3','18'),('3','19'),('3','2'),('3','20'),('3','21'),('3','22'),('3','23'),('3','24'),('3','25'),('3','26'),('3','27'),('3','28'),('3','29'),('3','3'),('3','30'),('3','31'),('3','32'),('3','33'),('3','34'),('3','35'),('3','36'),('3','37'),('3','38'),('3','39'),('3','4'),('3','40'),('3','41'),('3','42'),('3','43'),('3','44'),('3','45'),('3','46'),('3','47'),('3','48'),('3','49'),('3','5'),('3','50'),('3','51'),('3','52'),('3','53'),('3','54'),('3','55'),('3','56'),('3','57'),('3','58'),('3','59'),('3','6'),('3','60'),('3','61'),('3','62'),('3','63'),('3','64'),('3','65'),('3','66'),('3','67'),('3','68'),('3','69'),('3','7'),('3','70'),('3','71'),('3','72'),('3','8'),('3','9'),('4','1'),('4','10'),('4','11'),('4','12'),('4','13'),('4','14'),('4','15'),('4','16'),('4','17'),('4','18'),('4','19'),('4','2'),('4','20'),('4','21'),('4','22'),('4','23'),('4','24'),('4','25'),('4','26'),('4','27'),('4','28'),('4','29'),('4','3'),('4','30'),('4','31'),('4','32'),('4','33'),('4','34'),('4','35'),('4','36'),('4','37'),('4','38'),('4','39'),('4','4'),('4','40'),('4','41'),('4','42'),('4','43'),('4','44'),('4','45'),('4','46'),('4','47'),('4','48'),('4','49'),('4','5'),('4','50'),('4','51'),('4','52'),('4','53'),('4','54'),('4','55'),('4','56'),('4','57'),('4','58'),('4','59'),('4','6'),('4','60'),('4','61'),('4','62'),('4','63'),('4','64'),('4','65'),('4','66'),('4','67'),('4','68'),('4','69'),('4','7'),('4','70'),('4','71'),('4','72'),('4','8'),('4','9'),('4ef5f5ec4fc64d0ba60b01ff715740ae','1'),('4ef5f5ec4fc64d0ba60b01ff715740ae','45ff42fb8d024602816b9384813d2ede'),('4ef5f5ec4fc64d0ba60b01ff715740ae','537a1b39122a4bdcac8aa3ab5a2f8cac'),('4ef5f5ec4fc64d0ba60b01ff715740ae','7142b3a3946642e181a6a5d1e1e93e1a'),('4ef5f5ec4fc64d0ba60b01ff715740ae','8c24cbb7270b4c459859e8d2645faa86'),('4ef5f5ec4fc64d0ba60b01ff715740ae','f42c05c410624b7884de7d7357886e7a'),('5','1'),('5','10'),('5','11'),('5','12'),('5','13'),('5','14'),('5','15'),('5','16'),('5','17'),('5','18'),('5','19'),('5','2'),('5','20'),('5','21'),('5','22'),('5','23'),('5','24'),('5','25'),('5','26'),('5','27'),('5','28'),('5','29'),('5','3'),('5','30'),('5','31'),('5','32'),('5','33'),('5','34'),('5','35'),('5','36'),('5','37'),('5','38'),('5','39'),('5','4'),('5','40'),('5','41'),('5','42'),('5','43'),('5','44'),('5','45'),('5','46'),('5','47'),('5','48'),('5','49'),('5','5'),('5','50'),('5','51'),('5','52'),('5','53'),('5','54'),('5','55'),('5','56'),('5','57'),('5','58'),('5','59'),('5','6'),('5','60'),('5','61'),('5','62'),('5','63'),('5','64'),('5','65'),('5','66'),('5','67'),('5','68'),('5','69'),('5','7'),('5','70'),('5','71'),('5','72'),('5','8'),('5','9'),('509e55188a034f67b20761e5db8adbb5','1'),('509e55188a034f67b20761e5db8adbb5','1aad42421be64487b3f59617a1414414'),('509e55188a034f67b20761e5db8adbb5','61537afe08ca4d459433cad959cc68fb'),('509e55188a034f67b20761e5db8adbb5','6a51ba918617408988c6eba913e9ca51'),('509e55188a034f67b20761e5db8adbb5','7f07d3f9a04e4c858be9ee6a189b5f37'),('509e55188a034f67b20761e5db8adbb5','9e129245e0ce4acdb0c5bde2910c270a'),('509e55188a034f67b20761e5db8adbb5','bf32921976b34458b0d13a36d3ce7f5d'),('509e55188a034f67b20761e5db8adbb5','ee399f542d0f4d5ab0710e451988a890'),('5525a6248bd24defa5716e78e90e7527','1'),('5525a6248bd24defa5716e78e90e7527','27'),('5525a6248bd24defa5716e78e90e7527','28'),('5525a6248bd24defa5716e78e90e7527','29'),('5525a6248bd24defa5716e78e90e7527','30'),('5525a6248bd24defa5716e78e90e7527','45ff42fb8d024602816b9384813d2ede'),('5525a6248bd24defa5716e78e90e7527','537a1b39122a4bdcac8aa3ab5a2f8cac'),('5525a6248bd24defa5716e78e90e7527','56'),('5525a6248bd24defa5716e78e90e7527','57'),('5525a6248bd24defa5716e78e90e7527','58'),('5525a6248bd24defa5716e78e90e7527','59'),('5525a6248bd24defa5716e78e90e7527','62073fd9426148a59e9a901d947542b2'),('5525a6248bd24defa5716e78e90e7527','6634019181464aec9c01b27c9b020d8e'),('5525a6248bd24defa5716e78e90e7527','71'),('5525a6248bd24defa5716e78e90e7527','7142b3a3946642e181a6a5d1e1e93e1a'),('5525a6248bd24defa5716e78e90e7527','77373185e4a54fd799fec170f7f395b0'),('5525a6248bd24defa5716e78e90e7527','79a6d9d5ae224a58ad4104f8ddad285a'),('5525a6248bd24defa5716e78e90e7527','8c24cbb7270b4c459859e8d2645faa86'),('5525a6248bd24defa5716e78e90e7527','8ccb8869530747eb97164e635d4e7be0'),('5525a6248bd24defa5716e78e90e7527','92fc77d8ab4d4e18bd4889c57300ab72'),('5525a6248bd24defa5716e78e90e7527','f42c05c410624b7884de7d7357886e7a'),('5d3b32dd0cf743618dcc44f92fa9546c','1'),('5d3b32dd0cf743618dcc44f92fa9546c','10'),('5d3b32dd0cf743618dcc44f92fa9546c','11'),('5d3b32dd0cf743618dcc44f92fa9546c','12'),('5d3b32dd0cf743618dcc44f92fa9546c','13'),('5d3b32dd0cf743618dcc44f92fa9546c','14'),('5d3b32dd0cf743618dcc44f92fa9546c','15'),('5d3b32dd0cf743618dcc44f92fa9546c','16'),('5d3b32dd0cf743618dcc44f92fa9546c','17'),('5d3b32dd0cf743618dcc44f92fa9546c','18'),('5d3b32dd0cf743618dcc44f92fa9546c','19'),('5d3b32dd0cf743618dcc44f92fa9546c','2'),('5d3b32dd0cf743618dcc44f92fa9546c','20'),('5d3b32dd0cf743618dcc44f92fa9546c','21'),('5d3b32dd0cf743618dcc44f92fa9546c','22'),('5d3b32dd0cf743618dcc44f92fa9546c','27'),('5d3b32dd0cf743618dcc44f92fa9546c','28'),('5d3b32dd0cf743618dcc44f92fa9546c','29'),('5d3b32dd0cf743618dcc44f92fa9546c','3'),('5d3b32dd0cf743618dcc44f92fa9546c','30'),('5d3b32dd0cf743618dcc44f92fa9546c','3bdbe6d4a8984606a95759b2fdf24021'),('5d3b32dd0cf743618dcc44f92fa9546c','3c8047e81cd8496f93cf89ffa2915f3f'),('5d3b32dd0cf743618dcc44f92fa9546c','4'),('5d3b32dd0cf743618dcc44f92fa9546c','48e861f2a6e340c0aad4c61ef6597571'),('5d3b32dd0cf743618dcc44f92fa9546c','5'),('5d3b32dd0cf743618dcc44f92fa9546c','6'),('5d3b32dd0cf743618dcc44f92fa9546c','67'),('5d3b32dd0cf743618dcc44f92fa9546c','68'),('5d3b32dd0cf743618dcc44f92fa9546c','7'),('5d3b32dd0cf743618dcc44f92fa9546c','7142b3a3946642e181a6a5d1e1e93e1a'),('5d3b32dd0cf743618dcc44f92fa9546c','7f07d3f9a04e4c858be9ee6a189b5f37'),('5d3b32dd0cf743618dcc44f92fa9546c','8'),('5d3b32dd0cf743618dcc44f92fa9546c','84'),('5d3b32dd0cf743618dcc44f92fa9546c','8c24cbb7270b4c459859e8d2645faa86'),('5d3b32dd0cf743618dcc44f92fa9546c','9'),('5d3b32dd0cf743618dcc44f92fa9546c','9e129245e0ce4acdb0c5bde2910c270a'),('5d3b32dd0cf743618dcc44f92fa9546c','afeaca08c2ce48b0a183e8cda517e95f'),('5d3b32dd0cf743618dcc44f92fa9546c','c0e209a036d346c8b279eeabaf9705ce'),('5d3b32dd0cf743618dcc44f92fa9546c','d11482713aef4693a8c3a4d5297092b4'),('5d3b32dd0cf743618dcc44f92fa9546c','d4d9d8bf547848b6b274452a50005bc4'),('5d3b32dd0cf743618dcc44f92fa9546c','f7b76ff5bfed4be8a6abe4f862e105f3'),('6','1'),('6','10'),('6','11'),('6','13'),('6','14'),('6','15'),('6','16'),('6','17'),('6','18'),('6','19'),('6','2'),('6','20'),('6','21'),('6','22'),('6','23'),('6','27'),('6','28'),('6','29'),('6','3'),('6','30'),('6','31'),('6','32'),('6','33'),('6','34'),('6','35'),('6','36'),('6','37'),('6','38'),('6','39'),('6','3bdbe6d4a8984606a95759b2fdf24021'),('6','4'),('6','40'),('6','41'),('6','42'),('6','43'),('6','44'),('6','45'),('6','46'),('6','47'),('6','48'),('6','49'),('6','5'),('6','50'),('6','51'),('6','52'),('6','53'),('6','54'),('6','55'),('6','56'),('6','57'),('6','58'),('6','59'),('6','6'),('6','60'),('6','61'),('6','62'),('6','63'),('6','64'),('6','65'),('6','66'),('6','67'),('6','68'),('6','69'),('6','7'),('6','70'),('6','71'),('6','72'),('6','8'),('6','9'),('6','d4d9d8bf547848b6b274452a50005bc4'),('64c51ff2129142bfbb18570e19e146cf','0680741fef2643ff9070f93ac64ad318'),('64c51ff2129142bfbb18570e19e146cf','1'),('64c51ff2129142bfbb18570e19e146cf','186552005fef485ab9004164e68460d5'),('64c51ff2129142bfbb18570e19e146cf','23c823cd92004d16a1184a71fb0cf775'),('64c51ff2129142bfbb18570e19e146cf','27'),('64c51ff2129142bfbb18570e19e146cf','28'),('64c51ff2129142bfbb18570e19e146cf','29'),('64c51ff2129142bfbb18570e19e146cf','30'),('64c51ff2129142bfbb18570e19e146cf','537a1b39122a4bdcac8aa3ab5a2f8cac'),('64c51ff2129142bfbb18570e19e146cf','56'),('64c51ff2129142bfbb18570e19e146cf','57'),('64c51ff2129142bfbb18570e19e146cf','58'),('64c51ff2129142bfbb18570e19e146cf','59'),('64c51ff2129142bfbb18570e19e146cf','62073fd9426148a59e9a901d947542b2'),('64c51ff2129142bfbb18570e19e146cf','71'),('64c51ff2129142bfbb18570e19e146cf','7142b3a3946642e181a6a5d1e1e93e1a'),('64c51ff2129142bfbb18570e19e146cf','79a6d9d5ae224a58ad4104f8ddad285a'),('64c51ff2129142bfbb18570e19e146cf','7a784723be7c476e99b0c34c4f85f26f'),('64c51ff2129142bfbb18570e19e146cf','7ca622df322a4acaace7bbb576706a5c'),('64c51ff2129142bfbb18570e19e146cf','8a208fdb0d2e4b0b9e97a7abae357c9c'),('64c51ff2129142bfbb18570e19e146cf','8c24cbb7270b4c459859e8d2645faa86'),('64c51ff2129142bfbb18570e19e146cf','8ccb8869530747eb97164e635d4e7be0'),('64c51ff2129142bfbb18570e19e146cf','92fc77d8ab4d4e18bd4889c57300ab72'),('64c51ff2129142bfbb18570e19e146cf','93b1116630ad40b584bd6c455f526186'),('64c51ff2129142bfbb18570e19e146cf','eb4beaae012247fdb84e840e960a906e'),('64c51ff2129142bfbb18570e19e146cf','f42526191fe440039b2feb260104ab60'),('64c51ff2129142bfbb18570e19e146cf','f42c05c410624b7884de7d7357886e7a'),('66eb91788fd74fedad045a64af70512b','1'),('66eb91788fd74fedad045a64af70512b','1cddfa10d23049c88d3a0bc38608bbfb'),('66eb91788fd74fedad045a64af70512b','62073fd9426148a59e9a901d947542b2'),('66eb91788fd74fedad045a64af70512b','7142b3a3946642e181a6a5d1e1e93e1a'),('66eb91788fd74fedad045a64af70512b','8c24cbb7270b4c459859e8d2645faa86'),('66eb91788fd74fedad045a64af70512b','92fc77d8ab4d4e18bd4889c57300ab72'),('7','1'),('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','2'),('7','20'),('7','21'),('7','22'),('7','23'),('7','27'),('7','28'),('7','29'),('7','3'),('7','30'),('7','31'),('7','32'),('7','33'),('7','34'),('7','35'),('7','36'),('7','37'),('7','38'),('7','39'),('7','3c8047e81cd8496f93cf89ffa2915f3f'),('7','4'),('7','40'),('7','41'),('7','42'),('7','43'),('7','44'),('7','45'),('7','46'),('7','47'),('7','48'),('7','48e861f2a6e340c0aad4c61ef6597571'),('7','49'),('7','5'),('7','50'),('7','51'),('7','52'),('7','53'),('7','54'),('7','55'),('7','56'),('7','57'),('7','58'),('7','59'),('7','6'),('7','60'),('7','61'),('7','62'),('7','63'),('7','64'),('7','65'),('7','66'),('7','67'),('7','68'),('7','69'),('7','7'),('7','70'),('7','71'),('7','72'),('7','7f07d3f9a04e4c858be9ee6a189b5f37'),('7','8'),('7','9'),('7','9e129245e0ce4acdb0c5bde2910c270a'),('7','afeaca08c2ce48b0a183e8cda517e95f'),('7','d11482713aef4693a8c3a4d5297092b4'),('7','f7b76ff5bfed4be8a6abe4f862e105f3'),('76888a683b96489eab3b7258569fa7a0','1'),('76888a683b96489eab3b7258569fa7a0','1cddfa10d23049c88d3a0bc38608bbfb'),('76888a683b96489eab3b7258569fa7a0','537a1b39122a4bdcac8aa3ab5a2f8cac'),('76888a683b96489eab3b7258569fa7a0','62073fd9426148a59e9a901d947542b2'),('76888a683b96489eab3b7258569fa7a0','7142b3a3946642e181a6a5d1e1e93e1a'),('76888a683b96489eab3b7258569fa7a0','79a6d9d5ae224a58ad4104f8ddad285a'),('76888a683b96489eab3b7258569fa7a0','7ad9feb4b07d4df6894921817095830a'),('76888a683b96489eab3b7258569fa7a0','8c24cbb7270b4c459859e8d2645faa86'),('76888a683b96489eab3b7258569fa7a0','8ccb8869530747eb97164e635d4e7be0'),('76888a683b96489eab3b7258569fa7a0','92fc77d8ab4d4e18bd4889c57300ab72'),('76888a683b96489eab3b7258569fa7a0','b519acf461ef41b4a7515d1407248f58'),('76888a683b96489eab3b7258569fa7a0','f42c05c410624b7884de7d7357886e7a'),('93dc5c9814534369b4b3c2d165376fef','1'),('93dc5c9814534369b4b3c2d165376fef','62073fd9426148a59e9a901d947542b2'),('93dc5c9814534369b4b3c2d165376fef','7142b3a3946642e181a6a5d1e1e93e1a'),('93dc5c9814534369b4b3c2d165376fef','77373185e4a54fd799fec170f7f395b0'),('93dc5c9814534369b4b3c2d165376fef','8c24cbb7270b4c459859e8d2645faa86'),('93dc5c9814534369b4b3c2d165376fef','92fc77d8ab4d4e18bd4889c57300ab72'),('cc35e8fe019440b3a64bfba41a89331a','1'),('cc35e8fe019440b3a64bfba41a89331a','1aad42421be64487b3f59617a1414414'),('cc35e8fe019440b3a64bfba41a89331a','61537afe08ca4d459433cad959cc68fb'),('cc35e8fe019440b3a64bfba41a89331a','680224ca70354f68be34c92e483b8743'),('cc35e8fe019440b3a64bfba41a89331a','6a51ba918617408988c6eba913e9ca51'),('cc35e8fe019440b3a64bfba41a89331a','7f07d3f9a04e4c858be9ee6a189b5f37'),('cc35e8fe019440b3a64bfba41a89331a','811bcf4a6d234936a213bdb87539575f'),('cc35e8fe019440b3a64bfba41a89331a','9e129245e0ce4acdb0c5bde2910c270a'),('cc35e8fe019440b3a64bfba41a89331a','bf32921976b34458b0d13a36d3ce7f5d'),('cc35e8fe019440b3a64bfba41a89331a','e1ea756d50734459a96579bb7d09baa2');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_office`
--

DROP TABLE IF EXISTS `sys_role_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_office`
--

LOCK TABLES `sys_role_office` WRITE;
/*!40000 ALTER TABLE `sys_role_office` DISABLE KEYS */;
INSERT INTO `sys_role_office` VALUES ('0df038d9138a428ebb901367951edd4e','1'),('0df038d9138a428ebb901367951edd4e','10'),('0df038d9138a428ebb901367951edd4e','11'),('0df038d9138a428ebb901367951edd4e','12'),('0df038d9138a428ebb901367951edd4e','13'),('0df038d9138a428ebb901367951edd4e','14'),('0df038d9138a428ebb901367951edd4e','15'),('0df038d9138a428ebb901367951edd4e','16'),('0df038d9138a428ebb901367951edd4e','17'),('0df038d9138a428ebb901367951edd4e','18'),('0df038d9138a428ebb901367951edd4e','19'),('0df038d9138a428ebb901367951edd4e','2'),('0df038d9138a428ebb901367951edd4e','20'),('0df038d9138a428ebb901367951edd4e','21'),('0df038d9138a428ebb901367951edd4e','22'),('0df038d9138a428ebb901367951edd4e','23'),('0df038d9138a428ebb901367951edd4e','24'),('0df038d9138a428ebb901367951edd4e','25'),('0df038d9138a428ebb901367951edd4e','26'),('0df038d9138a428ebb901367951edd4e','3'),('0df038d9138a428ebb901367951edd4e','4'),('0df038d9138a428ebb901367951edd4e','5'),('0df038d9138a428ebb901367951edd4e','575368567d6f4b158effc01991e2a52c'),('0df038d9138a428ebb901367951edd4e','6'),('0df038d9138a428ebb901367951edd4e','7'),('0df038d9138a428ebb901367951edd4e','8'),('0df038d9138a428ebb901367951edd4e','9'),('7','10'),('7','11'),('7','12'),('7','13'),('7','14'),('7','15'),('7','16'),('7','17'),('7','18'),('7','19'),('7','20'),('7','21'),('7','22'),('7','23'),('7','24'),('7','25'),('7','26'),('7','7'),('7','8'),('7','9');
/*!40000 ALTER TABLE `sys_role_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sequence`
--

DROP TABLE IF EXISTS `sys_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sequence` (
  `name` varchar(100) NOT NULL,
  `value` bigint(20) DEFAULT NULL,
  `init` bigint(20) DEFAULT NULL,
  `step` bigint(20) DEFAULT NULL,
  `max` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='序列';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sequence`
--

LOCK TABLES `sys_sequence` WRITE;
/*!40000 ALTER TABLE `sys_sequence` DISABLE KEYS */;
INSERT INTO `sys_sequence` VALUES ('ACTIVITI',137,0,0,0),('Area',100,0,100,100),('Comment',1100,0,1000,1000),('Dict',7400,0,1000,1000),('LabBorrowRequest',1900,0,100,100),('LabBorrowRequestAndBaseinfo',1000,0,100,100),('LabEquipmentBaseinfo',7800,0,1000,1000),('LabEquipmentBaseinfoService',1300,0,1000,1000),('LabFileAttributes',3800,0,1000,1000),('LabFileBorrow',2900,0,1000,1000),('LabFileBorrowRelationship',700,0,100,100),('LabRepairRequest',1800,0,100,100),('LabRepairRequestAndBaseinfo',900,0,100,100),('LabScrapApply',800,0,100,100),('LabScrapApplyAndBaseinfo',500,0,100,100),('Log',4300,0,0,0),('OaNotify',100,0,100,100),('Office',4200,0,1000,1000),('SysDictType',128200,0,1000,1000),('TestData',2100,0,0,0);
/*!40000 ALTER TABLE `sys_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('054437e904b74cbc97696b2e25e5f88b','12','5','444','ac4b30abbed9a0e0e7ffefddeb25421cb18479db3ca72e17b87d91ce','444','44','','','','1','',NULL,NULL,'1','1','2015-05-15 18:44:34','1','2015-05-15 18:44:34','5','0'),('1','1','2','sa','5d90eb504445095bec7f6b93953a9d46820748aabe8305993e6267e0','0001','系统管理员','','','','','','0:0:0:0:0:0:0:1','2015-07-01 15:15:24','1','1','2013-05-27 08:00:00','1','2015-06-30 13:44:55','最高管理员','0'),('2','1','2','admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0002','管理员','','','','','','10.46.2.94','2015-06-30 13:55:23','1','1','2013-05-27 08:00:00','1','2015-06-30 13:44:15','','0'),('20cd386ab2e24c099510a610e039b195','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','gaojie','d869b855cc83b194f8dc9474f6356fe09564b8b5e1ec4a1de1fd19ba','7003','仪器降级/报废人','','','','','','0:0:0:0:0:0:0:1','2015-07-01 15:16:42','1','1','2015-07-01 15:11:05','1','2015-07-01 15:11:05','','0'),('2328396b33ee435bae5a4b3bfaddf54f','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','zhangli','49a308921ad43dcb71ad4af0e8cb7dd2bba366e9270b7fc9e5dae775','7001','仪器维修人','','','','','','0:0:0:0:0:0:0:1','2015-07-01 15:14:20','1','1','2015-07-01 15:09:57','1','2015-07-01 15:09:57','','0'),('2b6898829355496a8b7fd88d48586be6','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','zhangsan','19533eaa4c0418671adb205accf9cc74d6840688150132bfface5063','112','张三','','','','3','','0:0:0:0:0:0:0:1','2015-06-30 15:50:04','1','1','2015-06-08 13:23:37','1','2015-06-08 13:25:08','','0'),('3','1','3','sd_zhb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0003','综合部',NULL,NULL,NULL,NULL,NULL,'0:0:0:0:0:0:0:1','2015-04-25 15:03:21','1','1','2013-05-27 08:00:00','1','2015-04-25 13:22:49',NULL,'0'),('35f45ac7089e4fafa0bbd3d4ef704dff','1','2','chenghua','5336ea88cb3072ddfd529a40c66266c39064719c2d4899d7126aa5d1','7004','仪器降级/报废审批人','','','','','','0:0:0:0:0:0:0:1','2015-07-01 15:17:09','1','1','2015-07-01 15:11:29','1','2015-07-01 15:11:29','','0'),('3fd2e4b370ec45fd9347d023baaac558','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','lixiang','ee2f64f58fda49d788fcae68554be82497c6e432ed0edb3d520ea6fa','111','李湘','','','','3','','0:0:0:0:0:0:0:1','2015-06-30 15:57:47','1','1','2015-06-08 13:15:32','1','2015-06-30 11:04:59','','0'),('4','1','4','sd_scb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0004','市场部','','','1','','',NULL,NULL,'1','1','2013-05-27 08:00:00','1','2015-05-18 17:25:05','','0'),('5','1','5','sd_jsb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0005','技术部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('586d46b5fe564111bef8610bc9f5472b','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','zhaowei','75eaf969f886bb03146a0e577f7dc14eea9a7bcab03ce77ffc8dcf45','7002','仪器维修审批人','','','','','','0:0:0:0:0:0:0:1','2015-07-01 15:14:52','1','1','2015-07-01 15:10:32','1','2015-07-01 15:10:32','','0'),('59cf2d9ee33b4e4f9f133d3deb9570fa','1','2','mawu','7ca0c50f60efaf12bd01aed339e74187adbd3d4e0426d93f20ec8acd','115','马五','','','','3','','0:0:0:0:0:0:0:1','2015-06-30 15:57:14','1','1','2015-06-08 13:24:58','1','2015-06-08 13:24:58','','0'),('6','1','6','sd_yfb','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0006','研发部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60e4211791c84d4db1c3d8f6eaf59de4','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','demo','8fa77e6a6e7489b1767db018741ca513277f35e4844dae48878ef506','1','系统管理员','','','','3','','10.21.22.1','2015-05-22 16:55:11','1','1','2015-05-21 17:07:06','1','2015-05-22 09:05:52','','0'),('9bba3deb05ec40a5989e64588ba91cc0','54ec081ed00a447a8c09961e0ce1acc8','25412c1ef4c047868860b9859b36ae46','lisi','ae0924d908efce2aab64063102b34050d1c9ed052c5adf9c2571f05e','113','李四','','','','3','','0:0:0:0:0:0:0:1','2015-06-30 15:49:32','1','1','2015-06-08 13:24:11','1','2015-06-08 13:25:20','','0'),('aac8925a0f6c4a2cbb874fe890c5839a','1','25412c1ef4c047868860b9859b36ae46','lijian','a44785321a7b0c08e091e224178205a16f3ded17a35d931716a73ffb','0506001','仪器管理员','','','','3','','0:0:0:0:0:0:0:1','2015-07-01 15:17:22','1','1','2015-06-04 14:09:00','1','2015-06-30 15:31:49','','0'),('b84c2f90d7ee4697883198aac8e90df8','1','25412c1ef4c047868860b9859b36ae46','huaqiang','b52e9da1665cc36b8eac8896f4668410a0abb3a3f550cec032b5a54b','0506002','仪器借用申请审批人','','','','3','','10.46.2.94','2015-06-30 15:33:56','1','1','2015-06-04 14:10:00','1','2015-06-30 15:33:24','','0'),('d3c1f3ea6d0f404fb4eef1c13260f553','22','24','ljhai','35634e311bf6a32e0c4348b64c31d6755949b60c5030838387ee7bbf','嘎嘎嘎','李久海','','','','','',NULL,NULL,'1','b69d0c605aee4526a0039f8d999361b3','2015-04-23 14:39:17','b69d0c605aee4526a0039f8d999361b3','2015-04-23 14:39:17','','0'),('d42b66c65cf149dba833e0839d6400b4','1','25412c1ef4c047868860b9859b36ae46','wangfeng','98227617eae1a0ddb9abc3a325d707fae5b0cb79e720962755cd41ae','0506003','仪器借用人','','','','3','','0:0:0:0:0:0:0:1','2015-07-01 15:15:09','1','1','2015-06-04 15:48:51','1','2015-06-30 15:32:47','','0');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES ('054437e904b74cbc97696b2e25e5f88b','0df038d9138a428ebb901367951edd4e'),('1','1'),('1','2'),('10','2'),('10402383c5da43db970ff64fdd1d2376','0df038d9138a428ebb901367951edd4e'),('11','3'),('12','4'),('13','5'),('14','6'),('2','1'),('20cd386ab2e24c099510a610e039b195','66eb91788fd74fedad045a64af70512b'),('2328396b33ee435bae5a4b3bfaddf54f','21ac2c5fb3554e44a210b072af968a6b'),('2b6898829355496a8b7fd88d48586be6','13d47db92fe74c4194fb13a181d9d1d0'),('3','2'),('3','5d3b32dd0cf743618dcc44f92fa9546c'),('35f45ac7089e4fafa0bbd3d4ef704dff','93dc5c9814534369b4b3c2d165376fef'),('3fd2e4b370ec45fd9347d023baaac558','cc35e8fe019440b3a64bfba41a89331a'),('4','3'),('5','4'),('586d46b5fe564111bef8610bc9f5472b','4ef5f5ec4fc64d0ba60b01ff715740ae'),('59cf2d9ee33b4e4f9f133d3deb9570fa','509e55188a034f67b20761e5db8adbb5'),('6','5'),('60e4211791c84d4db1c3d8f6eaf59de4','5d3b32dd0cf743618dcc44f92fa9546c'),('7','2'),('7','7'),('73ab8671a4fb404589ecc42115568e4c','0df038d9138a428ebb901367951edd4e'),('8','6'),('9','1'),('9bba3deb05ec40a5989e64588ba91cc0','13d47db92fe74c4194fb13a181d9d1d0'),('aac8925a0f6c4a2cbb874fe890c5839a','64c51ff2129142bfbb18570e19e146cf'),('b69d0c605aee4526a0039f8d999361b3','0df038d9138a428ebb901367951edd4e'),('b84c2f90d7ee4697883198aac8e90df8','5525a6248bd24defa5716e78e90e7527'),('d3c1f3ea6d0f404fb4eef1c13260f553','0df038d9138a428ebb901367951edd4e'),('d42b66c65cf149dba833e0839d6400b4','76888a683b96489eab3b7258569fa7a0'),('ffc8d3736566453aa1a6284cb3c36f6e','0df038d9138a428ebb901367951edd4e');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data`
--

DROP TABLE IF EXISTS `test_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data`
--

LOCK TABLES `test_data` WRITE;
/*!40000 ALTER TABLE `test_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data_child`
--

DROP TABLE IF EXISTS `test_data_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data_child`
--

LOCK TABLES `test_data_child` WRITE;
/*!40000 ALTER TABLE `test_data_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data_main`
--

DROP TABLE IF EXISTS `test_data_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_data_main` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data_main`
--

LOCK TABLES `test_data_main` WRITE;
/*!40000 ALTER TABLE `test_data_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_tree`
--

DROP TABLE IF EXISTS `test_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_tree` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='树结构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_tree`
--

LOCK TABLES `test_tree` WRITE;
/*!40000 ALTER TABLE `test_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_tree` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-01 15:20:16
