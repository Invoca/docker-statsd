// See https://github.com/Invoca/statsd exampleConfig.js for config options and defaults

{
  graphitePort: 2003,
  graphiteHost: "graphite.example.com",
  port: 8125,
  backends: [ "./backends/graphite" ],
  percentThreshold: [ 90, 99],
  deleteCounters: true,
  deleteSet: true,
  deleteTimers: true,
  calculated_timer_metrics: ['count', 'lower', 'mean', 'mean_percent', 'median', 'upper', 'upper_percent']
}
