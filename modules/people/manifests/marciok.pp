class people::marciok {

# Homebrew packages
package {
  [
    'mogenerator',
    'openssl',
    'zsh'
  ]:
}

# Essentials
  include chrome
  include iterm2::stable
  include macvim
  include dash
  include github_for_mac
  include charles
  include atom

  include seil::login_item

  # change the left control to F19:
  seil::bind { 'keyboard bindings':
    mappings => { 'capslock' => 53 }
  }

  include vim
  vim::bundle { [
    'scrooloose/syntastic',
    'scrooloose/nerdtree',
    'jistr/vim-nerdtree-tabs',
    'tpope/vim-surround',
    'tpope/vim-rails',
    'tpope/vim-markdown',
    'toyamarinyon/vim-swift',
    'kien/ctrlp.vim',
    'altercation/vim-colors-solarized'
  ]: }

  file { "${vim::vimrc}":
    target  => "/Users/${::boxen_user}/.dotfiles/.vimrc",
    require => Repository["/Users/${::boxen_user}/.dotfiles"]
  }

# Extras
  include skype

  repository { 
    'dotfiles forked from mathiasbynens':
    source  => 'git://github.com/marciok/dotfiles.git',
    path => "/Users/${::boxen_user}/.dotfiles"
    provider => 'git'
  }

}
