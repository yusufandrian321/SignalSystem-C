n = 0:20;
x = sin(0.2*pi*n);

% FIR: moving average 3
h_fir = ones(1,3)/3;
y_fir = conv(x,h_fir,'same');

% IIR: exponential decay
alpha = 0.8;
h_iir = alpha.^n;
y_iir = conv(x,h_iir,'same');

subplot(3,1,1);
stem(n,x); title('Input Sinus');

subplot(3,1,2);
stem(n,y_fir); title('Output FIR (MAF)');

subplot(3,1,3);
stem(n,y_iir); title('Output IIR (Exponential)');
