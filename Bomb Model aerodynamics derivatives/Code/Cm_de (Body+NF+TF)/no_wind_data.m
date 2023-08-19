function NW = no_wind_data(int)


switch int

    case 1  % 6694_Bomb Model-II_Body_NF_TF_0
        NW = [-0.000060	0.000720	-0.000535	-0.000702	0.000175	-0.000938];

    case 2  % 6696_Bomb Model-II_Body_NF_TF_+5
        NW = [0.000584	0.000924	0.001203	0.000854	-0.001032	0.000897];

    case 3  % 6697_Bomb Model-II_Body_NF_TF_-5
        NW = [0.00077	0.000858	0.000866	0.000727	-0.000826	0.000939];

    case 4  % 6698_Bomb Model-II_Body_NF_TF_+10
        NW = [0.001288	0.001094	0.000372	0.000063	-0.000004	0.001433];

    case 5  % 6700_Bomb Model-II_Body_NF_TF_-10
        NW = [-0.000285	-0.000793	-0.000714	0.001382	0.001304	-0.000896];


end
end
