-- H2 2.3.232;
;             
CREATE USER IF NOT EXISTS "SA" SALT 'c29cc3f4478ae0c5' HASH '5cfe36321ced85452505743dec215f9a1643e97c61dcec46218ddc4c6851f565' ADMIN;         
CREATE MEMORY TABLE "PUBLIC"."CRYPTO_PRICE"(
    "ID" BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1 RESTART WITH 207) NOT NULL,
    "ASK_PRICE" NUMERIC(20, 8),
    "ASK_SIZE" NUMERIC(20, 8),
    "BID_PRICE" NUMERIC(20, 8),
    "BID_SIZE" NUMERIC(20, 8),
    "SYMBOL" CHARACTER VARYING(20) NOT NULL,
    "TIMESTAMP" TIMESTAMP(6) WITH TIME ZONE NOT NULL
);             
ALTER TABLE "PUBLIC"."CRYPTO_PRICE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_7" PRIMARY KEY("ID"); 
-- 206 +/- SELECT COUNT(*) FROM PUBLIC.CRYPTO_PRICE;          
INSERT INTO "PUBLIC"."CRYPTO_PRICE" VALUES
(1, 96040.07000000, 0.15562700, 96087.82000000, 1.38488000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:04:28.331217+00'),
(2, 3673.51000000, 2.68520000, 3673.85000000, 21.97960000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:04:28.333217+00'),
(3, 96042.18000000, 0.00819900, 96097.75000000, 4.00501000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:04:37.69234+00'),
(4, 3673.58000000, 2.36900000, 3674.32000000, 77.17860000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:04:37.694339+00'),
(5, 96052.30000000, 0.16563700, 96113.49000000, 3.09653000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:04:47.968009+00'),
(6, 3674.45000000, 0.06320000, 3674.98000000, 32.65720000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:04:47.970011+00'),
(7, 96063.64000000, 0.06251200, 96113.49000000, 4.28596000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:04:57.563212+00'),
(8, 3675.01000000, 0.55040000, 3675.70000000, 9.15230000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:04:57.564213+00'),
(9, 96070.00000000, 0.33176000, 96113.49000000, 3.49895000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:07.688461+00'),
(10, 3675.01000000, 62.53650000, 3675.45000000, 1.30170000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:07.689462+00'),
(11, 96071.73000000, 0.62027800, 96100.30000000, 0.35853000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:17.692675+00'),
(12, 3674.28000000, 4.44120000, 3674.53000000, 30.49430000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:17.693675+00'),
(13, 96047.59000000, 0.32537200, 96097.13000000, 0.37719000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:27.570976+00'),
(14, 3674.03000000, 1.82720000, 3674.51000000, 24.99420000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:27.572977+00'),
(15, 96047.59000000, 0.41157400, 96084.00000000, 2.32303000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:37.560654+00'),
(16, 3673.70000000, 42.40520000, 3674.08000000, 2.30960000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:37.562653+00'),
(17, 96036.34000000, 0.15456800, 96076.19000000, 0.00020000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:48.004868+00'),
(18, 3673.58000000, 0.00280000, 3673.60000000, 2.58270000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:48.005868+00'),
(19, 96019.56000000, 0.15446300, 96065.44000000, 3.32577000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:57.557093+00'),
(20, 3673.01000000, 3.50690000, 3673.57000000, 77.70070000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:05:57.558094+00'),
(21, 96021.39000000, 0.09643600, 96065.44000000, 5.10585000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:07.82769+00'),
(22, 3673.75000000, 3.01600000, 3674.32000000, 8.28200000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:07.828687+00'),
(23, 96019.11000000, 0.15102300, 96069.03000000, 0.72450000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:17.556892+00'),
(24, 3673.13000000, 4.19240000, 3674.48000000, 26.75030000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:17.557893+00'),
(25, 96023.45000000, 0.43693400, 96069.03000000, 4.81106000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:27.862421+00'),
(26, 3674.13000000, 2.70190000, 3674.45000000, 20.65700000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:27.863422+00'),
(27, 96023.45000000, 0.06397300, 96069.03000000, 2.88208000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:37.625857+00'),
(28, 3674.27000000, 3.60730000, 3674.40000000, 0.40430000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:37.626858+00'),
(29, 96023.45000000, 0.24978100, 96069.03000000, 3.34974000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:47.553915+00'),
(30, 3673.63000000, 88.43720000, 3673.82000000, 0.02810000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:47.555918+00'),
(31, 96023.45000000, 0.24978030, 96069.03000000, 2.44166000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:57.560216+00'),
(32, 3673.13000000, 3.49430000, 3673.62000000, 14.01670000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:57.562217+00');   
INSERT INTO "PUBLIC"."CRYPTO_PRICE" VALUES
(33, 96007.40000000, 0.28077500, 96036.51000000, 1.78840000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:08.168302+00'),
(34, 3673.13000000, 3.30060000, 3673.30000000, 0.53690000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:08.169304+00'),
(35, 95992.61000000, 0.48291600, 96027.61000000, 1.48125000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:17.631271+00'),
(36, 3671.03000000, 93.44830000, 3672.50000000, 0.02750000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:17.632273+00'),
(37, 95979.87000000, 0.00052000, 96043.99000000, 3.39480000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:27.629767+00'),
(38, 3670.37000000, 1.96120000, 3671.08000000, 0.00230000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:27.630768+00'),
(39, 96000.57000000, 0.24399000, 96043.99000000, 1.21230000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:37.558534+00'),
(40, 3670.37000000, 2.22920000, 3671.00000000, 0.02250000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:37.559534+00'),
(41, 95999.93000000, 0.15416200, 96043.99000000, 2.85126000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:47.569443+00'),
(42, 3670.31000000, 1.09110000, 3670.80000000, 26.60740000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:47.570442+00'),
(43, 95998.82000000, 0.06041500, 96054.52000000, 1.05755000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:57.628165+00'),
(44, 3670.17000000, 0.14190000, 3671.31000000, 17.71560000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:57.629166+00'),
(45, 96007.40000000, 0.25053500, 96054.48000000, 0.04980000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:07.759468+00'),
(46, 3670.57000000, 0.81720000, 3670.60000000, 2.59990000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:07.760468+00'),
(47, 96004.06000000, 0.25103700, 96052.52000000, 0.74368000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:17.568567+00'),
(48, 3669.56000000, 23.97470000, 3670.00000000, 0.02750000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:17.569567+00'),
(49, 96004.06000000, 0.24077800, 96031.23000000, 0.79845000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:28.228627+00'),
(50, 3669.36000000, 0.05040000, 3670.10000000, 18.93760000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:28.230629+00'),
(51, 95979.32000000, 0.13350700, 96031.23000000, 1.31452000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:37.565542+00'),
(52, 3669.66000000, 2.76890000, 3670.10000000, 11.61040000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:37.567544+00'),
(53, 95979.32000000, 0.13350700, 96022.34000000, 0.55095000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:47.555926+00'),
(54, 3669.47000000, 1.04670000, 3669.81000000, 5.38010000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:47.556927+00'),
(55, 95973.46000000, 0.00048400, 96022.34000000, 1.35559000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:57.625202+00'),
(56, 3669.02000000, 0.15030000, 3669.61000000, 6.60220000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:57.626202+00'),
(57, 95973.46000000, 0.04819900, 96022.34000000, 0.09987000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:07.82196+00'),
(58, 3669.01000000, 2.23490000, 3669.61000000, 12.39450000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:07.82296+00'),
(59, 95986.10000000, 0.20335700, 96022.34000000, 3.81972000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:17.555491+00'),
(60, 3669.19000000, 0.04680000, 3669.88000000, 34.65890000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:17.556489+00'),
(61, 95977.06000000, 0.05975100, 96022.34000000, 5.37182000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:27.554385+00'),
(62, 3670.00000000, 3.80430000, 3670.42000000, 79.76460000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:27.555384+00'),
(63, 95984.75000000, 0.14430900, 96022.34000000, 2.14683000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:37.646183+00'),
(64, 3670.00000000, 0.84490000, 3670.68000000, 6.89170000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:37.648182+00');             
INSERT INTO "PUBLIC"."CRYPTO_PRICE" VALUES
(65, 95984.75000000, 0.21422200, 96022.34000000, 2.12215000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:47.803778+00'),
(66, 3669.84000000, 2.80640000, 3670.33000000, 13.59130000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:47.804779+00'),
(67, 95979.26000000, 0.13166100, 96036.27000000, 6.43510000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:57.570769+00'),
(68, 3669.84000000, 2.17010000, 3671.49000000, 49.59380000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:09:57.571771+00'),
(69, 96006.68000000, 0.89559100, 96036.27000000, 3.51258000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:07.625833+00'),
(70, 3670.68000000, 2.36310000, 3671.49000000, 15.41640000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:07.626831+00'),
(71, 96006.68000000, 1.07561700, 96036.27000000, 5.19875000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:17.644346+00'),
(72, 3670.80000000, 0.05450000, 3672.79000000, 77.76100000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:17.645345+00'),
(73, 96006.68000000, 0.23140100, 96036.27000000, 4.46771000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:27.668012+00'),
(74, 3672.00000000, 1.32070000, 3673.10000000, 35.21270000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:27.669015+00'),
(75, 96006.68000000, 0.38530047, 96036.27000000, 4.13473000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:37.721325+00'),
(76, 3672.40000000, 0.81680000, 3673.35000000, 28.45720000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:37.722324+00'),
(77, 96000.43000000, 0.08012329, 96036.27000000, 4.46039000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:47.594748+00'),
(78, 3672.40000000, 2.68970000, 3673.35000000, 17.00000000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:47.595748+00'),
(79, 96000.43000000, 0.06842458, 96036.27000000, 4.42352000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:57.909787+00'),
(80, 3672.35000000, 0.81680000, 3673.35000000, 20.25910000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:10:57.910784+00'),
(81, 96010.88000000, 0.00116200, 96052.52000000, 7.00450000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:08.041649+00'),
(82, 3673.00000000, 0.02750000, 3674.15000000, 19.85720000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:08.042646+00'),
(83, 96026.63000000, 0.36870733, 96052.52000000, 6.85036000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:17.69109+00'),
(84, 3673.01000000, 0.92670000, 3674.15000000, 13.93080000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:17.692091+00'),
(85, 96018.20000000, 0.05252600, 96063.49000000, 5.75890000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:27.625473+00'),
(86, 3672.01000000, 1.90720000, 3673.54000000, 38.95170000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:27.626473+00'),
(87, 96038.17000000, 0.15557400, 96071.88000000, 10.03051000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:37.657242+00'),
(88, 3672.34000000, 0.63580000, 3673.54000000, 46.76470000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:37.657242+00'),
(89, 96038.62000000, 0.13587100, 96071.88000000, 6.10615000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:47.558022+00'),
(90, 3672.51000000, 0.81680000, 3673.20000000, 18.59500000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:47.559022+00'),
(91, 96038.62000000, 0.00154600, 96075.52000000, 6.20476000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:57.563604+00'),
(92, 3672.20000000, 1.10910000, 3673.49000000, 32.92210000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:11:57.564604+00'),
(93, 96039.19000000, 0.14323900, 96079.99000000, 2.93736000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:07.566795+00'),
(94, 3672.58000000, 1.16050000, 3674.14000000, 43.10070000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:07.567798+00'),
(95, 96039.19000000, 0.07972700, 96079.99000000, 3.47273000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:17.869751+00'),
(96, 3673.01000000, 0.82400000, 3674.14000000, 40.70000000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:17.870751+00');    
INSERT INTO "PUBLIC"."CRYPTO_PRICE" VALUES
(97, 96039.19000000, 0.06933700, 96079.99000000, 2.99129000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:27.572271+00'),
(98, 3673.01000000, 0.00730000, 3674.41000000, 14.21590000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:27.574272+00'),
(99, 96042.32000000, 0.13222400, 96079.99000000, 3.03611000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:37.695053+00'),
(100, 3673.01000000, 0.82400000, 3674.91000000, 41.23130000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:37.697057+00'),
(101, 96042.32000000, 0.12085100, 96079.99000000, 2.69150000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:47.626447+00'),
(102, 3673.48000000, 4.35140000, 3674.42000000, 80.31410000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:47.627447+00'),
(103, 96042.32000000, 0.11451100, 96079.99000000, 3.54756000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:57.591593+00'),
(104, 3673.79000000, 0.02610000, 3675.14000000, 75.81530000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:12:57.592591+00'),
(105, 96042.32000000, 0.11185100, 96079.99000000, 5.92115000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:07.971585+00'),
(106, 3674.42000000, 0.93460000, 3675.81000000, 78.37040000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:07.972584+00'),
(107, 96043.63000000, 0.09329500, 96080.94000000, 3.74140000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:17.624019+00'),
(108, 3675.29000000, 0.63560000, 3675.90000000, 17.99070000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:17.626019+00'),
(109, 96058.74000000, 0.08328200, 96096.86000000, 6.37790000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:28.054704+00'),
(110, 3675.04000000, 0.29180000, 3676.19000000, 35.59990000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:28.055701+00'),
(111, 96077.08000000, 0.09351100, 96109.99000000, 5.20938000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:37.711667+00'),
(112, 3675.50000000, 0.02750000, 3676.02000000, 12.30160000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:37.712668+00'),
(113, 96077.08000000, 0.10840400, 96099.99000000, 0.69733000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:47.824353+00'),
(114, 3675.24000000, 1.87450000, 3675.50000000, 4.27420000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:47.825355+00'),
(115, 96066.76000000, 0.39105900, 96099.99000000, 0.59410000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:57.56723+00'),
(116, 3674.01000000, 0.23900000, 3674.87000000, 15.62990000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:13:57.56823+00'),
(117, 96058.36000000, 0.27784200, 96088.45000000, 0.01032000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:07.616385+00'),
(118, 3673.54000000, 2.23330000, 3673.80000000, 29.90970000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:07.617385+00'),
(119, 96042.32000000, 0.35737600, 96078.19000000, 5.46946000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:17.583264+00'),
(120, 3673.08000000, 4.47470000, 3674.39000000, 37.73100000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:17.583264+00'),
(121, 96047.38000000, 0.02093800, 96082.31000000, 1.28363000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:27.563593+00'),
(122, 3673.84000000, 0.41470000, 3673.84000000, 4.03390000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:27.564591+00'),
(123, 96047.28000000, 0.13344700, 96082.40000000, 0.67628000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:38.103076+00'),
(124, 3673.22000000, 0.02520000, 3673.74000000, 21.33840000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:38.104076+00'),
(125, 96046.21000000, 0.14652100, 96082.40000000, 0.47961000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:47.634011+00'),
(126, 3673.35000000, 0.91490000, 3673.56000000, 17.17810000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:47.635011+00'),
(127, 96046.21000000, 0.07791400, 96078.11000000, 0.68640000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:57.600104+00');               
INSERT INTO "PUBLIC"."CRYPTO_PRICE" VALUES
(128, 3673.19000000, 1.08790000, 3673.73000000, 44.63420000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:14:57.601104+00'),
(129, 96046.21000000, 0.13690600, 96082.00000000, 7.20414000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:07.562943+00'),
(130, 3673.48000000, 0.00980000, 3674.39000000, 38.96020000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:07.563942+00'),
(131, 96052.18000000, 0.10401800, 96085.30000000, 4.91635000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:17.693797+00'),
(132, 3674.03000000, 0.14320000, 3674.84000000, 38.98120000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:17.6948+00'),
(133, 96054.67000000, 0.07001300, 96106.13000000, 6.22012000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:27.622014+00'),
(134, 3674.50000000, 0.02750000, 3675.94000000, 73.93140000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:27.623014+00'),
(135, 96078.89000000, 0.09952000, 96119.90000000, 5.34511000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:37.728677+00'),
(136, 3676.50000000, 0.02750000, 3677.30000000, 46.23100000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:37.729679+00'),
(137, 96087.89000000, 0.08582800, 96124.70000000, 3.04788000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:47.570189+00'),
(138, 3676.50000000, 0.26370000, 3676.84000000, 25.67500000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:47.571189+00'),
(139, 96087.89000000, 0.13091100, 96124.70000000, 0.70988000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:58.137811+00'),
(140, 3676.16000000, 2.44120000, 3676.61000000, 10.49870000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:15:58.138813+00'),
(141, 96087.89000000, 0.13605400, 96124.62000000, 1.44897000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:07.561132+00'),
(142, 3676.55000000, 10.13210000, 3677.73000000, 16.85600000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:07.563134+00'),
(143, 96087.89000000, 0.14170100, 96124.62000000, 4.65072000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:17.711076+00'),
(144, 3676.55000000, 9.75129213, 3678.27000000, 60.40340000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:17.712078+00'),
(145, 96087.89000000, 0.03150700, 96124.62000000, 1.70343000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:27.702376+00'),
(146, 3677.49000000, 0.27010000, 3678.00000000, 30.63450000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:27.7034+00'),
(147, 96092.57000000, 0.14671700, 96124.62000000, 7.41258000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:37.632092+00'),
(148, 3677.50000000, 0.02750000, 3678.65000000, 31.87130000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:37.633092+00'),
(149, 96092.57000000, 0.14714800, 96124.62000000, 5.25999000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:47.637345+00'),
(150, 3678.52000000, 1.19490000, 3678.97000000, 49.98320000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:47.638345+00'),
(151, 96092.57000000, 0.09003500, 96125.51000000, 6.84957000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:57.562203+00'),
(152, 3678.30000000, 0.66890000, 3679.10000000, 60.24730000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:16:57.563204+00'),
(153, 96092.89000000, 0.00011000, 96147.27000000, 3.47048000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:08.058755+00'),
(154, 3678.88000000, 1.48400000, 3680.38000000, 49.51570000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:08.058755+00'),
(155, 96149.56000000, 0.01014000, 96201.00000000, 1.97872000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:17.627628+00'),
(156, 3679.56000000, 0.19120000, 3681.85000000, 57.97900000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:17.628628+00'),
(157, 96156.79000000, 0.00115200, 96200.00000000, 5.75647000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:27.851239+00'),
(158, 3680.67000000, 0.07280000, 3682.40000000, 6.82280000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:27.852239+00');             
INSERT INTO "PUBLIC"."CRYPTO_PRICE" VALUES
(159, 96150.00000000, 0.13670800, 96191.98000000, 4.64705000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:37.61619+00'),
(160, 3680.96000000, 4.83930000, 3682.12000000, 68.58910000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:37.617189+00'),
(161, 96160.98000000, 0.08403200, 96186.99000000, 0.83467000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:47.855712+00'),
(162, 3681.37000000, 4.70420000, 3681.75000000, 24.41110000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:47.85671+00'),
(163, 96158.90000000, 0.71889300, 96180.52000000, 0.15828000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:57.819471+00'),
(164, 3680.75000000, 58.73680000, 3681.03000000, 4.81490000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:17:57.82047+00'),
(165, 96147.74000000, 0.80124000, 96177.28000000, 6.85907000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:07.848401+00'),
(166, 3680.11000000, 2.45520000, 3681.74000000, 33.72920000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:07.849403+00'),
(167, 96150.00000000, 0.01516200, 96191.39000000, 6.40471000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:17.697781+00'),
(168, 3681.12000000, 0.05070000, 3681.99000000, 39.48920000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:17.698781+00'),
(169, 96160.98000000, 0.23308902, 96191.39000000, 0.36611000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:27.61339+00'),
(170, 3681.43000000, 2.83130000, 3681.69000000, 2.49190000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:27.614392+00'),
(171, 96158.86000000, 0.31027500, 96190.50000000, 1.99459000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:37.689571+00'),
(172, 3680.93000000, 3.32700000, 3681.78000000, 56.27570000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:37.690569+00'),
(173, 96158.86000000, 0.37623400, 96201.01000000, 5.69506000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:47.580704+00'),
(174, 3681.50000000, 0.28400000, 3682.38000000, 0.30980000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:47.580704+00'),
(175, 96174.64000000, 0.06585200, 96190.47000000, 0.54115000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:57.570242+00'),
(176, 3681.50000000, 0.02740000, 3681.91000000, 21.09170000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:18:57.571239+00'),
(177, 96154.43000000, 0.00562900, 96190.47000000, 6.17104000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:07.66891+00'),
(178, 3681.16000000, 3.35830000, 3681.94000000, 29.35560000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:07.66891+00'),
(179, 96163.71000000, 0.14335300, 96185.64000000, 1.70914000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:17.572703+00'),
(180, 3681.01000000, 21.16500000, 3681.32000000, 1.91470000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:17.573705+00'),
(181, 96161.39000000, 0.49077900, 96185.64000000, 0.17157000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:27.855264+00'),
(182, 3680.89000000, 14.41750000, 3681.02000000, 0.81490000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:27.855264+00'),
(183, 96153.33000000, 0.43010700, 96185.64000000, 5.92512000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:37.559839+00'),
(184, 3680.37000000, 0.02470000, 3681.39000000, 28.07760000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:37.560839+00'),
(185, 96153.33000000, 0.05000000, 96185.64000000, 4.70351000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:47.836528+00'),
(186, 3681.49000000, 0.02470000, 3681.49000000, 50.99410000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:47.836528+00'),
(187, 96153.33000000, 0.05000000, 96201.01000000, 7.34990000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:57.620546+00'),
(188, 3681.29000000, 0.01111780, 3681.78000000, 24.23340000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:19:57.621544+00'),
(189, 96159.30000000, 0.08319500, 96219.98000000, 5.76187000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:07.733038+00');
INSERT INTO "PUBLIC"."CRYPTO_PRICE" VALUES
(190, 3681.49000000, 0.02550000, 3681.94000000, 43.45920000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:07.73404+00'),
(191, 96188.75000000, 0.12231600, 96219.98000000, 5.78035000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:17.824392+00'),
(192, 3681.47000000, 0.01920000, 3681.94000000, 24.65340000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:17.825392+00'),
(193, 96200.38000000, 0.07247500, 96240.07000000, 2.96900000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:27.602589+00'),
(194, 3683.35000000, 0.00800000, 3684.19000000, 27.37010000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:27.60359+00'),
(195, 96206.60000000, 0.33825700, 96244.84000000, 4.85925000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:37.621733+00'),
(196, 3683.77000000, 1.68550000, 3685.60000000, 1.77790000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:37.621733+00'),
(197, 96212.90000000, 0.32710800, 96244.84000000, 1.45512000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:47.648278+00'),
(198, 3684.45000000, 0.02460000, 3684.93000000, 18.37860000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:47.648278+00'),
(199, 96209.10000000, 1.14724100, 96232.42000000, 0.04542000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:57.563842+00'),
(200, 3684.21000000, 73.30930000, 3684.27000000, 0.95790000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:20:57.564842+00'),
(201, 96200.55000000, 1.02255800, 96219.99000000, 6.15720000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:21:07.625112+00'),
(202, 3683.43000000, 2.06410000, 3683.73000000, 39.63150000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:21:07.625112+00'),
(203, 96200.55000000, 0.11766900, 96220.90000000, 3.22565000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:21:17.579205+00'),
(204, 3684.32000000, 2.31120000, 3684.40000000, 15.24130000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:21:17.580209+00'),
(205, 96200.55000000, 0.16646200, 96235.89000000, 3.48646000, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:21:27.853663+00'),
(206, 3683.71000000, 0.11570000, 3684.00000000, 21.10430000, 'ETHUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:21:27.854663+00');           
CREATE INDEX "PUBLIC"."IDX_SYMBOL_TIMESTAMP" ON "PUBLIC"."CRYPTO_PRICE"("SYMBOL" NULLS FIRST, "TIMESTAMP" NULLS FIRST);       
CREATE MEMORY TABLE "PUBLIC"."TRADE_HISTORY"(
    "ID" BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1 RESTART WITH 23) NOT NULL,
    "ORDER_TYPE" CHARACTER VARYING(255),
    "PRICE" NUMERIC(38, 2),
    "QUANTITY" NUMERIC(38, 2),
    "SYMBOL" CHARACTER VARYING(255),
    "TIMESTAMP" TIMESTAMP(6) WITH TIME ZONE,
    "TOTAL" NUMERIC(38, 2)
);            
ALTER TABLE "PUBLIC"."TRADE_HISTORY" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_5" PRIMARY KEY("ID");
-- 22 +/- SELECT COUNT(*) FROM PUBLIC.TRADE_HISTORY;          
INSERT INTO "PUBLIC"."TRADE_HISTORY" VALUES
(1, 'BUY', 96019.56, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:00.610974+00', 9601.96),
(2, 'SELL', 96065.44, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:09.775952+00', 9606.54),
(3, 'BUY', 96021.39, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:17.322893+00', 9602.14),
(4, 'SELL', 96069.03, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:18.443893+00', 9606.90),
(5, 'BUY', 96019.11, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:21.826344+00', 9601.91),
(6, 'SELL', 96069.03, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:22.984611+00', 9606.90),
(7, 'BUY', 96023.45, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:31.143017+00', 9602.35),
(8, 'SELL', 96069.03, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:06:35.423387+00', 9606.90),
(9, 'BUY', 95979.87, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:36.477909+00', 9597.99),
(10, 'SELL', 96043.99, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:40.304482+00', 9604.40),
(11, 'BUY', 96000.57, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:42.200384+00', 9600.06),
(12, 'SELL', 96043.99, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:43.075018+00', 9604.40),
(13, 'BUY', 96000.57, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:44.396661+00', 9600.06),
(14, 'SELL', 96043.99, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:45.536662+00', 9604.40),
(15, 'BUY', 96000.57, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:46.62129+00', 9600.06),
(16, 'SELL', 96043.99, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:47.547444+00', 9604.40),
(17, 'BUY', 95998.82, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:07:59.377848+00', 9599.88),
(18, 'SELL', 96054.52, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:00.396889+00', 9605.45),
(19, 'BUY', 95998.82, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:01.471524+00', 9599.88),
(20, 'SELL', 96054.52, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:02.436941+00', 9605.45),
(21, 'BUY', 95998.82, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:03.365943+00', 9599.88),
(22, 'SELL', 96054.52, 0.10, 'BTCUSDT', TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:04.274578+00', 9605.45);          
CREATE MEMORY TABLE "PUBLIC"."WALLET"(
    "ID" BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1 RESTART WITH 2) NOT NULL,
    "BTC_BALANCE" NUMERIC(38, 2),
    "ETH_BALANCE" NUMERIC(38, 2),
    "LAST_UPDATED" TIMESTAMP(6) WITH TIME ZONE,
    "USDT_BALANCE" NUMERIC(38, 2)
); 
ALTER TABLE "PUBLIC"."WALLET" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_9" PRIMARY KEY("ID");       
-- 1 +/- SELECT COUNT(*) FROM PUBLIC.WALLET;  
INSERT INTO "PUBLIC"."WALLET" VALUES
(1, 0.00, 0.00, TIMESTAMP WITH TIME ZONE '2024-12-04 05:08:04.274578+00', 50055.03);    
