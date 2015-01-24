stage { 'first':
	before => Stage['main'],
}

class { 'apt':
	always_apt_update => true,
	fancy_progress    => true,
	stage             => first,
}

exec { '/bin/hostname osd1': }

file { '/etc/hostname':
	ensure  => file,
	content => "osd1",
	owner   => 'root',
	group   => 'root',
}

package { 'ceph':
	ensure => present,
}
