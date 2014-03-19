heroku-vim
==========

Installs vim in a dyno and starts a bash session.

Changes PATH and EDITOR env vars.

## Install

```
$ heroku plugins:install https://github.com/naaman/heroku-vim
```

## Use

```
heroku vim
```

## Example Output
```
$ heroku vim
Running `mkdir vim
curl https://s3.amazonaws.com/heroku-vim/vim-7.3.tar.gz --location --silent | tar xz -C vim
export PATH=$PATH:/app/vim/bin
bash` attached to terminal... up, run.2135
~ $ cat README
This is your new Play application
=====================================

This file will be packaged with your application, when using `play dist`.
~ $ vim README
~ $ cat README
Changed on a dyno!
```
