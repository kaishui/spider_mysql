drop table if exists DataModel;

drop table if exists Source;

drop table if exists SourceSpider;

drop table if exists SpiderColumn;

drop table if exists SpiderRegTemplate;

drop table if exists SpideredUrl;

drop table if exists Template;

drop table if exists TemplateDataModel;

drop table if exists TestUrl;

/*==============================================================*/
/* Table: DataModel                                             */
/*==============================================================*/
create table DataModel
(
   id                   int not null auto_increment,
   name                 varchar(32),
   tablename            varchar(32),
   creationdate         datetime,
   remark               varchar(512),
   primary key (id)
);

/*==============================================================*/
/* Table: Source                                                */
/*==============================================================*/
create table Source
(
   id                   int not null auto_increment,
   name                 varchar(32),
   url                  varchar(255),
   isused               bit,
   remark               varchar(512),
   primary key (id)
);

/*==============================================================*/
/* Table: SourceSpider                                          */
/*==============================================================*/
create table SourceSpider
(
   id                   int not null auto_increment,
   sourceid             int,
   templateid           int,
   spiderentryrule      varchar(1024),
   jobrule              varchar(128) comment 'quartz的cron语法',
   creationdate         datetime,
   remark               varchar(512),
   isused               bit,
   primary key (id)
);

alter table SourceSpider comment '多个源可以对应一个正则模版';

/*==============================================================*/
/* Table: SpiderColumn                                          */
/*==============================================================*/
create table SpiderColumn
(
   id                   int not null auto_increment,
   datamodelid          int,
   columnename          varchar(32),
   columncname          varchar(32),
   columntype           int comment '1.int
            2.decimal
            3.nvarchar
            4.datetime',
   columnlen            int,
   columnaccuracy       int,
   creationdate         datetime,
   remark               varchar(32),
   primary key (id)
);

/*==============================================================*/
/* Table: SpiderRegTemplate                                     */
/*==============================================================*/
create table SpiderRegTemplate
(
   id                   int not null auto_increment,
   templateid           int,
   parentid             int,
   typeid               int comment '0.过滤
            -1.
            
            
            >0.为抓取字段id',
   spiderreg            varchar(512),
   spiderorderby        int,
   isspiderentry        int,
   entryrule            varchar(1024),
   primary key (id)
);

/*==============================================================*/
/* Table: SpideredUrl                                           */
/*==============================================================*/
create table SpideredUrl
(
   id                   int not null auto_increment,
   domain               varchar(128),
   url                  varchar(512),
   spidereddate         datetime,
   primary key (id)
);

/*==============================================================*/
/* Table: Template                                              */
/*==============================================================*/
create table Template
(
   id                   int not null auto_increment,
   name                 varchar(32),
   creationdate         datetime,
   remark               varchar(512),
   primary key (id)
);

alter table Template comment '一个数据模型可以对应多个抓取正则模版';

/*==============================================================*/
/* Table: TemplateDataModel                                     */
/*==============================================================*/
create table TemplateDataModel
(
   id                   int not null auto_increment,
   templateid           int,
   datamodelid          int,
   primary key (id)
);

/*==============================================================*/
/* Table: TestUrl                                               */
/*==============================================================*/
create table TestUrl
(
   id                   int not null auto_increment,
   templateid           int,
   testurl              varchar(1024),
   testcontent          text,
   parentid             int,
   primary key (id)
);
