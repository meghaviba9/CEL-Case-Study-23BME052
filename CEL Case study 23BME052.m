% ----- Ask user for masses -----
m1 = input('Enter m1 = ');
m2 = input('Enter m2 = ');
m3 = input('Enter m3 = ');
m4 = input('Enter m4 = ');
m5 = input('Enter m5 = ');

% ----- Ask user for spring constants -----
k1 = input('Enter k1 = ');
k2 = input('Enter k2 = ');
k3 = input('Enter k3 = ');
k4 = input('Enter k4 = ');
k5 = input('Enter k5 = ');

% ----- Mass matrix -----
M = [ m1 0 0 0 0;
      0 m2 0 0 0;
      0 0 m3 0 0;
      0 0 0 m4 0;
      0 0 0 0 m5 ];

% ----- Stiffness matrix -----
K = [ k1+k2 -k2 0 0 0;
      -k2 k2+k3 -k3 0 0;
       0 -k3 k3+k4 -k4 0;
       0 0 -k4 k4+k5 -k5;
       0 0 0 -k5 k5 ];

% ----- Eigenvalue problem -----
[Phi, D] = eig(K,M);

omega = sqrt(diag(D));

% ----- Sort frequencies -----
[omega, index] = sort(omega);
Phi = Phi(:,index);

% ----- Normalize (5th mass = 1) -----
for i = 1:5
    Phi(:,i) = Phi(:,i)/Phi(5,i);
end

disp('Natural Frequencies (rad/s):');
disp(omega);

disp('Normalized Mode Shapes (5th mass = 1):');
disp(Phi);

% ----- Plot mode shapes -----
storey = 1:5;

figure;
plot(Phi(:,1),storey,'-o', ...
     Phi(:,2),storey,'-s', ...
     Phi(:,3),storey,'-^', ...
     Phi(:,4),storey,'-d', ...
     Phi(:,5),storey,'-*');

xlabel('Amplitude');
ylabel('Mass Number');
legend('Mode 1','Mode 2','Mode 3','Mode 4','Mode 5');
grid on;
% ----- Frequency response -----
w = linspace(0,2*max(omega),400);

F = [0;0;0;0;1];   % force applied on top mass

for i=1:length(w)
    X(:,i) = (K - w(i)^2*M)\F;
end

figure;
plot(w,abs(X(5,:)),'LineWidth',2);
xlabel('Excitation Frequency (rad/s)');
ylabel('Amplitude of Mass 5');
title('Frequency Response of Top Mass');
grid on;
