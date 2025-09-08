function delay_sensitivity()
  %--------- Inputs ----------
  Tamb_C = 20;    % Ambient temperature in °C
  L      = 0.10;  % Path length in meters
  v0     = 5;     % Target wind speed (m/s)

  %--------- Speed of sound ----------
  c = 331.3 + 0.606 * Tamb_C;  % m/s

  %--------- Sweep around v0 ----------
  span = max(10, 2*abs(v0));
  v = linspace(-span, span, 601);

  % Avoid division by zero (plots don't reach ±c anyway)
  v(abs(v) >= 0.999*c) = sign(v(abs(v) >= 0.999*c)) * 0.999*c;

  %--------- Times of flight ----------
  tAB = L ./ (c + v);
  tBA = L ./ (c - v);

  % Specific point at v0
  tAB0 = L / (c + v0);
  tBA0 = L / (c - v0);

  %--------- Plot on main axes (m/s) ----------
  figure(1); clf;
  h1 = plot(v, 1e3*tAB, 'b-', 'LineWidth', 2); hold on;
  h2 = plot(v, 1e3*tBA, 'r-', 'LineWidth', 2);
  h3 = plot([min(v) max(v)], [1 1]*1e3*L/c, 'k--', 'LineWidth', 1); % still-air line
  % markers (plot them before legend and capture handles)
  h4 = plot(v0, 1e3*tAB0, 'bo', 'MarkerSize', 7, 'LineWidth', 1.5);
  h5 = plot(v0, 1e3*tBA0, 'ro', 'MarkerSize', 7, 'LineWidth', 1.5);

  grid on; box on;
  ax1 = gca; % main axis in m/s

  %--------- Stacked bottom axes: m/s (bottom), kt (second row) ----------
  ax1 = gca; grid on; box on;
  xlabel(ax1,'Wind speed v (m/s)');    % keep m/s labels visible
  
  % Lift the main plot a bit to make room for a second row of x labels
  pos1  = get(ax1,'Position');
  delta = 0.08;
  pos1(2) = pos1(2) + delta;
  pos1(4) = pos1(4) - delta;
  set(ax1,'Position',pos1);
  
  % Second axes used only to draw kt ticks/labels just below the m/s row
  pos2      = pos1;
  pos2(2)   = pos1(2) - 0.75*delta;     % place slightly below ax1's x-axis
  ax2 = axes('Position',pos2, ...
             'Color','none', ...
             'XAxisLocation','bottom', ...
             'YAxisLocation','right', ...
             'XLim', ms2kts(get(ax1,'XLim')), ...
             'YLim', get(ax1,'YLim'), ...
             'YTick', [], ...
             'Box','off', ...
             'HitTest','off');
  
  % Make kt ticks line up with the m/s ticks
  xt_ms  = get(ax1,'XTick');
  set(ax2,'XTick', ms2kts(xt_ms));
  xlabel(ax2,'Wind speed (kt)');
  
  % IMPORTANT: do NOT hide ax1's tick labels now
  % set(ax1,'XTickLabel',[]);  % <-- remove/comment this
  


  % Switch back to ax1 for labels/legend/title
  axes(ax1);
  xlabel('Wind speed v (m/s)');
  ylabel('Time of flight (ms)');
  title(sprintf('ToF vs wind | T=%.1f^\\circC, L=%.3f m, c=%.2f m/s', Tamb_C, L, c));
  legend([h1 h2 h3 h4 h5], ...
         {'t_{AB} = L/(c+v)', 't_{BA} = L/(c-v)', 't_{still}', ...
          't_{AB} @ v_0', 't_{BA} @ v_0'}, ...
         'Location', 'northeast');

  %--------- Print outputs ----------
  fprintf('Speed of sound c = %.3f m/s\n', c);
  fprintf('At v0 = %.3f m/s, L = %.3f m:\n', v0, L);
  fprintf('  t_AB = %.6f ms\n', 1e3*tAB0);
  fprintf('  t_BA = %.6f ms\n', 1e3*tBA0);
  fprintf('  Δt   = %.6f µs\n', 1e6*(tAB0 - tBA0));
end

% Conversion helpers
function kts = ms2kts(ms)
  kts = ms * 3600 / 1852;   % exact: 1 m/s = 1.94384 kt
end

function ms = kts2ms(kts)
  ms = kts * 1852 / 3600;   % exact: 1 kt = 0.51444 m/s
end
