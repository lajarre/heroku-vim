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
mkdir vim
curl https://s3.amazonaws.com/heroku-vim/vim-7.3.tar.gz --location --silent | tar xz -C vim
export PATH=$PATH:/app/vim/bin
export EDITOR=vim
set -o vi
cat > ~/.inputrc << EOF
#{inputrc}
EOF
bash
    CMD
  end

end
