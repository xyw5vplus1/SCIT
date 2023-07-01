clear
clc;
load fig_Type1error
x = 1:5;
y = 1:6;
sam = [" 25"," 50"," 100"," 200"," 400"," 800"," 1600"," 3200"];
lw = 1.6;
w = 3.5;
for k = 1:8
    subplot(4,4,k)
    plot(x,d(y(1)+(k-1)*6,:),'s-','LineWidth',lw,'MarkerSize',lw*w,'Color',[0.12,0.56,1]);hold on
    plot(x,d(y(4)+(k-1)*6,:),'s--','LineWidth',lw,'MarkerSize',lw*w,'Color',[0.12,0.56,1]);hold on
    plot(x,d(y(2)+(k-1)*6,:),'-','LineWidth',lw,'MarkerSize',lw*w,'Color',[1,0.27,0]);hold on
    plot(x,d(y(5)+(k-1)*6,:),'*--','LineWidth',lw,'MarkerSize',lw*w,'Color',[1,0.27,0]);hold on
    plot(x,d(y(3)+(k-1)*6,:),'+-','LineWidth',lw,'MarkerSize',lw*w,'Color',[0.19,0.80,0.19]);hold on
    plot(x,d(y(6)+(k-1)*6,:),'+--','LineWidth',lw,'MarkerSize',lw*w,'Color',[0.19,0.80,0.19]);hold on
    xlim([0.8,5.2]);
    ylim([-0.02,0.12]);
    set(gca,'xtick',1:5);
    set(gca,'ytick',[0 0.05 0.1]);
    xlabel(strcat('Samples =',sam(k)),'FontSize',12,'Fontname','Times New Roman');
    if k == 1 || k == 5
        ylabel('Type I error rate','FontSize',12,'Fontname','Times New Roman');
    end
    grid minor
end
load fig_Type2error
for k = 1:8
    subplot(4,4,k+8)
    plot(x,d(y(1)+(k-1)*6,:),'s-','LineWidth',lw,'MarkerSize',lw*w,'Color',[0.12,0.56,1]);hold on
    plot(x,d(y(4)+(k-1)*6,:),'s--','LineWidth',lw,'MarkerSize',lw*w,'Color',[0.12,0.56,1]);hold on
    plot(x,d(y(2)+(k-1)*6,:),'*-','LineWidth',lw,'MarkerSize',lw*w,'Color',[1,0.27,0]);hold on
    plot(x,d(y(5)+(k-1)*6,:),'*--','LineWidth',lw,'MarkerSize',lw*w,'Color',[1,0.27,0]);hold on
    plot(x,d(y(3)+(k-1)*6,:),'+-','LineWidth',lw,'MarkerSize',lw*w,'Color',[0.19,0.80,0.19]);hold on
    plot(x,d(y(6)+(k-1)*6,:),'+--','LineWidth',lw,'MarkerSize',lw*w,'Color',[0.19,0.80,0.19]);hold on
    xlim([0.8,5.2]);
    ylim([-0.1,1.05]);
    set(gca,'xtick',1:5);
    set(gca,'ytick',[0 0.5 1]);
    xlabel(strcat('Samples =',sam(k)),'FontSize',12,'Fontname','Times New Roman');
    if k == 1 || k == 5
        ylabel('Type II error rate','FontSize',12,'Fontname','Times New Roman');
    end
    grid minor
end
set(gca,'LooseInset',get(gca,'TightInset'));
% set(gca, 'LooseInset', [0,0,0,0]);
legend('SCITk-\alpha1','SCITk-\alpha2','SCITn-\alpha1','SCITn-\alpha2','KCIT-\alpha1','KCIT-\alpha2','Fontname','Times New Roman','NumColumns',6,'FontSize',12);
