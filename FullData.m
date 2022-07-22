clear
load('C:\Users\Patryk\Desktop\dane_w_cm.mat')
t=0:0.002:(length(x)-1)*0.002;

    figure
ax=gca;
plot(t,x,t,y,t,z)
plot(t,x,'Color','#77AC30')
hold on
plot(t,y,'Color','#4DBEEE')
hold on
plot(t,z,'Color','#A2142F')
grid on
legend('odległość x','odległość y','odległość z')
title('Pomiar położenia')
xlabel('czas [s]')
ylabel('odległość [cm]')
ax.FontSize=14;


xh=-0.017
xl=-0.027
yh=-0.028
yl=-0.037
zh=-0.208
zl=-0.225


x_z_pomiaru=zeros(1,150);
y_z_pomiaru=zeros(1,150);
z_z_pomiaru=zeros(1,150);
k=1
i=0
dok=250
k_filtr=zeros(1000-2*dok,150);
x_filtr=zeros(1000-2*dok,150);
y_filtr=zeros(1000-2*dok,150);
z_filtr=zeros(1000-2*dok,150);
zakresy=zeros(6,150)
znaczniki=zeros(6,150)
dojscie=1
while (k<length(x))
    if (x(k,1)<xh && x(k,1)>xl && y(k,1)<yh && y(k,1)>yl && z(k,1)<zh && z(k,1)>zl)
        k_filtr(1:1000-2*dok,i+1)=k+dok:k+1000-dok-1;
        x_filtr(1:1000-2*dok,i+1)=x(k+dok:k+1000-dok-1,1);
        y_filtr(1:1000-2*dok,i+1)=y(k+dok:k+1000-dok-1,1);
        z_filtr(1:1000-2*dok,i+1)=z(k+dok:k+1000-dok-1,1);
        zakresy(:,dojscie)=[k+dok;k+dok;k+dok;k+1000-dok-1;k+1000-dok-1;k+1000-dok-1];
        znaczniki(:,dojscie)=[x(k+dok);y(k+dok);z(k+dok);x(k+1000-dok-1);y(k+1000-dok-1);z(k+1000-dok-1)];
        i=i+1
        x_z_pomiaru(1,i)=mean(x(k+dok:k+1000-dok-1,1));
        y_z_pomiaru(1,i)=mean(y(k+dok:k+1000-dok-1,1));
        z_z_pomiaru(1,i)=mean(z(k+dok:k+1000-dok-1,1));
        k=k+2500
        dojscie=dojscie+1
    end
    k=k+1;
end
zakresy=zakresy*0.002
k_filtr=k_filtr*0.002;

    figure
ax=gca;
plot(k_filtr,x_filtr,'Color','#77AC30')
hold on
plot(k_filtr,y_filtr,'Color','#4DBEEE')
hold on
plot(k_filtr,z_filtr,'Color','#A2142F')
grid on
legend('odległość x','odległość y','odległość z')
title(['Wynik działania algorytmu' newline 'Przefiltrowane dane z pomiaru położenia'])
xlabel('czas [s]')
ylabel('odległość [cm]')
ax.FontSize=14;

    figure
ax=gca;
plot(1:i,x_z_pomiaru,'.','Color','#77AC30','LineWidth',1.5)
hold on
plot(1:i,y_z_pomiaru,'.','Color','#4DBEEE','LineWidth',1.5)
hold on
plot(1:i,z_z_pomiaru,'.','Color','#A2142F','LineWidth',1.5)
grid on
legend('odległość x','odległość y','odległość z')
title('Położenie pomiarowe wyznaczone dla kolejnych podejść robota')
xlabel('numer podejścia [-]')
ylabel('odległość [cm]')
ax.FontSize=14;

    figure
ax=gca;
plot(t,x,'Color','#77AC30')
hold on
plot(t,y,'Color','#4DBEEE')
hold on
plot(t,z,'Color','#A2142F')
grid on
title('Pomiar położenia')
xlabel('czas [s]')
ylabel('odległość [cm]')
plot(zakresy,znaczniki,'o','Color','#0072BD')
legend('odległość x','odległość y','odległość z')
ax.FontSize=14;

% obliczenie x_j, y_j i z_j dla dojazdów w poszczególnych kierunkach
x_kier_x_j=x_z_pomiaru(1,1:3:150);
y_kier_x_j=y_z_pomiaru(1,1:3:150);
z_kier_x_j=z_z_pomiaru(1,1:3:150);
x_kier_y_j=x_z_pomiaru(1,2:3:150);
y_kier_y_j=y_z_pomiaru(1,2:3:150);
z_kier_y_j=z_z_pomiaru(1,2:3:150);
x_kier_z_j=x_z_pomiaru(1,3:3:150);
y_kier_z_j=y_z_pomiaru(1,3:3:150);
z_kier_z_j=z_z_pomiaru(1,3:3:150);
% obliczenie średniej z x_j, y_j i z_j dla dojazdów w poszczególnych kierunkach
sr_x_kier_x=mean(x_kier_x_j);
sr_y_kier_x=mean(y_kier_x_j);
sr_z_kier_x=mean(z_kier_x_j);
sr_x_kier_y=mean(x_kier_y_j);
sr_y_kier_y=mean(y_kier_y_j);
sr_z_kier_y=mean(z_kier_y_j);
sr_x_kier_z=mean(x_kier_z_j);
sr_y_kier_z=mean(y_kier_z_j);
sr_z_kier_z=mean(z_kier_z_j);

x1=mean(x_kier_x_j)
y1=mean(y_kier_x_j)
z1=mean(z_kier_x_j)
[x,y,z]=sphere;
r1=max(((x_kier_x_j-x1).^2+(y_kier_x_j-y1).^2+(z_kier_x_j-z1).^2).^(1/2))
x=x*r1+x1
y=y*r1+y1
z=z*r1+z1

    figure
ax=gca;
plot3(x_kier_x_j,y_kier_x_j,z_kier_x_j,'o')
title('Położenie PP dla dojazdów w kierunku x')
xlabel('odległość x [cm]')
ylabel('odległość y [cm]')
zlabel('odległość z [cm]')
grid on
hold on
lightGrey=0.8*[1 1 1]
surface(x,y,z,'FaceColor','none','EdgeColor',lightGrey)
axis equal
ax.FontSize=14;

x1=mean(x_kier_y_j)
y1=mean(y_kier_y_j)
z1=mean(z_kier_y_j)
[x,y,z]=sphere;
r1=max(((x_kier_y_j-x1).^2+(y_kier_y_j-y1).^2+(z_kier_y_j-z1).^2).^(1/2))
x=x*r1+x1
y=y*r1+y1
z=z*r1+z1

    figure
ax=gca;
plot3(x_kier_y_j,y_kier_y_j,z_kier_y_j,'o')
title('Położenie PP dla dojazdów w kierunku y')
xlabel('odległość x [cm]')
ylabel('odległość y [cm]')
zlabel('odległość z [cm]')
grid on
hold on
lightGrey=0.8*[1 1 1]
surface(x,y,z,'FaceColor','none','EdgeColor',lightGrey)
axis equal
ax.FontSize=14;


x1=mean(x_kier_z_j)
y1=mean(y_kier_z_j)
z1=mean(z_kier_z_j)
[x,y,z]=sphere;
r1=max(((x_kier_z_j-x1).^2+(y_kier_z_j-y1).^2+(z_kier_z_j-z1).^2).^(1/2))
x=x*r1+x1
y=y*r1+y1
z=z*r1+z1

    figure
ax=gca;
plot3(x_kier_z_j,y_kier_z_j,z_kier_z_j,'o')
title('Położenie PP dla dojazdów w kierunku z')
xlabel('odległość x [cm]')
ylabel('odległość y [cm]')
zlabel('odległość z [cm]')
grid on
hold on
lightGrey=0.8*[1 1 1]
surface(x,y,z,'FaceColor','none','EdgeColor',lightGrey)
axis equal
ax.FontSize=14;

% obliczenie l dla dojazdów w poszczególnych kierunkach
l_kier_x_j=((x_kier_x_j-sr_x_kier_x).^2+(y_kier_x_j-sr_y_kier_x).^2+(z_kier_x_j-sr_z_kier_x).^2).^(1/2);
l_kier_y_j=((x_kier_y_j-sr_x_kier_y).^2+(y_kier_y_j-sr_y_kier_y).^2+(z_kier_y_j-sr_z_kier_y).^2).^(1/2);
l_kier_z_j=((x_kier_z_j-sr_x_kier_z).^2+(y_kier_z_j-sr_y_kier_z).^2+(z_kier_z_j-sr_z_kier_z).^2).^(1/2);
% obliczenie średniej l dla dojazdów w poszczególnych kierunkach
sr_l_kier_x_j=mean(l_kier_x_j);
sr_l_kier_y_j=mean(l_kier_y_j);
sr_l_kier_z_j=mean(l_kier_z_j);
% obliczenie S_1dla dojazdów w poszczególnych kierunkach
S_l_kier_x=(sum((l_kier_x_j-sr_l_kier_x_j).^2)/(50-1))^(1/2);
S_l_kier_y=(sum((l_kier_y_j-sr_l_kier_y_j).^2)/(50-1))^(1/2);
S_l_kier_z=(sum((l_kier_z_j-sr_l_kier_z_j).^2)/(50-1))^(1/2);
% obliczenie powtarzalności pozycjonowania jednokierunkowego dla
% poszczególncyh kierunków
RP_kier_x=(sr_l_kier_x_j+3*S_l_kier_x)*10
RP_kier_y=(sr_l_kier_y_j+3*S_l_kier_y)*10
RP_kier_z=(sr_l_kier_z_j+3*S_l_kier_z)*10
