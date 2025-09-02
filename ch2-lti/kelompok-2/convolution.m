n = 0:50;
x = sin(0.1*pi*n);

% FIR: moving average 10
h_fir = ones(1,5)/5;
y_fir = conv(x,h_fir,'same');

% IIR: exponential decay alpha lebih besar
alpha = 2;
h_iir = alpha.^n;
y_iir = conv(x,h_iir,'same');

subplot(3,1,1);
stem(n,x); title('Input Sinus');

subplot(3,1,2);
stem(n,y_fir); title('Output FIR');

subplot(3,1,3);
stem(n,y_iir); title('Output IIR (Exponential)');

