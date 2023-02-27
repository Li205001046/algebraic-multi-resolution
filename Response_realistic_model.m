%%%%%%%%%%%%%%%%%%%%%%%
%%% Realistic terrain model
%%% Comparison of responses from SG and MRS 
%%%%%%%%%%%%%%%%%%%%%%%
clc
clear all
x=(-20000:2000:20000)';
x=x./1000;

%%%% SG
r12=[1.88802027043224	1.88944230964407	1.88964277886698	1.89189231723976	1.90700211348361	4.63808951679411	23.2540012047230	46.4561975435853	68.1599410612049	78.7506556936577	77.5093444998245	70.3076554525618	65.7445982737326	62.6844501422397	79.5731811950448	101.732735175445	148.556745190669	178.219922671504	178.549182879714	166.292358451427	149.518821766845];
r21=[1.88815453347006	1.88749773758389	1.88773213401753	1.88938363730452	2.00589130720448	18.9362944569850	46.8727086835501	80.5971574291558	61.7225391223692	55.1415466378331	69.9686133898170	81.4503355112997	69.4414554191982	52.5598905298302	74.1948666990809	79.5723826648401	137.642024589433	135.451650696918	122.859050448033	116.838502312273	111.869962235782];
p12=-[-71.7329069221369	-71.8147276243264	-71.8214782756686	-71.7706351194887	-71.3689382640173	-64.6835468911532	-68.7402000846910	-65.0828454716620	-60.3300378977434	-57.7203013468866	-57.5884710992592	-57.6102082721737	-55.6376039387554	-53.4102550123034	-49.9876169386583	-46.2819326082653	-44.8955443831786	-43.9486218027180	-43.2576582131327	-42.9509763159766	-42.9993838160689];
p21=-[108.149376224442	108.132027860933	108.136039233715	108.161186210748	109.231163455408	129.469142721348	127.160779854031	127.563905202479	124.221442159060	119.786820584885	122.431479240750	126.306863516602	126.698714087427	123.224830741679	126.392760497962	130.111718074413	133.701738060672	132.329604774015	130.770661869133	130.305960433297	130.704364222456];

%%%% MRS
c12=[1.88804974933197	1.88947359002945	1.88968069928927	1.89194938456815	1.90744913367670	4.62730821717700	23.2282057699059	46.2712756648305	67.8330556580612	78.4424700595840	77.1501393416504	70.1676505171522	65.8771970546353	62.8301498255147	79.6968499040266	101.950858507380	148.398061798480	178.078197266425	179.174792962144	167.752014302541	151.480060948370];
c21=[1.88833705246581	1.88753354204486	1.88776971714465	1.88948360325879	2.00821763523757	19.2648892988676	47.5958028242366	81.7559347922547	62.5177757071097	55.7257929293370	71.0534257347932	83.6728628019101	71.7607717879618	54.0978720553752	76.0888408692449	80.7985844953968	138.226319198729	135.855050546303	123.194995638002	117.210759384594	112.465493317554];
d12=-[-71.7359122169410	-71.8167177802731	-71.8234107976411	-71.7734045590998	-71.3746735862415	-64.9353721660607	-68.9745055819098	-65.3497660180551	-60.6731028872813	-58.0971328099844	-57.9210492427554	-58.1027420034779	-56.4982887131704	-54.4835947965636	-51.2655894850840	-47.8305859221759	-46.5446668503617	-45.4695681343679	-44.5490482500476	-43.9735971056764	-43.7451782425908];
d21=-[108.146731248133	108.130305698296	108.134481413731	108.159534238887	109.217657806713	129.024718181290	126.705808705915	127.041895010751	123.804458090330	119.595611552232	122.189865620360	125.843672702767	126.066821736773	122.367325613291	125.039896096376	128.259884607027	131.467798573389	130.333330170695	129.266659637241	129.253257041152	130.004374090027];

p21=p21+360;
d21=d21+360;
a11=abs((r12-c12)./r12)*100;
a12=abs((r21-c21)./r21)*100;
b11=abs((p12-d12));
b12=abs((p21-d21));

figure(1)
set(gca,'LooseInset',get(gca,'TightInset'))
subplot(2,3,1)
H(1)=subplot(2,3,1);    
PPP=get(H(1),'pos');      
PPP(1)=PPP(1)-0.06;       
PPP(2)=PPP(2)-0.015;       
PPP(3)=PPP(3)+0.02;      
PPP(4)=PPP(4)+0.04;      
set(H(1),'pos',PPP)  

semilogy(x,r12,'-* r','LineWidth',1.5,'MarkerSize', 15)
hold on
semilogy(x,c12,'o r','LineWidth',1.5,'MarkerSize', 15)

set(gca,'FontWeight','bold','FontSize',28,'FontName','Times New Roman');
h1=ylabel('App.resistivity(\Omega\cdotm)');
set(gca,'xticklabel','');
h2=text(-19,650,'(a) XY');
set(h2,'FontWeight','bold','FontSize',28); 
set(h2,'FontName','Times New Roman'); 
h3=legend('SG','MRS')
set(h3,'FontWeight','bold','FontSize',24); 
set(h3,'FontName','Times New Roman'); 

axis([-20 20 1 1000])
set(gca, 'yTick', [0.1 1 10 100 1000])
set(gca, 'xTick', [-20 -10 0 10 20])
set(gca,'TickLength',[0.03 0])
set(gca, 'LineWidth',2)


subplot(2,3,2)
H(2)=subplot(2,3,2);    
PPP=get(H(2),'pos');      
PPP(1)=PPP(1)-0.03;       
PPP(2)=PPP(2)-0.015;      
PPP(3)=PPP(3)+0.025;      
PPP(4)=PPP(4)+0.04;       
set(H(2),'pos',PPP)  

semilogy(x,r21,'-* b','LineWidth',1.5,'MarkerSize', 15)
hold on
semilogy(x,c21,'o b','LineWidth',1.5,'MarkerSize', 15)

set(gca,'FontWeight','bold','FontSize',28,'FontName','Times New Roman');
h1=ylabel('App.resistivity(\Omega\cdotm)');
h2=text(-19,650,'(b) YX');
set(h2,'FontWeight','bold','FontSize',28,'FontName','Times New Roman'); 

set(gca,'xticklabel','');
axis([-20 20 1 1000])
set(gca, 'yTick', [1 10 100 1000])
set(gca,'TickLength',[0.03 0])
set(gca, 'LineWidth',2)

subplot(2,3,3)
H(3)=subplot(2,3,3);    
PPP=get(H(3),'pos');      
PPP(1)=PPP(1)+0.01;       
PPP(2)=PPP(2)-0.015;       
PPP(3)=PPP(3)+0.02;      
PPP(4)=PPP(4)+0.04;       
set(H(3),'pos',PPP)  

plot(x,a11,'-x r','LineWidth',1.5,'MarkerSize', 15)
hold on
plot(x,a12,'-* b','LineWidth',1.5,'MarkerSize', 15)

h1=ylabel('Rel.difference (%)');
set(gca,'FontWeight','bold','FontSize',26,'FontName','Times New Roman');
h3=legend('XY','YX')
set(h3,'FontWeight','bold','FontSize',24); 
set(h3,'FontName','Times New Roman');

h2=text(-19,3.28,'(c)');
set(h2,'FontWeight','bold','FontSize',28,'FontName','Times New Roman');

axis([-20 20 0 3.5])
set(gca, 'xTick', [-20 -10 0 10 20])
set(gca,'xticklabel','');
set(gca,'TickLength',[0.03 0])
set(gca, 'LineWidth',2)

subplot(2,3,4)
H(4)=subplot(2,3,4);
PPP=get(H(4),'pos'); 
PPP(1)=PPP(1)-0.06;      
PPP(2)=PPP(2)+0.015;     
PPP(3)=PPP(3)+0.02;      
PPP(4)=PPP(4)+0.03;      
set(H(4),'pos',PPP)  

plot(x,p12,'-* r','LineWidth',1.5,'MarkerSize', 15)
hold on
plot(x,d12,'o r','LineWidth',1.5,'MarkerSize', 15)

h1=ylabel('Phase(\circ)');
h2=xlabel('y(km)');
axis([-20 20 20 100])
set(gca, 'xTick', [-20 -10 0 10 20])

set(gca,'FontWeight','bold','FontSize',28,'FontName','Times New Roman');
h3=text(-19,95,'(d) XY');
set(h3,'FontWeight','bold','FontSize',28);
set(h3,'FontName','Times New Roman');

set(gca,'TickLength',[0.03 0])
set(gca, 'LineWidth',2)

subplot(2,3,5)
H(5)=subplot(2,3,5);    
PPP=get(H(5),'pos');      
PPP(1)=PPP(1)-0.03;      
PPP(2)=PPP(2)+0.015;     
PPP(3)=PPP(3)+0.025;     
PPP(4)=PPP(4)+0.03;     
set(H(5),'pos',PPP) 

plot(x,p21,'-* b','LineWidth',1.5,'MarkerSize', 15)
hold on
plot(x,d21,'o b','LineWidth',1.5,'MarkerSize', 15)

h1=ylabel('Phase(\circ)');
h2=xlabel('y(km)');
axis([-20 20 200 280])
set(gca, 'yTick', [200 220 240 260 280])

set(gca,'FontWeight','bold','FontSize',28,'FontName','Times New Roman');
h3=text(-19,275.4,'(e) YX');
set(h3,'FontWeight','bold','FontSize',28);
set(h3,'FontName','Times New Roman');

set(gca,'TickLength',[0.03 0])
set(gca, 'LineWidth',2)

subplot(2,3,6)
H(6)=subplot(2,3,6);    
PPP=get(H(6),'pos');      
PPP(1)=PPP(1)+0.01;      
PPP(2)=PPP(2)+0.015;     
PPP(3)=PPP(3)+0.02;     
PPP(4)=PPP(4)+0.03;      
set(H(6),'pos',PPP) 

plot(x,b11,'-x r','LineWidth',1.5,'MarkerSize', 15)
hold on
plot(x,b12,'-* b','LineWidth',1.5,'MarkerSize', 15)

h1=ylabel('Phase difference (бу)');
h2=xlabel('y(km)');
set(gca,'FontWeight','bold','FontSize',28,'FontName','Times New Roman');

h2=text(-19,2.26,'(f)');
set(h2,'FontWeight','bold','FontSize',28,'FontName','Times New Roman');
axis([-20 20 0 2.4])
set(gca, 'xTick', [ -20 -10 0 10 20])

set(gca,'TickLength',[0.03 0])
set(gca, 'LineWidth',3)
