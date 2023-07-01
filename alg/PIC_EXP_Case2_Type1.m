clear;
clc;
load type1case2.mat;load type1case2error.mat;
x=[1,2,3,4,5];d = ave_score1;e = error_bar1;
%-----------------------------------------------------
gap = [0 7 14 21];
lw = 1.8;
for k = 1:4
    g = gap(k);
    subplot(1,4,k);
    plot(x,d(3+g,:),'--c','LineWidth',lw);
    hold on;
    plot(x,d(4+g,:),'--b','LineWidth',lw);
    hold on;
    plot(x,d(5+g,:),'--g','LineWidth',lw);
    hold on;
    plot(x,d(6+g,:),'--y','LineWidth',lw);
    hold on;
    plot(x,d(7+g,:),'--k','LineWidth',lw);
    hold on;
    plot(x,d(1+g,:),'m','LineWidth',lw);
    hold on;
    plot(x,d(2+g,:),'r','LineWidth',lw);
    hold on;
    grid minor;
    % xlim([0.8,5.2]);
    % ylim([-0.02,0.4]);
    set(gca,'xtick',[1,2,3,4,5]);
    % set(gca,'ytick',[0 0.1 0.2 0.3]);
    xlabel('Size of \itZ','Fontname','Times New Roman');
    ylabel('Type II error rate','Fontname','Times New Roman');
end