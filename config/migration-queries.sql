ALTER TABLE ACCOUNT DROP COLUMN STRING_ID;

ALTER TABLE COMMODITY_CODE DROP COLUMN
STRING_ID;

ALTER TABLE ACCOUNT_TRANSACTION DROP COLUMN
STRING_ID;

ALTER TABLE FISCAL_YEAR DROP COLUMN
STRING_ID;

ALTER TABLE BANK DROP COLUMN
STRING_ID;

ALTER TABLE BUDGET DROP COLUMN
STRING_ID;

ALTER TABLE COMPANY DROP COLUMN
STRING_ID;

ALTER TABLE COMPANY_NOMINAL_CODE_RANGE DROP COLUMN
STRING_ID;
	
	
ALTER TABLE CREDITRATING DROP COLUMN
STRING_ID;

	
ALTER TABLE CURRENCY DROP COLUMN
STRING_ID;


ALTER TABLE CUSTOMER_GROUP DROP COLUMN
STRING_ID;	
	
ALTER TABLE ITEM DROP COLUMN
STRING_ID;	
	
ALTER TABLE TAX_ITEM_GROUPS DROP COLUMN
STRING_ID;	

	
ALTER TABLE ITEMGROUP DROP COLUMN
STRING_ID;	

ALTER TABLE PAYEE DROP COLUMN
STRING_ID;		
	
ALTER TABLE PAYMENTTERMS DROP COLUMN
STRING_ID;		

ALTER TABLE PRICELEVEL DROP COLUMN
STRING_ID;	

ALTER TABLE SHIPPINGMETHOD DROP COLUMN
STRING_ID;	
	
ALTER TABLE SHIPPINGTERMS DROP COLUMN
STRING_ID;		
	
ALTER TABLE TAXRATES DROP COLUMN
STRING_ID;		

ALTER TABLE TAX_RATE_CALCULATION DROP COLUMN
STRING_ID;	
	
ALTER TABLE ITEM_BACK_UP DROP COLUMN
STRING_ID;	

ALTER TABLE UNIT_OF_MEASURE COLUMN
STRING_ID;
	
	
ALTER TABLE USERS COLUMN
STRING_ID;

ALTER TABLE VENDOR_GROUP COLUMN
STRING_ID;	

ALTER TABLE FIXED_ASSET COLUMN
STRING_ID;		

ALTER TABLE DEPRECIATION COLUMN
STRING_ID;	
	
ALTER TABLE FIXED_ASSET_HISTORY COLUMN
STRING_ID;
	
ALTER TABLE FIXED_ASSET_NOTE COLUMN
STRING_ID;
	
	
ALTER TABLE VATRETURNBOX COLUMN
STRING_ID;
	
ALTER TABLE BOX COLUMN
STRING_ID;

ALTER TABLE TAX_CODE COLUMN
STRING_ID;

ALTER TABLE BRANDING_THEME COLUMN
STRING_ID;

ALTER TABLE TRANSACTION COLUMN
STRING_ID;	
	
	
ALTER TABLE ENTRY COLUMN
STRING_ID;		

ALTER TABLE CREDITS_AND_PAYMENTS COLUMN
STRING_ID;
	
ALTER TABLE TRANSACTION_MAKE_DEPOSIT COLUMN
STRING_ID;
	
	
ALTER TABLE TRANSACTION_PAYBILL COLUMN
STRING_ID;

ALTER TABLE TRANSACTION_RECEIVE_PAYMENT COLUMN
STRING_ID;
	
ALTER TABLE TRANSACTION_ISSUE_PAYMENT COLUMN
STRING_ID;	

ALTER TABLE TRANSACTION_PAY_SALES_TAX COLUMN
STRING_ID;	
	
ALTER TABLE TRANSACTION_PAY_VAT COLUMN
STRING_ID;	
	
ALTER TABLE TRANSACTION_RECEIVE_VAT COLUMN
STRING_ID;	
	
ALTER TABLE PAY_SALES_TAX_ENTRIES COLUMN
STRING_ID;	
	
	
ALTER TABLE PAY_VAT_ENTRIES COLUMN
STRING_ID;	

ALTER TABLE TRANSACTION_MAKE_DEPOSIT_ENTRIES COLUMN
STRING_ID;	
	
ALTER TABLE TRANSACTION_EXPENSE COLUMN
STRING_ID;	
	
ALTER TABLE TRANSACTION_PAY_EXPENSE COLUMN
STRING_ID;		
	


ALTER TABLE ITEM 
ADD COLUMN `MIN_STOCK_ALERT_LEVEL` int(11) default NULL,
ADD COLUNM `MAX_STOCK_ALERT_LEVEL` int(11) default NULL,
ADD  CONSTRAINT `FK227313CF909FD3` FOREIGN KEY (`MEASUREMENT`) REFERENCES `measurement` (`ID`);

ALTER TABLE USERS
ADD COLUMN `PASSWORD` varchar(255) default NULL,
ADD COLUMN `PHONE_NO` varchar(255) default NULL,
ADD COLUMN `COUNTRY_NAME` varchar(255) default NULL;


ALTER TABLE TRANSACTION_ITEM 
CHANGE COLUMN  `QUANTITY` `QTY_VALUE` double default NULL,
ADD CONSTRAINT `FK30714BF446AE6EF6` FOREIGN KEY (`QTY_UNIT`) REFERENCES `unit` (`ID`);



-- ADDED NOT NULL
ALTER TABLE accounter.ACCOUNT
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.COMMODITY_CODE
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.BANK
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.COMPANY
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.CREDITRATING
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.CURRENCY
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.CUSTOMER_GROUP
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.ITEM
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.TAX_ITEM_GROUPS
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.ITEMGROUP
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.PAYEE
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.PAYMENTTERMS
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.PRICELEVEL
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.SHIPPINGMETHOD
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.SHIPPINGTERMS
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.UNIT_OF_MEASURE
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.VENDOR_GROUP
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.FIXED_ASSET
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.VATRETURNBOX
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.BOX
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.TAX_CODE
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

ALTER TABLE accounter.BRANDING_THEME
MODIFY COLUMN NAME varchar(255) NOT NULL UNIQUE;

--	NEW TABLES

DROP TABLE IF EXISTS `accounter`.`warehouse`;
CREATE TABLE  `accounter`.`warehouse` (
  `ID` bigint(20) NOT NULL auto_increment,
  `NAME` varchar(255) NOT NULL,
  `CREATED_BY` varchar(255) default NULL,
  `LAST_MODIFIER` varchar(255) default NULL,
  `CREATED_DATE` bigint(20) default NULL,
  `LAST_MODIFIED_DATE` bigint(20) default NULL,
  `TYPE` int(11) NOT NULL,
  `ADDRESS1` varchar(100) NOT NULL,
  `STREET` varchar(100) NOT NULL,
  `CITY` varchar(100) NOT NULL,
  `STATE` varchar(100) NOT NULL,
  `ZIP` varchar(100) NOT NULL,
  `COUNTRY` varchar(100) NOT NULL,
  `IS_SELECTED` bit(1) NOT NULL,
  `COMPANY_CONTACT__IS_PRIMARY` bit(1) NOT NULL,
  `COMPANY_CONTACT__NAME` varchar(255) NOT NULL,
  `COMPANY_CONTACT__TITLE` varchar(255) NOT NULL,
  `COMPANY_CONTACT__BUSINESS_PHONE` varchar(255) NOT NULL,
  `COMPANY_CONTACT_EMAIL` varchar(255) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `accounter`.`item_status`;
CREATE TABLE  `accounter`.`item_status` (
  `ID` bigint(20) NOT NULL auto_increment,
  `ITEM_ID` bigint(20) default NULL,
  `QTY_VALUE` double default NULL,
  `UNIT` bigint(20) default NULL,
  `WAREHOUSE` bigint(20) NOT NULL,
  `VALUE` double default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK64D429EA041AB0D` (`UNIT`),
  KEY `FK64D429E1E282CDF` (`ITEM_ID`),
  KEY `FK64D429E984DB8A1` (`WAREHOUSE`),
  CONSTRAINT `FK64D429E984DB8A1` FOREIGN KEY (`WAREHOUSE`) REFERENCES `warehouse` (`ID`),
  CONSTRAINT `FK64D429E1E282CDF` FOREIGN KEY (`ITEM_ID`) REFERENCES `item` (`ID`),
  CONSTRAINT `FK64D429EA041AB0D` FOREIGN KEY (`UNIT`) REFERENCES `unit` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `accounter`.`adjustment_reason`;
CREATE TABLE  `accounter`.`adjustment_reason` (
  `ID` bigint(20) NOT NULL auto_increment,
  `SECTION` varchar(255) default NULL,
  `NAME` varchar(255) default NULL,
  `CREATED_BY` varchar(255) default NULL,
  `LAST_MODIFIER` varchar(255) default NULL,
  `CREATED_DATE` bigint(20) default NULL,
  `LAST_MODIFIED_DATE` bigint(20) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `accounter`.`measurement`;
CREATE TABLE  `accounter`.`measurement` (
  `ID` bigint(20) NOT NULL auto_increment,
  `NAME` varchar(255) default NULL,
  `DESCRIPTION` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `accounter`.`unit`;
CREATE TABLE  `accounter`.`unit` (
  `ID` bigint(20) NOT NULL auto_increment,
  `TYPE` varchar(255) default NULL,
  `FACTOR` double default NULL,
  `MEASUREMENT` bigint(20) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK27D1843B9DD132` (`ID`),
  KEY `FK27D184CF909FD3` (`MEASUREMENT`),
  CONSTRAINT `FK27D184CF909FD3` FOREIGN KEY (`MEASUREMENT`) REFERENCES `measurement` (`ID`),
  CONSTRAINT `FK27D1843B9DD132` FOREIGN KEY (`ID`) REFERENCES `measurement` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `accounter`.`stock_adjustment_item`;
CREATE TABLE  `accounter`.`stock_adjustment_item` (
  `ID` bigint(20) NOT NULL auto_increment,
  `ADJUSTMENT_PRICE_VALUE` double default NULL,
  `ADJUSTMENT_QTY` double default NULL,
  `COMMENT` varchar(255) default NULL,
  `ITEM` bigint(20) default NULL,
  `QTY_BEFORE_TRANSACTION` double default NULL,
  `REASON` bigint(20) default NULL,
  `WAREHOUSE` bigint(20) default NULL,
  `STOCK_ADJUSTMENT` bigint(20) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK6034D75CA036EE2B` (`ITEM`),
  KEY `FK6034D75CF58BC234` (`STOCK_ADJUSTMENT`),
  KEY `FK6034D75C8F9890DA` (`REASON`),
  KEY `FK6034D75C984DB8A1` (`WAREHOUSE`),
  CONSTRAINT `FK6034D75C984DB8A1` FOREIGN KEY (`WAREHOUSE`) REFERENCES `warehouse` (`ID`),
  CONSTRAINT `FK6034D75C8F9890DA` FOREIGN KEY (`REASON`) REFERENCES `adjustment_reason` (`ID`),
  CONSTRAINT `FK6034D75CA036EE2B` FOREIGN KEY (`ITEM`) REFERENCES `item` (`ID`),
  CONSTRAINT `FK6034D75CF58BC234` FOREIGN KEY (`STOCK_ADJUSTMENT`) REFERENCES `stock_adjustment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `accounter`.`stock_transfer`;
CREATE TABLE  `accounter`.`stock_transfer` (
  `ID` bigint(20) NOT NULL,
  `FROM_WAREHOUSE` bigint(20) default NULL,
  `TO_WAREHOUSE` bigint(20) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FKE77B4F142FACBE4C` (`FROM_WAREHOUSE`),
  KEY `FKE77B4F144B3723DD` (`TO_WAREHOUSE`),
  CONSTRAINT `FKE77B4F144B3723DD` FOREIGN KEY (`TO_WAREHOUSE`) REFERENCES `warehouse` (`ID`),
  CONSTRAINT `FKE77B4F142FACBE4C` FOREIGN KEY (`FROM_WAREHOUSE`) REFERENCES `warehouse` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

