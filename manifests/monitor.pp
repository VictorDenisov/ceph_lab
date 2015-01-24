stage { 'first':
	before => Stage['main'],
}

class { 'apt':
	always_apt_update => true,
	fancy_progress    => true,
	stage             => first,
}

exec { '/bin/hostname monitor': }

file { '/etc/hostname':
	ensure  => file,
	content => "monitor",
	owner   => 'root',
	group   => 'root',
}

package { 'ceph':
	ensure => present,
}
