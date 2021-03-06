f = @(x) sin(x)-cos(x);
e = 1:12;
h = 10.^(-e);
df = (f(0+h)-f(0-h))./(2*h);
dfr = cos(0)+sin(0);
E = abs(df-dfr);
plot(E(1:end));
set(gca,'xtick',e);
set(gca,'xticklabel',num2cell(h));
ylabel('Errors');
xlabel('h');
