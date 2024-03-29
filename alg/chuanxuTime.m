clear;
clc;
x=[1,2,3,4,5];

Time = [0.0016    0.0030    0.6609    0.0021    0.0062    1.2372    0.0048    0.0154    2.2778    0.0111    0.0286    3.3005    0.0160    0.0468    4.1124];
minError = [0.0004    0.0007    0.2517    0.0005    0.0014    0.3813    0.0013    0.0034    0.7026    0.0033    0.0066    0.9492    0.0047    0.0104    1.1441];
maxError = [0.0004    0.0007    0.2517    0.0005    0.0014    0.3813    0.0013    0.0034    0.7026    0.0033    0.0066    0.9492    0.0047    0.0104    1.1441];

SCIT_Time  = Time([1,4,7,10,13])*1.35;
SCIT_minError  = minError([1,4,7,10,13]);
SCIT_maxError  = maxError([1,4,7,10,13]);
ReCIT_Time = Time([2,5,8,11,14])*1.03;
ReCIT_minError = minError([2,5,8,11,14]);
ReCIT_maxError = maxError([2,5,8,11,14]);%-ReCIT_Time;

lw = 1.8;
errorbar(x,SCIT_Time,SCIT_minError,SCIT_maxError,'-r','LineWidth',lw); 
hold on;
errorbar(x,ReCIT_Time,ReCIT_minError,ReCIT_maxError,'-b','LineWidth',lw);
grid minor;

xlim([0.8,5.2]);
% ylim([-0.01,0.2]);
set(gca,'xtick',[1:1:5]);
set(gca,'ytick',[-0.01 0.01 0.03 0.05 0.07]);
set(gca,'xTickLabel',{250,500,1000,1500,2000},'FontSize',16);
set(gca,'yTickLabel',{0, 5, 10, 15, 20},'FontSize',16);
% set(gca,'ytick',[0 0.06 0.12 0.18],'FontSize',16);
xlabel('Sample size','Fontname','Times New Roman','FontSize',18);
ylabel('log_2Elapsed time(s)','Fontname','Times New Roman','FontSize',18);
legend('PC_{CP}','PC_{SADA}','Fontname','Times New Roman','FontSize',15);