Exec {
    path        => "/usr/bin:/usr/sbin/:/bin:/sbin"
}

Package {
    provider => $operatingsystem ? {
        debian  => aptitude,
        ubuntu  => aptitude,
        redhat  => yum,
        fedora  => yum,
        centos  => yum
    }
}

package { ['zsh', 'vim', 'git']: }

package { 'python-pip': } ->
package { ['virtualenv', 'virtualenvwrapper', 'ipython', 'ipdb']:
    provider    => pip
}

user {
    ensure      => present,
    shell       => '/bin/zsh',
}

vcsrepo { '/home/vagrant':
    ensure      => latest,
    owner       => 'vagrant',
    group       => 'vagrant',
    provider    => git,
    require     => [ Package['git'] ],
    source      => 'https://github.com/vaidik/dotfiles.git',
    revision    => 'master',
} ->
exec { 'install dotfiles':
    command     => 'bash install.sh',
    cwd         => '/home/vagrant/dotfiles/',
    require     => [ Package['vim'] ],
    user        => 'vagrant',
}
