require 'heroku/helpers'
require 'heroku/command'
require 'heroku/command/run'

class Heroku::Command::Vim < Heroku::Command::Run

  # vim
  # 
  # Run bash on heroku with vim
  #  
  def index
    run_attached(vim_cmd)
  end

  protected

  def vim_cmd
    if File.file?(File.expand_path("~/.inputrc_heroku"))
      inputrc = File.open(File.expand_path("~/.inputrc_heroku"), "r").read
    else
      inputrc = File.open(File.expand_path("~/.inputrc"), "r").read
    end
    <<-CMD
mkdir $HOME/vim
cd $HOME/vim
# Staically linked vim version compiled from https://github.com/ericpruitt/static-vim
# Compiled on Jul 20 2017
curl 'https://s3.amazonaws.com/bengoa/vim-static.tar.gz' | tar -xz
export VIMRUNTIME="$HOME/vim/runtime"
export PATH="$HOME/vim:$PATH"
export EDITOR=vim
set -o vi
cat > ~/.inputrc << EOF
#{inputrc}
EOF
bash
    CMD
  end

end
