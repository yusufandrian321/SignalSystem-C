% ==============================================
% Animasi Konvolusi Diskrit: Flip and Slide
% ==============================================

% Definisikan sinyal input x[n] dan h[n]
x = [1, 2, 3, 4, 2, 1];        % input signal
h = [0.5, 1, 0.5, 0.25];       % impulse response

% Panjang sinyal
N_x = length(x);
N_h = length(h);

% Panjang hasil konvolusi
N_y = N_x + N_h - 1;

% Inisialisasi output
y = zeros(1, N_y);

% Buat figure
figure;

% Loop untuk setiap index output y[n]
for n = 1:N_y
    % ------------------------------------------------
    % 1. Buat h yang sudah di-flip dan di-shift
    % ------------------------------------------------
    h_flipped_shifted = zeros(1, N_y);
    for k = 1:N_h
        idx_x = n - k + 1;  % posisi x yang overlap dengan h
        if idx_x >= 1 && idx_x <= N_x
            % h dibalik -> ambil dari ujung belakang
            h_flipped_shifted(idx_x) = h(N_h - k + 1);
        end
    end
    
    % ------------------------------------------------
    % 2. Perkalian titik per titik antara x[n] dan h_shifted
    % ------------------------------------------------
    product = x .* h_flipped_shifted(1:N_x);
    
    % ------------------------------------------------
    % 3. Penjumlahan (integrasi diskrit)
    % ------------------------------------------------
    y(n) = sum(product);
    
    % ------------------------------------------------
    % 4. Plot animasi
    % ------------------------------------------------
    clf; % clear figure
    
    % Plot input x[n]
    subplot(4, 1, 1);
    stem(1:N_x, x, 'b', 'filled', 'LineWidth', 2);
    title('Input Signal x[n]');
    xlim([0, N_y + 1]);
    ylim([0, max(x)*1.2]);
    grid on;
    
    % Plot h yang sudah dibalik dan digeser
    subplot(4, 1, 2);
    stem(1:N_y, h_flipped_shifted, 'r', 'filled', 'LineWidth', 2);
    title(sprintf('Shifted & Flipped h[n] (posisi: %d)', n));
    xlim([0, N_y + 1]);
    ylim([0, max(h)*1.2]);
    grid on;
    
    % Plot hasil perkalian titik-per-titik
    subplot(4, 1, 3);
    stem(1:N_x, product, 'm', 'filled', 'LineWidth', 2);
    title('Product x[k] * h_flipped[k]');
    xlim([0, N_y + 1]);
    ylim([0, max(product)*1.2]);
    grid on;
    
    % Plot hasil konvolusi yang sudah jadi sampai index ke-n
    subplot(4, 1, 4);
    stem(1:N_y, y, 'g', 'filled', 'LineWidth', 2);
    title('Convolution Result y[n]');
    xlim([0, N_y + 1]);
    ylim([0, max(y)*1.2]);
    grid on;
    
    pause(1); % jeda animasi (bisa diganti lebih cepat/lambat)
end
