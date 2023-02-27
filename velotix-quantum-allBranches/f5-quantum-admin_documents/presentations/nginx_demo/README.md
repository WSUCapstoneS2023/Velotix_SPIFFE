# NGINX Demo

# Serving Static Files with NGINX

Setup a Ubuntu VM, either locally or in the cloud. If you want to set it up in the cloud, Microsoft Azure offers free credits for students. Here's a tutorial for how to create a VM in Azure: https://k21academy.com/microsoft-azure/az-104/az-104-create-and-connect-an-ubuntu-virtual-machine-in-azure/

Note: In Step 7 of the above tutorial, make sure you also select HTTP and HTTPs in the inbound ports dropdown. We'll be allowing connections to our website through those ports, so if you don't select them, you won't be able to load the site and you'll have to manually add them later under your VM's 'Networking Tab'.

Once you've created your Ubuntu VM, login to it locally or SSH into your server. Run these commands to install the dependencies we'll need for the project:

```
sudo apt update
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash - # download latest 16th version of NodeJS
sudo apt-get install -y nodejs
sudo apt install nginx
```

Check that they were installed correctly by running:

```
node --version
npm --version
nginx -v
```

Now run nginx:

    sudo systemctl enable nginx # load nginx every time server starts
    sudo systemctl start nginx
    service nginx status # check that nginx is running

Now let's configure Ubuntu's firewall

    sudo ufw app list
    sudo ufw allow ssh
    sudo ufw allow 'Nginx Full' # allows both HTTP and HTTPS connections
    sudo ufw enable
    sudo ufw status numbered # check that the firewall is running

Download the React web apps. There's two ways to do this. If you're locally hosting your VM, then download the .zip file and move it over to the VM. If you're using a server in the cloud, you'll need to create a new SSH key for your GitHub account for the server. It's pretty simple to do and once you're done following the demo, you can delete the SSH key from your GitHub account

- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
- https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

```
    cd ~
    git clone repo
    cd repo
    ls
```

There should be two folders: one called static_ecommerce and dynamic_ecommerce. The static one contains a one page, static React web app. The other one contains a dynamic React web app, which is hooked up to a database containing the information for some of the items on the page

Place the build folder inside `var/www/html`. You may need to change this path if you're using a local VM and you downloaded the .zip to a different location.

    sudo cp -r ~/docker_demo/static_ecommerce/. /var/www/html/ecommerce

Why `var/www/html/ecommerce`? We could technically put our build folder anywhere we wanted to, but `var/www/html` is the default root folder of the web server

    cp /etc/nginx/sites-available/default /etc/nginx/conf.d/mysite.conf
    sudo nano /etc/nginx/conf.d/mysite.conf

Here are the common shortcuts to use with nano:

- `Ctrl + A` - move to beginning of line
- `Ctrl + E` - move to end of line
- `Ctrl + K` - delete entire line
- `Ctrl + O` - save file without exiting
- `Ctrl + X` - exit, will prompt you to save if you haven't already

Use `Ctrl + K` to delete the excess comments at the top. Keep modifying the configuration file until it looks like this:

```
server {
        listen 80 default_server;
        listen [::]:80;

        server_name 20.125.22.4;

        root /var/www/html/ecommerce;
        index index.html index.htm index.nginx-debian.html;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files $uri $uri/ =404;
        }
}
```

the IP address for server_name will be different depending on the IP address of your server.

Now let's verify our configuration file has no errors:

    sudo nginx -t

Check the status of NGINX and if it's ok, reload the configuration file:

    systemctl status nginx
    sudo nginx -s reload

If you visit your server's IP address, you should now see the site!

# Adding a database and reverse proxy

Open the dynamic_ecommerce folder and install the node dependencies by running:

```
cd client
npm i
cd ../server
npm i
```

Run

    docker-compose up --build

# Adding TLS Certificate

TODO: Need to investigate certbort alternatives further

# Further Reading

[sites-enabled vs sites-allowed](https://serverfault.com/questions/527630/difference-in-sites-available-vs-sites-enabled-vs-conf-d-directories-nginx)
