% Static force analysis of Michell Topology of Order 4
% By Mufeng Xie, UC San Diego
clear; clf; figure(1);

% Free [Q=Q_(dim x q)] and fixed [P=P_(dim x p)] node locations
phi=pi/16;beta=pi/6;a=sin(beta)/sin(beta+phi);c=sin(phi)/sin(beta+phi);
r=zeros(1,5)  % create a vector to represent 5 radius
r(1)=1;   % let the outer circle has a radius of 1
for i=1:4
    r(i+1)=a.*r(i);
end    
Q(:,1)=[r(4)*cos(-3*phi); r(4)*sin(-3*phi)];
Q(:,2)=[r(4)*cos(-phi); r(4)*sin(-phi)];
Q(:,3)=[r(4)*cos(phi); r(4)*sin(phi)];
Q(:,4)=[r(4)*cos(3*phi); r(4)*sin(3*phi)];
Q(:,5)=[r(3)*cos(-2*phi); r(3)*sin(-2*phi)];
Q(:,6)=[r(3)*cos(0); r(3)*sin(0)];
Q(:,7)=[r(3)*cos(2*phi); r(3)*sin(2*phi)];
Q(:,8)=[r(2)*cos(-phi); r(2)*sin(-phi)];
Q(:,9)=[r(2)*cos(phi); r(2)*sin(phi)];
Q(:,10)=[r(1)*cos(0); r(1)*sin(0)];
P(:,1)=[r(5)*cos(-4*phi);r(5)*sin(-4*phi)];
P(:,2)=[r(5)*cos(-2*phi);r(5)*sin(-2*phi)];
P(:,3)=[r(5)*cos(0);r(5)*sin(0)];
P(:,4)=[r(5)*cos(2*phi);r(5)*sin(2*phi)];
P(:,5)=[r(5)*cos(4*phi);r(5)*sin(4*phi)];
[dim,q]=size(Q); p=size(P,2); n=q+p; 
N=[Q,P];     % All nodes are stored in N


% Connectivity matrix
C(  1,11)=1; C(  1,1)=-1;       % bars 
C(  2,1)=1; C(  2,5)=-1;
C(  3,5)=1; C(  3,8)=-1;
C(  4,8)=1; C(  4,10)=-1;
C(  5,12)=1; C(  5,2)=-1; 
C(  6,2)=1; C(  6,6)=-1;       
C(  7,6)=1; C(  7,9)=-1;
C(  8,13)=1; C(  8,3)=-1;
C(  9,3)=1; C(  9,7)=-1;
C(  10,14)=1; C(  10,4)=-1; b=10;

C(  b+1,15)=1; C(  b+1,4)=-1;       % strings
C(  b+2,4)=1; C(  b+2,7)=-1;
C(  b+3,7)=1; C(  b+3,9)=-1;
C(  b+4,9)=1; C(  b+4,10)=-1;
C(  b+5,14)=1; C(  b+5,3)=-1; 
C(  b+6,3)=1; C(  b+6,6)=-1;       
C(  b+7,6)=1; C(  b+7,8)=-1;
C(  b+8,13)=1; C(  b+8,2)=-1;
C(  b+9,2)=1; C(  b+9,5)=-1;
C(  b+10,12)=1; C(  b+10,1)=-1; s=10;

m=b+s;

% Applied external force U=U_(dim x q)
U(1:dim,1:6)=0; U(2,10)=-1;

% Solve for the forces at equilibrium, and plot
[c_bars,t_strings,V]=tensegrity_statics(b,s,q,p,dim,Q,P,C,U);
tensegrity_plot(Q,P,C,b,s,U,V,true,1,0.08); grid on;

% end script
