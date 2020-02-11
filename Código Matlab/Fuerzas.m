%B=-25.993;
%Z=16.532;
%U=-1.337;
%W=2.604;
%tetha:15-25°;
miu=0.25;
n=1000;
b=pi/2;
K=1.03;
D=0.254;
tetha=15:0.5:30;
FN={}
FI={}
for j=15:0.5:30
    j=90-(j);
    j=j*pi/180;
    s=0;
    h=(b-(j))/n;
    f=inline('exp(2.52*(9.958-25.933*sin(x)+16.532*(sin(x)).^2))*(-2.674+5.207*sin(x))'); 
        for i=1:n
        %calculo el area de cada trapecio diferencial
        s=h/2*(f((j)+(i-1)*h)+f((j)+(i)*h))+s;
        end
    s=K*(D/2)*s;
    FN=[FN,s] ;
    t=(pi/2)-j;
    imp=s*1000*(sin(t)-miu*cos(t));
    FI=[FI,imp];
end
N=cell2mat(FN)
I=cell2mat(FI)
Nmax=max(N)
Nmin=min(N)
Imax=max(I)
Imin=min(I)

plot(tetha,N)
title('\fontsize{18} Fuerza Normal vs \theta','FontName','Arial')
ylabel('Fuerza Normal (kN)','fontsize',18,'Fontname','Arial')
xlabel('\theta (°)','fontsize',18,'Fontname','Arial')
set(gca,'ygrid','on','gridlinestyle','-')

plot(tetha,I)
title('\fontsize{18} Fuerza de inserción vs \theta','FontName','Arial')
ylabel('Fuerza inserción (N)','fontsize',18,'Fontname','Arial')
xlabel('\theta (°)','fontsize',18,'Fontname','Arial')
set(gca,'ygrid','on','gridlinestyle','-')