# Define roles, user and IP address of deployment server
# role :name, %{[user]@[IP adde.]}
role :app, %w{root@162.243.120.210}
role :web, %w{root@162.243.120.210}
role :db, %w{root@162.243.120.210}

# Define server(s)
server '162.243.120.210', user: 'root', roles: %w{web}

# SSH Options
# See the example commented out section in the file
# for more options.
set :ssh_options, {
    forward_agent: false,
    auth_methods: %w(password),
    password: 'madeira01',
    user: 'root',
}