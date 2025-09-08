
% call with:   delay_sensitivity_resolution(20,0.10,5, 100e-9, 100)

function delay_sensitivity_resolution(Tamb_C, L, v0, sigma_t, N)
  if nargin < 5, N = 1; end
  if nargin < 4, sigma_t = 100e-9; end            % default 100 ns

  c = 331.3 + 0.606 * Tamb_C;
  span = max(10, 2*abs(v0));
  v = linspace(-span, span, 601);

  % Δt and sensitivity
  Dt  = 2*L.*v ./ (c^2 - v.^2);
  dDd = 2*L.*(c^2 + v.^2) ./ (c^2 - v.^2).^2;

  % Wind resolution from timing resolution (with averaging)
  sigma_v = (sigma_t./dDd) ./ sqrt(N);

  figure(2); clf;

  % ----- (1) Δt vs v -----
  subplot(3,1,1);
  plot(v, 1e6*Dt, 'LineWidth', 2); grid on; box on;
  hold on;
  % horizontal @ 0
  xl = xlim; plot(xl, [0 0], 'k:');
  % vertical @ v=0
  yl = ylim; plot([0 0], yl, 'k:'); ylim(yl);  % restore after line
  ylabel('\Delta t (\mus)');
  title(sprintf('\\Delta t vs v | T=%.1f^\\circC, L=%.3f m, c=%.2f m/s', Tamb_C, L, c));

  % ----- (2) d(Δt)/dv vs v -----
  subplot(3,1,2);
  plot(v, 1e6*dDd, 'LineWidth', 2); grid on; box on;
  hold on;
  xl = xlim; plot(xl, [0 0], 'k:');
  yl = ylim; plot([0 0], yl, 'k:'); ylim(yl);
  ylabel('d(\Delta t)/dv (\mus / (m/s))');

  % ----- (3) σ_v vs v -----
  subplot(3,1,3);
  plot(v, sigma_v, 'LineWidth', 2); grid on; box on;
  hold on;
  yl = ylim; plot([0 0], yl, 'k:'); ylim(yl);
  xlabel('Wind speed v (m/s)'); ylabel('\sigma_v (m/s)');
  title(sprintf('\\sigma_t = %.0f ns, N = %d → small-v \\sigma_v \\approx %.3g m/s', ...
        sigma_t*1e9, N, (c^2/(2*L))*sigma_t/sqrt(N)));
end

