# Define roles, user and IP address of deployment server
# role :name, %{[user]@[IP adde.]}
role :app, %w{root@104.131.43.54}
role :web, %w{root@104.131.43.54}
role :db, %w{root@104.131.43.54}

# Define server(s)
server '104.131.43.54', user: 'root', roles: %w{web}

# SSH Options
# See the example commented out section in the file
# for more options.
# set :ssh_options, {
#     forward_agent: false,
#     auth_methods: %w(password),
#     password: 'qx2xsze8',
#     user: 'root'
# }