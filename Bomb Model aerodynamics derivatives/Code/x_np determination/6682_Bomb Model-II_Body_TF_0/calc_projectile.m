
CL_dummy = [];
CD_dummy = [];
CM_dummy = [];
alpha_dummy = [];

for i = 1:1:20

%     x = 0.45;   % The CG is varied from 0.45 to -0.45 to find NP of configuration

    alpha = k(i,1);
    alpha_dummy = [alpha_dummy, alpha];

    Af = A(1,i);
    N1 = A(2,i);
    N2 = A(3,i);
    S1 = A(4,i);
    S2 = A(5,i);
    Rm = A(6,i);
    
    % [Ax, Sf, Nf, Rm, Pm, Ym] = [Af*g; (S1 + S2)*g; (N1 + N2)*g; Rm*g; (N1 - N2)*0.065*g; (S1 - S2)*0.065*g];
    Ax = Af*g;
    Sf = (S1 + S2)*g;
    Nf = (N1 + N2)*g;
    Rm = Rm*g;
    Pm = (N1 - N2)*0.065*g;
    Ym = (S1 - S2)*0.065*g;
    
    % [fx, fy, fz, mx, my, mz] = [-Ax; Sf; -Nf; Rm; Pm; Ym];
    fx = Ax;
    fy = Sf;
    fz = Nf;
    mx = Rm;
    my = Pm;
    mz = Ym;

    F = [-1,0,0,0,0,0; 0,1,0,0,0,0; 0,0,-1,0,0,0; 0,-z,y,1,0,0; z,0,-x,0,1,0; -y,x,0,0,0,1]*[fx; fy; fz; mx; my; mz];
    Fx = F(1);
    Fy = F(2);
    Fz = F(3);
    Mx = F(4);
    My = F(5);
    Mz = F(6);

%     Cf = (1/(q*S))*(-1)*[Fx; Fy; Fz];
    Cf = (1/(q*S))*[Fx; Fy; Fz];
    Cfx = Cf(1);
    Cfy = Cf(2);
    Cfz = Cf(3);

%     Cm = (1/(q*S*l))*(-1)*[Mx; My; Mz];
    Cm = (1/(q*S*l))*[Mx; My; Mz];
    Cmx = Cm(1);
    Cmy = Cm(2);
    Cmz = Cm(3);
    
    C = [sind(alpha), 0, -cosd(alpha); -cosd(alpha), 0, -sind(alpha); 0, cosd(alpha), 0]*[Cfx; Cfy; Cfz];
    CL_dummy = [CL_dummy, C(1)];
    CD_dummy = [CD_dummy, C(2)];
    CM_dummy = [CM_dummy, Cm(2)];

%     x = x - 0.045;

end

dummy = [CL_dummy;CD_dummy;CM_dummy]

data_collect_projectile
