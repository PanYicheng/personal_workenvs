# personal_workenvs
* Build my personal develop environment of vim and tmux
* Setup my favorite docker image for deep learning

## Vim
安装vim 8.0, 8.0版本支持插件的异步执行，能很大的提高插件的载入速度，故推荐使用，通过```vim --version```查看

可以选择如下安装方式之一
### PPA
适用于系统为Ubuntu 16.04, Ubuntu 14.04, Linux Mint 18/17和它们的衍生版本
```bash
add-apt-repository ppa:jonathonf/vim
apt update
apt install vim
```
> 移除Vim以及PPA
> 
> ```apt remove vim```\
> ```sudo apt install ppa-purge && sudo ppa-purge ppa:jonathonf/vim```

### Git
从源码编译安装
```
sudo apt install git
git clone https://github.com/vim/vim.git
cd vim
./configure
sudo apt install ncurses-dev
make
sudo make install
```

### Vundle
插件管理器，用于自动化地安装和移除其他插件的工具

其安装方法见其github页面[Vundle](https://github.com/VundleVim/Vundle.vim)

使用当前库目录下的vim.vimrc文件内容放到.vimrc里就可以完成插件的安装。

> 该过程使用git下载插件的文件，如果git需要设置代理，则可以使用如下指令，参考[Stackoverfloww][1]\
> 使用代理```git config --global http.proxy 'socks5://127.0.0.1:7070'```\
> 关闭代理```git config --global --unset http.proxy```

## Tmux
Tmux是类似screen的终端复用工具，可以远程运行并挂起终端，并且可以同步多个远程终端。

配置文件为本目录下的```.tmux.conf```文件，将其内容添加到用户目录下的同名文件即可。

### Key Bindings
* Ctrl-A %: split panel vertically
* Ctrl-A ": split panel horizontally
* Ctrl-A hjkl: move between panels like vim's hjkl
* Ctrl-A c: create new window
* Ctrl-A [: copy mode (can scrollback the buffer)
* Ctrl-A ,: change window name

## ml-workspace
一个包含了常见的深度学习库和jupyter notebook的docker镜像，可以通过环境变量配置密码以及各种容器属性。具体配置参考[ml-workspace](https://github.com/ml-tooling/ml-workspace)



[1]: https://stackoverflow.com/questions/15227130/using-a-socks-proxy-with-git-for-the-http-transport "Stackoverflow"