Vagrant + Puppet development setup
==================================

Deploys apache2 and php with the required extensions for running Ushahidi.
Also installs php unit so you can run Ushahidi unit tests.

Requirements:
* Vagrant (http://vagrantup.com/)
* MySQL (http://dev.mysql.com/downloads/mysql/) - installed on the host machine

Once you've got vagrant and puppet installed, deploy a new dev box:

    vagrant up

If you're going to deploy multiple dev boxes you'll want to change the IP address in Vagrantfile.
