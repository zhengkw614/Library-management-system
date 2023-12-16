PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS "alembic_version";
CREATE TABLE "alembic_version" (
  "version_num" VARCHAR(32) NOT NULL,
  CONSTRAINT "alembic_version_pkc" PRIMARY KEY ("version_num")
);

-- ----------------------------
-- Records of alembic_version
-- ----------------------------
INSERT INTO "alembic_version" VALUES ('3bc843aedd89');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS "books";
CREATE TABLE "books" (
  "isbn" INTEGER NOT NULL,
  "name" VARCHAR(128),
  "author" VARCHAR(64),
  "press" VARCHAR(64),
  "category" INTEGER,
  "intro" VARCHAR(512),
  "location" VARCHAR(64),
  "cover" VARCHAR(256),
  PRIMARY KEY ("isbn"),
  UNIQUE ("isbn" ASC)
);

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO "books" VALUES (1247571522, '平凡的世界', '路遥', '北京十月文艺出版社', 5, ' 本书是一部全景式地表现中国当代城乡社会生活的长篇小说。', '103', 'http://127.0.0.1:5000/static/img/cover/pinfan21_03_05_01_38_09.jpg');
INSERT INTO "books" VALUES (21321543546, 'Flask web 开发实战', '李辉', '机械工业出版社', 1, 'Flask开发入门', '102', 'http://127.0.0.1:5000/static/img/cover/书籍封面21_03_05_08_59_53.jpg');
INSERT INTO "books" VALUES (32432565613, '信号与系统', '郑钧里', '清华大学出版社', 0, '通信基础知识', '102', 'http://127.0.0.1:5000/static/img/cover/xinhao21_03_05_09_02_42.jpg');
INSERT INTO "books" VALUES (9787115257284, '好学、好用、好玩的Photoshop 写给初学者的入门书', '李金明', '人民邮电出版社', 7, 'PS入门书籍', '102', 'http://127.0.0.1:5000/static/img/cover/s680071321_03_05_09_05_07.jpg');
INSERT INTO "books" VALUES (9787115447395, '超级网红', '于晓华', '人民邮电出版社', 5, '网红经济日益发酵...', '102', 'http://127.0.0.1:5000/static/img/cover/超级网红21_03_05_00_55_36.jpg');
INSERT INTO "books" VALUES (9787516644188, '悦己', '郝言言', '新华出版社', 5, '在生活中，在爱情中，如何取悦自己，如何找到自己的价值？《悦己》是一本写给女性的励志书籍，旨在帮助那些迷失在生活、爱情中的女人找到自我，学会取悦自己、接纳自己、欣赏自己。', '103', 'http://127.0.0.1:5000/static/img/cover/悦己21_03_05_00_58_31.jpg');

-- ----------------------------
-- Table structure for librarys
-- ----------------------------
DROP TABLE IF EXISTS "librarys";
CREATE TABLE "librarys" (
  "book_id" INTEGER NOT NULL,
  "isbn_id" INTEGER,
  "location" VARCHAR(64),
  "status" INTEGER,
  "borrower_id" INTEGER,
  "start_date" FLOAT,
  "end_date" FLOAT,
  "readyto_borrow" INTEGER,
  "readyto_return" INTEGER,
  PRIMARY KEY ("book_id"),
  FOREIGN KEY ("isbn_id") REFERENCES "books" ("isbn") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("borrower_id") REFERENCES "users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  UNIQUE ("book_id" ASC)
);

-- ----------------------------
-- Records of librarys
-- ----------------------------
INSERT INTO "librarys" VALUES (10000, 9787115447395, '102', 1, 100001, 1614879231.73544, 1622655231.73544, 0, 0);
INSERT INTO "librarys" VALUES (100003, 9787516644188, '103', 1, 100002, 1614879175.40851, 1622655175.40851, 0, 0);
INSERT INTO "librarys" VALUES (100008, 21321543546, '102', 0, 0, 0.0, 0.0, 1, 0);
INSERT INTO "librarys" VALUES (1000004, 1247571522, '103', 1, 100004, 1614879577.26975, 1622655577.26975, 0, 0);
INSERT INTO "librarys" VALUES (1000005, 9787115257284, '103', 0, 0, 0.0, 0.0, 0, 0);
INSERT INTO "librarys" VALUES (1000013, 32432565613, '102', 0, 0, 0.0, 0.0, 1, 0);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS "log";
CREATE TABLE "log" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "uid" int,
  "content" text,
  "date" datetime
);

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO "log" VALUES (2, 1, '管理员登录了系统', '2022-05-23 01:02:21.647663');
INSERT INTO "log" VALUES (3, 100002, '用户 peiqi 登录了系统', '2022-05-23 01:05:16.525219');
INSERT INTO "log" VALUES (4, 100002, '用户 peiqi 搜索了一本书', '2022-05-23 01:13:12.428786');
INSERT INTO "log" VALUES (5, 100002, '用户 peiqi 借阅了一本书', '2022-05-23 01:13:30.150130');
INSERT INTO "log" VALUES (6, 100002, '用户 peiqi 退出了系统', '2022-05-23 01:14:30.520871');
INSERT INTO "log" VALUES (7, 1, '用户 admin 登录了系统', '2022-05-23 01:15:07.050040');
INSERT INTO "log" VALUES (8, 1, '用户 admin 登录了系统', '2022-05-23 01:22:53.423846');
INSERT INTO "log" VALUES (9, 1, '用户 admin 退出了系统', '2022-05-23 02:39:29.182605');
INSERT INTO "log" VALUES (10, 100002, '用户 peiqi 登录了系统', '2022-05-23 02:39:33.875506');
INSERT INTO "log" VALUES (11, 100002, '用户 peiqi 退出了系统', '2022-05-23 02:42:34.807138');
INSERT INTO "log" VALUES (12, 100002, '用户 peiqi 登录了系统', '2022-05-23 02:42:39.681744');
INSERT INTO "log" VALUES (13, 100002, '用户 peiqi 退出了系统', '2022-05-23 02:50:02.663093');
INSERT INTO "log" VALUES (14, 1, '用户 admin 登录了系统', '2022-05-23 02:50:08.793090');
INSERT INTO "log" VALUES (15, 1, '用户 admin 退出了系统', '2022-05-23 02:55:54.842618');
INSERT INTO "log" VALUES (16, 100002, '用户 peiqi 登录了系统', '2022-05-23 02:56:01.072891');
INSERT INTO "log" VALUES (17, 100002, '用户 peiqi 退出了系统', '2022-05-23 03:12:33.722213');
INSERT INTO "log" VALUES (18, 1, '用户 admin 登录了系统', '2022-05-23 03:12:39.358057');
INSERT INTO "log" VALUES (19, 1, '用户 admin 退出了系统', '2022-05-23 03:14:12.128329');
INSERT INTO "log" VALUES (20, 100002, '用户 peiqi 登录了系统', '2022-05-23 03:14:17.457457');
INSERT INTO "log" VALUES (21, 100002, '用户 peiqi 退出了系统', '2022-05-23 03:14:52.529735');
INSERT INTO "log" VALUES (22, 1, '用户 admin 登录了系统', '2022-05-23 03:14:57.037452');
INSERT INTO "log" VALUES (23, 1, '用户 admin 退出了系统', '2022-05-23 03:15:49.387049');
INSERT INTO "log" VALUES (24, 100002, '用户 peiqi 登录了系统', '2022-05-23 03:15:55.229680');
INSERT INTO "log" VALUES (25, 100002, '用户 peiqi 退出了系统', '2022-05-23 03:16:05.148395');
INSERT INTO "log" VALUES (26, 1, '用户 admin 登录了系统', '2022-05-23 03:16:55.082313');
INSERT INTO "log" VALUES (27, 1, '用户 admin 登录了系统', '2022-05-27 13:32:44.365615');
INSERT INTO "log" VALUES (28, 1, '用户 admin 退出了系统', '2022-05-27 13:50:08.113118');
INSERT INTO "log" VALUES (29, 100002, '用户 peiqi 登录了系统', '2022-05-27 13:50:19.926604');
INSERT INTO "log" VALUES (30, 100002, '用户 peiqi 退出了系统', '2022-05-27 13:53:54.789717');
INSERT INTO "log" VALUES (31, 1, '用户 admin 登录了系统', '2022-05-27 13:54:05.502836');
INSERT INTO "log" VALUES (32, 1, '用户 admin 退出了系统', '2022-05-27 13:54:41.592123');
INSERT INTO "log" VALUES (33, 1, '用户 admin 登录了系统', '2022-05-27 15:52:45.981412');
INSERT INTO "log" VALUES (34, 1, '用户 admin 登录了系统', '2022-05-27 15:59:36.027444');
INSERT INTO "log" VALUES (35, 1, '用户 admin 登录了系统', '2022-05-27 23:27:30.318577');
INSERT INTO "log" VALUES (36, 1, '用户 admin 登录了系统', '2022-05-27 23:46:30.728878');
INSERT INTO "log" VALUES (37, 1, '用户 admin 登录了系统', '2022-05-28 00:10:24.013572');

-- ----------------------------
-- Table structure for requests
-- ----------------------------
DROP TABLE IF EXISTS "requests";
CREATE TABLE "requests" (
  "id" INTEGER NOT NULL,
  "book_id" INTEGER,
  "opcode" INTEGER,
  "requester" INTEGER,
  "requestdate" FLOAT,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("book_id") REFERENCES "books" ("isbn") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("requester") REFERENCES "users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  UNIQUE ("id" ASC)
);

-- ----------------------------
-- Records of requests
-- ----------------------------
INSERT INTO "requests" VALUES (1, 1000013, 0, 100002, 1651488739.51289);
INSERT INTO "requests" VALUES (2, 100008, 0, 100002, 1653239610.13911);

-- ----------------------------
-- Table structure for sqlite_sequence
-- ----------------------------
DROP TABLE IF EXISTS "sqlite_sequence";
CREATE TABLE "sqlite_sequence" (
  "name",
  "seq"
);

-- ----------------------------
-- Records of sqlite_sequence
-- ----------------------------
INSERT INTO "sqlite_sequence" VALUES ('log', 37);

-- ----------------------------
-- Table structure for statics
-- ----------------------------
DROP TABLE IF EXISTS "statics";
CREATE TABLE "statics" (
  "mon" INTEGER NOT NULL,
  "book_data" INTEGER,
  "reader_data" INTEGER,
  PRIMARY KEY ("mon"),
  UNIQUE ("mon" ASC)
);

-- ----------------------------
-- Records of statics
-- ----------------------------
INSERT INTO "statics" VALUES (1, 0, 0);
INSERT INTO "statics" VALUES (2, 0, 0);
INSERT INTO "statics" VALUES (3, 6, 3);
INSERT INTO "statics" VALUES (4, 0, 0);
INSERT INTO "statics" VALUES (5, 0, 3);
INSERT INTO "statics" VALUES (6, 0, 3);
INSERT INTO "statics" VALUES (7, 0, 0);
INSERT INTO "statics" VALUES (8, 0, 0);
INSERT INTO "statics" VALUES (9, 0, 0);
INSERT INTO "statics" VALUES (10, 0, 0);
INSERT INTO "statics" VALUES (11, 0, 0);
INSERT INTO "statics" VALUES (12, 0, 0);

-- ----------------------------
-- Table structure for sysinfo
-- ----------------------------
DROP TABLE IF EXISTS "sysinfo";
CREATE TABLE "sysinfo" (
  "id" INTEGER NOT NULL,
  "maxuser" INTEGER,
  "maxbook" INTEGER,
  "maxtime" INTEGER,
  PRIMARY KEY ("id"),
  UNIQUE ("id" ASC)
);

-- ----------------------------
-- Records of sysinfo
-- ----------------------------
INSERT INTO "sysinfo" VALUES (1, 100, 5, 3);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "users";
CREATE TABLE "users" (
  "id" INTEGER NOT NULL,
  "username" VARCHAR(64),
  "password_hash" VARCHAR(128),
  "name" VARCHAR(64),
  "gender" INTEGER,
  "depart" VARCHAR(128),
  "post" VARCHAR(64),
  "contact" VARCHAR(64),
  "room" VARCHAR(64),
  "user_type" INTEGER,
  "avata" VARCHAR(256),
  PRIMARY KEY ("id"),
  UNIQUE ("id" ASC)
);

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "users" VALUES (1, 'admin', 'pbkdf2:sha256:150000$RjRNPJLj$1f382ddf07060d1224e4ed3616e900261a75d501884a7605252cb747c08f5599', '管理员', 1, '办公室', '助理', '13567892132', '12栋201', 0, 'http://127.0.0.1:5000/static/img/avata/avata321_03_05_00_59_56.jpg');
INSERT INTO "users" VALUES (100001, 'liming', 'pbkdf2:sha256:150000$ImrK3CTJ$b5bfd84bf1c3d1bc8c684285e540481c946773589ae72cc8e711934aee25c1a6', '李明', 1, '计算机系', '硕士', '13626526733', '13栋203', 1, 'http://127.0.0.1:5000/static/img/avata/avata321_03_05_00_59_56.jpg');
INSERT INTO "users" VALUES (100002, 'peiqi', 'pbkdf2:sha256:150000$dISCVHTF$b345144cf9619c9c4e0f14fcee2c562a54f00ea9aa45cf3e3f35e6c8a19a5a14', '佩奇', 1, '经济系', '闲人', '14562652673', '16栋202', 1, 'http://127.0.0.1:5000/static/img/avata/peiqi21_03_05_01_16_22.jpg');
INSERT INTO "users" VALUES (100004, 'mayi', 'pbkdf2:sha256:150000$xHpzN8ir$537e971237d53f1cdb710dfa74ce534cc32e569761377a758bf6f7701c4d1f63', '蚂蚁', 1, '计算机系', '博士', '13626776733', '12栋203', 1, 'http://127.0.0.1:5000/static/img/avata/starwar21_03_05_01_39_11.jpg');
INSERT INTO "users" VALUES (1000013, 'tom', 'pbkdf2:sha256:150000$2k47cLyL$1b43c7a0d2a13c80f4aad5aec18ea65de2895ae0183dbffdf9bc347f7014802f', '汤姆', 1, '外语系', '本科', '13626523933', '16栋302', 1, 'http://127.0.0.1:5000/static/img/avata/avata221_03_06_22_47_38.jpg');

-- ----------------------------
-- Table structure for votechoices
-- ----------------------------
DROP TABLE IF EXISTS "votechoices";
CREATE TABLE "votechoices" (
  "id" INTEGER NOT NULL,
  "vote_id" INTEGER,
  "choice" VARCHAR(256),
  "code" INTEGER,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("vote_id") REFERENCES "votes" ("") ON DELETE NO ACTION ON UPDATE NO ACTION,
  UNIQUE ("id" ASC)
);

-- ----------------------------
-- Records of votechoices
-- ----------------------------
INSERT INTO "votechoices" VALUES (1, 1, '满意', 1);
INSERT INTO "votechoices" VALUES (2, 1, '基本满意', 2);
INSERT INTO "votechoices" VALUES (3, 1, '不满意', 3);

-- ----------------------------
-- Table structure for voterecords
-- ----------------------------
DROP TABLE IF EXISTS "voterecords";
CREATE TABLE "voterecords" (
  "id" INTEGER NOT NULL,
  "user_id" INTEGER,
  "vote_id" INTEGER,
  "result" INTEGER,
  "date" DATETIME,
  PRIMARY KEY ("id"),
  FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("vote_id") REFERENCES "votes" ("") ON DELETE NO ACTION ON UPDATE NO ACTION,
  UNIQUE ("id" ASC)
);

-- ----------------------------
-- Records of voterecords
-- ----------------------------
INSERT INTO "voterecords" VALUES (1, 100002, 1, 2, '2022-05-23 03:16:01.408066');

-- ----------------------------
-- Table structure for votes
-- ----------------------------
DROP TABLE IF EXISTS "votes";
CREATE TABLE "votes" (
  "id" INTEGER NOT NULL,
  "title" VARCHAR(256),
  "content" TEXT,
  "total_choice" INTEGER,
  "max_choice" INTEGER,
  "start_time" DATETIME,
  "end_time" DATETIME,
  PRIMARY KEY ("id"),
  UNIQUE ("id" ASC)
);

-- ----------------------------
-- Records of votes
-- ----------------------------
INSERT INTO "votes" VALUES (1, '你对食堂的菜满意吗', '你对食堂的菜满意吗', 3, 1, '2022-05-23 03:15:42.300820', '2022-05-26 00:00:00.000000');

-- ----------------------------
-- Indexes structure for table books
-- ----------------------------
CREATE INDEX "ix_books_author"
ON "books" (
  "author" ASC
);
CREATE INDEX "ix_books_name"
ON "books" (
  "name" ASC
);

-- ----------------------------
-- Auto increment value for log
-- ----------------------------
UPDATE "sqlite_sequence" SET seq = 37 WHERE name = 'log';

-- ----------------------------
-- Indexes structure for table log
-- ----------------------------
CREATE UNIQUE INDEX "log_id_uindex"
ON "log" (
  "id" ASC
);

-- ----------------------------
-- Indexes structure for table users
-- ----------------------------
CREATE INDEX "ix_users_name"
ON "users" (
  "name" ASC
);
CREATE UNIQUE INDEX "ix_users_username"
ON "users" (
  "username" ASC
);

PRAGMA foreign_keys = true;
