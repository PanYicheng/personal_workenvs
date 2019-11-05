# personal_workenvs
build my personal develop environment of vim and tmux

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

### Plugins
插件配置方法

#### Vundle
插件管理器，用于自动化地安装和移除其他插件的工具

其安装方法见其github页面[Vundle](https://github.com/VundleVim/Vundle.vim)

使用当前库目录下的vim.vimrc文件内容放到.vimrc里就可以完成插件的安装。

> 该过程使用git下载插件的文件，如果git需要设置代理，则可以使用如下指令，参考[Stackoverfloww][1]\
> 使用代理```git config --global http.proxy 'socks5://127.0.0.1:7070'```\
> 关闭代理```git config --global --unset http.proxy```


[1]: https://stackoverflow.com/questions/15227130/using-a-socks-proxy-with-git-for-the-http-transport "Stackoverflow"