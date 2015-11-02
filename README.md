# conda-build-centos-6.6

Vagrant config for building conda packages on GNU/Linux

## Dependencies

Make sure to have the most recent version of
[VirtualBox](https://www.virtualbox.org) and
[Vagrant](https://www.vagrantup.com) installed.
    
## Use the box

Create a directory and initialize the box in it:

    mkdir -p inria-pro-sed/conda-build-centos-6.6
    cd inria-pro-sed/conda-build-centos-6.6
    vagrant init inria-pro-sed/conda-build-centos-6.6

In the `Vagrantfile`, synchronise your conda recipe directory:

    config.vm.synced_folder "/path/to/repo/sed-pro-inria/conda-recipes",
      "/home/vagrant/repo/sed-pro-inria/conda-recipes"

and increase cpu and memory:

    # Memory and CPU.
    config.vm.provider "virtualbox" do |v|
      v.memory = 4096
      v.cpus = 8
    end

Start the machine, and connect to it:

    vagrant up
    vagrant ssh

Build your conda package and use the `upload` alias to upload on
`anaconda.org`:

    - on the `inria-pro-sed` user,
    - on the `main,X.X.X` channels.

## Build a new box

Make changes in `Vangrantfile`, `ressources/` or `script/`.

Update `CHANGELOG`.

Update version number in `ressources/_bashrc`.

Between two tagged versions, set the version number to X.X.Xdev in
`vagrant_box_version` file.

Commit and tag:

    git add ressources/_bashrc
    git commit -m "Bump conda-build-centos-6.6 version number to X.X.X"
    git tag centos-6.6-X.X.X

Destroy old box, and create a new one:

    vagrant destroy
    vagrant up

Package the box, and add into Vagrant:

    vagrant package --output conda-build-centos-6.6.box

Upload the box to using the web interface at
    https://atlas.hashicorp.com/inria-pro-sed/boxes/conda-build-centos-6.6

Or generate a token from here, store it in `$ATLAS_TOKEN`
    https://atlas.hashicorp.com/settings/tokens

and use the API:
    https://vagrantcloud.com/docs/providers

For example:

    # TODO: create a provider

    # Upload a box for provider
    curl https://atlas.hashicorp.com/api/v1/box/inria-pro-sed/conda-build-centos-6.6/version/$VAGRANT_BOX_VERSION/provider/virtualbox/upload?access_token=$ATLAS_TOKEN
    UPLOAD_PATH=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX # Use value returned by previous command
    curl -X PUT --upload-file $AGRANT_BOX_NAME.box https://binstore.hashicorp.com/$UPLOAD_PATH # display nothing, just wait...

# glibc and gcc versions

From http://distrowatch.com:

| distro       | glibc  | gcc   |
---------------------------------
| centos 5.11  | 2.5    | 4.1.2 |
| centos 6.6   | 2.12   | 4.4.7 |
| centos 7.0   | 2.17   | 4.8.3 |
| ubuntu 12.04 | 2.15   | 4.6.3 |
| ubuntu 14.04 | 2.19   | 4.8.2 |
| debian 7     | 2.13   | 4.7.2 |
| fedora 17    | 2.15   | 4.7.0 |
| suse 12.1    | 2.12.1 | 4.6.2 |
| 2011.08.19   | 2.14   |       |

Currently (5 october, 2015), gcc conda package (4.8.5-3, in asmeurer channel),
has too much problems:

  - https://groups.google.com/a/continuum.io/forum/#!search/froger/conda/Lb_Vnz6O85s/20dsvlvlBwAJ
  - https://github.com/conda/conda-recipes/issues/435
  - https://github.com/conda/conda-recipes/issues/431
