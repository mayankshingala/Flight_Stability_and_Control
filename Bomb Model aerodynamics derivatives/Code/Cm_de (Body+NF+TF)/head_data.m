function q = head_data(int)

switch int

    % 6694_Bomb Model-II_Body_NF_TF_0
    case 11
        q = 980.386364;    % Dynamic head [in kg/m*s2]    % 40 m/s
    case 12 
        q = 1503.238636;    % 50 m/s
    case 13
        q = 2155.477273;    % 60 m/s
        
    % 6696_Bomb Model-II_Body_NF_TF_+5
    case 21
        q = 963.318182;
    case 22
        q = 1492.897727;
    case 23
        q = 2150.988636;

    % 6697_Bomb Model-II_Body_NF_TF_-5
    case 31
        q = 962.477273;
    case 32
        q = 1497.863636;
    case 33
        q = 2148.931818;

    % 6698_Bomb Model-II_Body_NF_TF_+10
    case 41
        q = 951.579545;
    case 42
        q = 1514.727273;
    case 43
        q = 2152.750000;

    % 6699_Bomb Model-II_Body_NF_TF_-10
    case 51
        q = 956.613636;
    case 52
        q = 1484.375000;
    case 53
        q = 2155.170455;

end
end