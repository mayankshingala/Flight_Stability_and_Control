function q = head_data(int)

switch int

    % 6682_Bomb Model-II_Body_TF_0
    case 11
        q = 963.625;    % Dynamic head [in kg/m*s2]    % 40 m/s
    case 12 
        q = 1499.386364;    % 50 m/s
    case 13
        q = 2161.352273;    % 60 m/s

    % 6683_Bomb Model-II_Body_TF_+5
    case 21
        q = 968.113636;
    case 22
        q = 1508.818182;
    case 23
        q = 2169.738636;

    % 6684_Bomb Model-II_Body_TF_-5
    case 31
        q = 946;
    case 32
        q = 1501.136364;
    case 33
        q = 2158.284091;

    % 6685_Bomb Model-II_Body_TF_+10
    case 41
        q = 958.181818;
    case 42
        q = 1496.454545;
    case 43
        q = 2162.159091;

    % 6686_Bomb Model-II_Body_TF_-10
    case 51
        q = 955.397727;
    case 52
        q = 1499.204545;
    case 53
        q = 2155.000000;

    % 6687_Bomb Model-II_Body_TF_+15
    case 61
        q = 971.136364;
    case 62
        q = 1501.613636;
    case 63
        q = 2156.000000;

    % 6689_Bomb Model-II_Body_TF_-15
    case 71
        q = 969.715909;
    case 72
        q = 1493.329545;
    case 73
        q = 2160.931818;

     % 6690_Bomb Model-II_Body_TF_+20
    case 81
        q = 952.795455;
    case 82
        q = 1494.534091;
    case 83
        q = 2150.534091;

     % 6691_Bomb Model-II_Body_TF_-20
    case 91
        q = 945.375;
    case 92
        q = 1479.590909;
    case 93
        q = 2155.625000;

     % 6692_Bomb Model-II_Body_TF_+25
    case 101
        q = 972.090909;
    case 102
        q = 1493.204545;
    case 103
        q = 2164.659091;

     % 6693_Bomb Model-II_Body_TF_-25
    case 111
        q = 959.215909;
    case 112
        q = 1508.863636;
    case 113
        q = 2155.909091;

end
end