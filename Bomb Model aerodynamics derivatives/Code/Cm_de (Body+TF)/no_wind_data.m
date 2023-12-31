function NW = no_wind_data(int)

switch int

    case 1  % 6682_Bomb Model-II_Body_TF_0
        NW = [-0.000122	-0.000856	0.000737	-0.000887	-0.000321	0.00054];

    case 2  % 6683_Bomb Model-II_Body_TF_+5
        NW = [0.000176	-0.000758	0.000311	0.001223	0.000471	0.000796];

    case 3  % 6684_Bomb Model-II_Body_TF_-5
        NW = [0.000761	-0.000269	-0.000213	0.000323	0.001154	0.001504];

    case 4  % 6685_Bomb Model-II_Body_TF_+10
        NW = [0.000913	-0.000361	-0.000542	0.000175	0.001508	0.001359];

    case 5  % 6686_Bomb Model-II_Body_TF_-10
        NW = [0.001164	-0.000152	-0.001091	-0.000283	-0.000726	-0.001041];

    case 6  % 6687_Bomb Model-II_Body_TF_+15
        NW = [-0.000581	0.000769	0.000178	0.001345	0.000025	-0.000342];

    case 7  % 6689_Bomb Model-II_Body_TF_-15
        NW = [0.000234	0.001138	-0.000113	0.000821	0.000607	0.000418];

    case 8  % 6690_Bomb Model-II_Body_TF_+20
        NW = [0.000648	0.001307	-0.000417	0.000376	0.001049	0.000623];

    case 9  % 6691_Bomb Model-II_Body_TF_-20
        NW = [0.000727	0.001383	-0.00071	0.000064	0.00123	0.00046];

    case 10 % 6692_Bomb Model-II_Body_TF_+25
        NW = [-0.000356	0.000863	0.000397	-0.00113	0.00092	0.000653];

    case 11 % 6693_Bomb Model-II_Body_TF_-25
        NW = [-0.000655	0.00058	-0.000061	0.001303	0.000511	0.000551];

end
end
