%% 6680_Bomb Model-II_Body Alone

function k = wind_tunnel_data_projectile(int)

switch int

    case 1  % 6680_Bomb Model-II_Body Alone (1-3)

k = [-9.947917	0.004041	0.010666	-0.025613	0.000252	-0.001648	0.000556
-8.052083	0.004303	0.008047	-0.019603	0.000321	-0.00189	0.000534
-6.052083	0.004447	0.00559	-0.013974	0.000369	-0.002227	0.000534
-4.0625	0.004555	0.003472	-0.00907	0.000284	-0.002226	0.000534
-2.0625	0.004576	0.001695	-0.004794	0.000163	-0.002093	0.00055
-0.052083	0.004651	0.000305	-0.001106	0.00012	-0.002148	0.000567
0.052083	0.004584	0.000547	-0.001454	0.000067	-0.00203	0.000546
1.947917	0.004693	-0.000915	0.002245	-0.000069	-0.001849	0.000555
3.947917	0.004635	-0.002199	0.005815	-0.000038	-0.001871	0.000523
5.947917	0.004555	-0.003961	0.010213	-0.00002	-0.002064	0.00051
7.947917	0.004402	-0.006041	0.015162	0.000073	-0.002172	0.00051
9.947917	0.004198	-0.008423	0.020711	0.000142	-0.002359	0.000489
11.947917	0.003985	-0.011058	0.026797	0.000099	-0.002414	0.000472
13.947917	0.003639	-0.013887	0.033287	-0.000001	-0.002484	0.000497
15.9375	0.00319	-0.016762	0.040025	-0.000171	-0.002655	0.000532
17.947917	0.002619	-0.019732	0.046936	-0.000346	-0.002734	0.000544
19.947917	0.002035	-0.022735	0.05403	-0.000156	-0.003364	0.000573
21.947917	0.001441	-0.025527	0.060936	0.000338	-0.004356	0.000604
23.947917	0.000957	-0.028028	0.067456	0.000961	-0.005535	0.000605
25.947917	0.000578	-0.0304	0.073778	0.00176	-0.006996	0.000559];

case 2

k = [-9.947917	0.006192	0.017118	-0.040181	0.000769	-0.002234	0.000427
-8.052083	0.006619	0.012885	-0.030711	0.000806	-0.002535	0.00041
-6.052083	0.006860	0.009008	-0.021985	0.000831	-0.002845	0.00042
-4.062500	0.006959	0.005793	-0.014346	0.000839	-0.003119	0.000437
-2.062500	0.007005	0.003054	-0.007697	0.000672	-0.002936	0.000459
-0.052083	0.007247	0.000935	-0.002148	0.000640	-0.002946	0.000453
0.052083	0.007197	0.001408	-0.002803	0.000683	-0.003116	0.000353
1.947917	0.007292	-0.000859	0.002949	0.000351	-0.002659	0.000453
3.947917	0.007147	-0.002855	0.008485	0.000383	-0.002782	0.000404
5.947917	0.006977	-0.005520	0.015198	0.000453	-0.003028	0.000383
7.947917	0.006738	-0.008735	0.022893	0.000535	-0.003259	0.000389
9.947917	0.006384	-0.012340	0.031270	0.000529	-0.00335	0.000388
11.947917	0.005978	-0.016281	0.040472	0.000398	-0.003254	0.000395
13.947917	0.005398	-0.020568	0.050442	0.000122	-0.003142	0.000422
15.937500	0.004632	-0.024889	0.060678	-0.000161	-0.003173	0.000425
17.947917	0.003812	-0.029468	0.071419	-0.000126	-0.003874	0.000452
19.947917	0.002842	-0.034292	0.082750	0.000341	-0.004938	0.000484
21.947917	0.001930	-0.038580	0.093416	0.000817	-0.006238	0.000512
23.947917	0.001100	-0.042682	0.103847	0.001550	-0.007834	0.000488
25.947917	0.000524	-0.046475	0.113832	0.002517	-0.009531	0.000386];

case 3

k = [-9.947917	0.008836	0.024858	-0.057997	0.001269	-0.0026	0.000182
-8.052083	0.009400	0.018713	-0.044275	0.001252	-0.003004	0.000222
-6.052083	0.009780	0.013089	-0.031601	0.001283	-0.003549	0.000215
-4.062500	0.009910	0.008425	-0.020681	0.001316	-0.003819	0.000239
-2.062500	0.010055	0.004581	-0.011271	0.001129	-0.003798	0.000268
-0.052083	0.010363	0.001638	-0.003413	0.001218	-0.003882	0.000298
0.052083	0.010244	0.002471	-0.004727	0.001314	-0.004084	0.00018
1.947917	0.010392	-0.000876	0.003781	0.000918	-0.003675	0.000277
3.947917	0.010159	-0.003681	0.011638	0.000994	-0.003892	0.00022
5.947917	0.009890	-0.007414	0.021119	0.001058	-0.004055	0.000184
7.947917	0.009468	-0.011798	0.031753	0.001049	-0.004277	0.00018
9.947917	0.008968	-0.016698	0.043510	0.000856	-0.004142	0.000195
11.947917	0.008362	-0.022478	0.057013	0.000479	-0.003784	0.000237
13.947917	0.007455	-0.028467	0.071065	0.000064	-0.003655	0.000255
15.947917	0.006470	-0.034854	0.085985	-0.000013	-0.004102	0.000282
17.947917	0.005251	-0.041448	0.101465	0.000233	-0.005264	0.000327
19.947917	0.003784	-0.048530	0.118006	0.000826	-0.00689	0.000381
21.947917	0.002409	-0.054638	0.133241	0.001423	-0.008337	0.000397
23.947917	0.001174	-0.060368	0.148189	0.002554	-0.010377	0.000379
25.947917	0.000092	-0.065645	0.162470	0.003253	-0.011682	0.000273];

end
end
