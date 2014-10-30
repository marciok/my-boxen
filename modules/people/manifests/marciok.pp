class people::marciok {

# Homebrew packages
package {
  [
    'mogenerator',
    'openssl',
    'zsh'
  ]:
}

# osx
  osx::recovery_message { 'If this Mac is found, please email marcioklepacz@gmail.com': }
  include osx::universal_access::ctrl_mod_zoom
  include osx::finder::show_hidden_files
  include osx::dock::autohide
  include osx::finder::empty_trash_securely

  class { 'osx::dock::position':
    position => 'left'
  }

# Essentials
  include chrome
  include iterm2::stable
  include dash
  include github_for_mac
  include charles
  include atom
  include seil

# Extras
  include skype
  include vlc

  repository {
    'macvim install and dotfiles':
      source   => 'git://github.com/marciok/macvim-yadr.git',
      path     => "/Users/${::boxen_user}/.yadr",
      provider => 'git',
  }

  # installing Alcatraz for xcode
  # Note: couldn't manage how to install a tar.gz with puppet
  $plugins_dir = "/Users/${::boxen_user}/Library/Application\\ Support/Developer/Shared/Xcode/Plug-ins"
  $download_uri = "https://github.com/supermarin/Alcatraz/releases/download/1.0.8/Alcatraz.tar.gz"

  exec { "installing alcatraz":
    command => "/bin/mkdir -p ${plugins_dir} && curl -L ${download_uri} | tar xvz -C ${plugins_dir}",
    creates => $plugins_dir
  }

}
