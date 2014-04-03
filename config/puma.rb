rails_env = 'production'

threads 4,4

bind  "unix:///var/www/danceevent/shared/tmp/puma/de.sock"
pidfile "/var/www/danceevent/current/tmp/puma/pid"
state_path "/var/www/danceevent/current/tmp/puma/state"

activate_control_app