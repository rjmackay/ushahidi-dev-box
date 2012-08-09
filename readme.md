Vagrant + Puppet development setup
==================================

Deploys apache2 and php with the required extensions for running Ushahidi, 
installs php unit so you can run Ushahidi unit tests, and mounts the root directory
to /var/www/ (over nfs)

Drop these files into your ushahidi doc root and deploy from there.

Requirements:
* Vagrant (http://vagrantup.com/)
* MySQL (http://dev.mysql.com/downloads/mysql/) - installed on the host machine

Once you've got vagrant and puppet installed, deploy a new dev box:

    vagrant up

If you're going to deploy multiple dev boxes you'll want to change the IP address in Vagrantfile.
