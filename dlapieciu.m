%5 pierwszych podjazdow
clear
load('C:\Users\Patryk\Desktop\dane_w_cm.mat')
x=x(1:19500);
y=y(1:19500);
z=z(1:19500);
t=0:0.002:(length(x)-1)*0.002;

xh=-0.017
xl=-0.027
yh=-0.028
yl=-0.037
zh=-0.208
zl=-0.225
x_z_pomiaru=zeros(1,5);
y_z_pomiaru=zeros(1,5);
z_z_pomiaru=zeros(1,5);
x_ciag=ones(1,length(x));
y_ciag=ones(1,length(x));
z_ciag=ones(1,length(x));
k=1
i=0
dok=150
zakresy=zeros(6,5)
znaczniki=zeros(6,5)
dojscie=1
while (k<length(x))
    if (x(k,1)<xh && x(k,1)>xl && y(k,1)<yh && y(k,1)>yl && z(k,1)<zh && z(k,1)>zl)
        x_ciag(1,k+dok:k+1000-dok-1)=x(k+dok:k+1000-dok-1,1);
        y_ciag(1,k+dok:k+1000-dok-1)=y(k+dok:k+1000-dok-1,1);
        z_ciag(1,k+dok:k+1000-dok-1)=z(k+dok:k+1000-dok-1,1);
        zakresy(:,dojscie)=[k+dok;k+dok;k+dok;k+1000-dok-1;k+1000-dok-1;k+1000-dok-1];
        znaczniki(:,dojscie)=[x(k+dok);y(k+dok);z(k+dok);x(k+1000-dok-1);y(k+1000-dok-1);z(k+1000-dok-1)];
        i=i+1;
        x_z_pomiaru(1,i)=mean(x_ciag(1,k+dok:k+1000-dok-1));
        y_z_pomiaru(1,i)=mean(y_ciag(1,k+dok:k+1000-dok-1));
        z_z_pomiaru(1,i)=mean(z_ciag(1,k+dok:k+1000-dok-1));
        k=k+2500;
        dojscie=dojscie+1;
    end
    k=k+1;
end
zakresy=zakresy*0.002;

    figure
    subplot(2,1,1)
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
ax.FontSize=13;
    subplot(2,1,2)
ax=gca;
plot3(x_z_pomiaru,y_z_pomiaru,z_z_pomiaru,'o')
grid on;
title('Położenie PP dla kolejnych dojazdów')
xlabel('odległość x [cm]')
ylabel('odległość y [cm]')
zlabel('odległość z [cm]')
ax.FontSize=13;

%5 srodkowych podjazdow
clear
load('C:\Users\Patryk\Desktop\dane_w_cm.mat')
x=x(257500:274550);
y=y(257500:274550);
z=z(257500:274550);
t=257500:1:274550;
t=t*0.002;
xh=-0.017
xl=-0.027
yh=-0.028
yl=-0.037
zh=-0.208
zl=-0.225
x_z_pomiaru=zeros(1,5);
y_z_pomiaru=zeros(1,5);
z_z_pomiaru=zeros(1,5);
x_ciag=ones(1,length(x));
y_ciag=ones(1,length(x));
z_ciag=ones(1,length(x));
k=1
i=0
dok=150
zakresy=zeros(6,5)
znaczniki=zeros(6,5)
dojscie=1
while (k<length(x))
    if (x(k,1)<xh && x(k,1)>xl && y(k,1)<yh && y(k,1)>yl && z(k,1)<zh && z(k,1)>zl)
        x_ciag(1,k+dok:k+1000-dok)=x(k+dok:k+1000-dok,1);
        y_ciag(1,k+dok:k+1000-dok)=y(k+dok:k+1000-dok,1);
        z_ciag(1,k+dok:k+1000-dok)=z(k+dok:k+1000-dok,1);
        zakresy(:,dojscie)=[k+dok;k+dok;k+dok;k+1000-dok;k+1000-dok;k+1000-dok];
        znaczniki(:,dojscie)=[x(k+dok);y(k+dok);z(k+dok);x(k+1000-dok);y(k+1000-dok);z(k+1000-dok)];
        i=i+1;
        x_z_pomiaru(1,i)=mean(x_ciag(1,k+dok:k+1000-dok));
        y_z_pomiaru(1,i)=mean(y_ciag(1,k+dok:k+1000-dok));
        z_z_pomiaru(1,i)=mean(z_ciag(1,k+dok:k+1000-dok));
        k=k+2500;
        dojscie=dojscie+1;
    end
    k=k+1;
end
zakresy=zakresy+257500;
zakresy=zakresy*0.002;

    figure
    subplot(2,1,1)
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
ax.FontSize=13;
    subplot(2,1,2)
ax=gca;
plot3(x_z_pomiaru,y_z_pomiaru,z_z_pomiaru,'o')
grid on;
title('Położenie PP dla kolejnych dojazdów')
xlabel('odległość x [cm]')
ylabel('odległość y [cm]')
zlabel('odległość z [cm]')
ax.FontSize=13;

%5 ostatnich podjazdow
clear
load('C:\Users\Patryk\Desktop\dane_w_cm.mat')
x=x(522000:end);
y=y(522000:end);
z=z(522000:end);
t=522000:1:length(x)+522000-1;
t=t*0.002;
xh=-0.017
xl=-0.027
yh=-0.028
yl=-0.037
zh=-0.208
zl=-0.225
x_z_pomiaru=zeros(1,5);
y_z_pomiaru=zeros(1,5);
z_z_pomiaru=zeros(1,5);
x_ciag=ones(1,length(x));
y_ciag=ones(1,length(x));
z_ciag=ones(1,length(x));
k=1
i=0
dok=150
zakresy=zeros(6,5)
znaczniki=zeros(6,5)
dojscie=1
while (k<length(x))
    if (x(k,1)<xh && x(k,1)>xl && y(k,1)<yh && y(k,1)>yl && z(k,1)<zh && z(k,1)>zl)
        x_ciag(1,k+dok:k+1000-dok)=x(k+dok:k+1000-dok,1);
        y_ciag(1,k+dok:k+1000-dok)=y(k+dok:k+1000-dok,1);
        z_ciag(1,k+dok:k+1000-dok)=z(k+dok:k+1000-dok,1);
        zakresy(:,dojscie)=[k+dok;k+dok;k+dok;k+1000-dok;k+1000-dok;k+1000-dok];
        znaczniki(:,dojscie)=[x(k+dok);y(k+dok);z(k+dok);x(k+1000-dok);y(k+1000-dok);z(k+1000-dok)];
        i=i+1;
        x_z_pomiaru(1,i)=mean(x_ciag(1,k+dok:k+1000-dok));
        y_z_pomiaru(1,i)=mean(y_ciag(1,k+dok:k+1000-dok));
        z_z_pomiaru(1,i)=mean(z_ciag(1,k+dok:k+1000-dok));
        k=k+2500;
        dojscie=dojscie+1;
    end
    k=k+1;
end
zakresy=zakresy+522000;
zakresy=zakresy*0.002;

    figure
    subplot(2,1,1)
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
ax.FontSize=13;
    subplot(2,1,2)
ax=gca;
plot3(x_z_pomiaru,y_z_pomiaru,z_z_pomiaru,'o')
grid on;
title('Położenie PP dla kolejnych dojazdów')
xlabel('odległość x [cm]')
ylabel('odległość y [cm]')
zlabel('odległość z [cm]')
ax.FontSize=13;