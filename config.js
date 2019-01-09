// See https://github.com/Invoca/statsd exampleConfig.js for config options and defaults

{
  graphitePort: 2003,
  graphiteHost: "graphite.example.com",
  port: 8125,
  backends: [ "./backends/graphite" ],
  dumpMessages: false,
  deleteSets: true,
  timer_metrics_filters: ['count_percent', 'lower_percent', 'std', 'sum', 'sum_percent', 'sum_squares', 'sum_squares_percent']
}
