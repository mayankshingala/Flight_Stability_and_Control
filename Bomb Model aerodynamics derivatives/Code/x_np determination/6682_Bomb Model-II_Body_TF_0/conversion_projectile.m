%% Conversion from Voltage signal to kg

CM = [63.080043 0.144499    -0.206795	1.35426	    1.630051	4.275882;
      -0.123649	150.309342	0.592082	-0.725847	0.030856	0.393628;
      0.024098	-0.689773	151.831777	0.096597	-0.571799	-4.414537;
      0.152944	-2.334107	0.037781	77.595997	0.445712	5.841784;
      -0.00603	0.114642	-0.574072	-0.0658	    79.176337	0.322466;
      0.047415	0.466131	0.099431	0.208017	0.190935	44.877349];

NW = [-0.000122	-0.000856	0.000737 -0.000887	-0.000321	0.00054];
NW = NW';

a2 = k(:,2)';
a3 = k(:,3)';
a4 = k(:,4)';
a5 = k(:,5)';
a6 = k(:,6)';
a7 = k(:,7)';

a = [a2; a3; a4; a5; a6; a7];

dummy_A = [];

for i = 1:1:20
    A = CM*[a(:,i) - NW];
    dummy_A = [dummy_A, A];
end

A = dummy_A;        % Each column indicates the values of [Af; N1; N2; S1; S2; Rm] for 20 different AOA

calc_projectile


