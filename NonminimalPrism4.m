% Static force analysis of non minimal tensegrity prism with 4 bars
% By Mufeng Xie, UC San Diego
clear; clf; figure(1);

% Free [Q=Q_(dim x q)] and fixed [P=P_(dim x p)] node locations
% For p=4, define the top polygon and bottom polygon has Ra=Rb=2 and h=4,
% The twist angle is pi/4.
% The origin point is defined as the center of bottom polygons
Q(:,1)=[-2; 0; 0];
Q(:,2)=[0; -2; 0];
Q(:,3)=[2; 0; 0];
Q(:,4)=[0; 2; 0];
Q(:,5)=[-sqrt(2); -sqrt(2); 4];
Q(:,6)=[sqrt(2); -sqrt(2); 4];
Q(:,7)=[sqrt(2); sqrt(2); 4];
Q(:,8)=[-sqrt(2); sqrt(2); 4];
P=[];
[dim,q]=size(Q); p=size(P,2); n=q+p; 

% Connectivity matrix
C(  1,8)=1; C(  1,2)=-1;       % bars 
C(  2,5)=1; C(  2,3)=-1;
C(  3,6)=1; C(  3,4)=-1;
C(  4,7)=1; C(  4,1)=-1; b=4;
C(b+1,1)=1; C(b+1,2)=-1;       % strings 
C(b+2,2)=1; C(b+2,3)=-1;    
C(b+3,3)=1; C(b+3,4)=-1;    
C(b+4,4)=1; C(b+4,1)=-1;    
C(b+5,8)=1; C(b+5,1)=-1;    
C(b+6,5)=1; C(b+6,2)=-1;    
C(b+7,6)=1; C(b+7,3)=-1;    
C(b+8,7)=1; C(b+8,4)=-1;
C(b+9,8)=1; C(b+9,4)=-1;
C(b+10,5)=1; C(b+10,1)=-1;
C(b+11,6)=1; C(b+11,2)=-1;
C(b+12,7)=1; C(b+12,3)=-1;
C(b+13,5)=1; C(b+13,6)=-1; 
C(b+14,6)=1; C(b+14,7)=-1;
C(b+15,7)=1; C(b+15,8)=-1;
C(b+16,8)=1; C(b+16,5)=-1;
s=16; m=b+s;

% Applied external force U=U_(dim x q)
% Here we apply force equally in magnitude and inversely in direction on top and bottom surfaces 
U(1:dim,1:8)=0; 
U(3,1:4)=2;
U(3,5:8)=-2;


% Solve for the forces at equilibrium, and plot
[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,1,0.08); grid on;

% end script
