# Personal Work Envs
建立个人常见的开发环境设置，包括:
* vim
* tmux
* ml-workspace

## Vim
建议安装vim 8.0版本。该版本支持插件的异步执行，能很大的提高插件的载入速度，可通过```vim --version```查看。

可以选择如下安装方式：
### PPA
适用于系统为Ubuntu 16.04, Ubuntu 14.04, Linux Mint 18/17和它们的衍生版本
```bash
add-apt-repository ppa:jonathonf/vim
apt update
apt install vim
```
移除Vim以及PPA
```bash
apt remove vim
sudo apt install ppa-purge && sudo ppa-purge ppa:jonathonf/vim
```

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
插件管理器[Vundle](https://github.com/VundleVim/Vundle.vim)，用于自动化地安装和移除其他插件的工具。
安装方法：
```git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim```

将```vim.vimrc```的内容写入```~/.vimrc```，并在vim内运行```:PluginInstall```就可以完成插件的安装。

> 该过程使用git下载插件的文件，如果git需要设置代理，则可以使用如下指令，参考[Stackoverfloww][1]\
> 使用代理```git config --global http.proxy 'socks5://127.0.0.1:7070'```\
> 关闭代理```git config --global --unset http.proxy```

## Tmux
Tmux是类似screen的终端复用工具，可以远程运行并挂起终端，并且可以同步多个远程终端。

配置文件为本目录下的```.tmux.conf```文件，将其内容添加到用户目录下的同名文件即可。

### Key Binding Definitions
* Ctrl-A %: split panel vertically
* Ctrl-A ": split panel horizontally
* Ctrl-A hjkl: move between panels like vim's hjkl
* Ctrl-A c: create new window
* Ctrl-A [: copy mode (can scrollback the buffer)
* Ctrl-A ,: change window name

## ml-workspace
一个包含了常见的深度学习库和jupyter notebook的docker镜像，可以通过环境变量配置密码以及各种容器属性。具体配置参考[ml-workspace](https://github.com/ml-tooling/ml-workspace)

## Git
命令行设置Git用户名和邮箱

* 全局(所有仓库)
  
  ```git conig --global user.name "PanYicheng"```

  ```git conig --global user.email "1316699379@qq.com"```
* 局部(单个仓库)
  
  ```git conig user.name "PanYicheng"```

  ```git conig user.email "1316699379@qq.com"```

## Database
在GPU10上配置自用的数据库容器，采用docker compose方式。
配置文件为本目录下的mysqlserver.yaml文件。这里设置了附加的volumn来保存数据库文件。
### Container Network
为了使得其他容器可以访问数据库容器，配置了桥接网络myNetwork，其
参数如下，然后将需要访问数据库的容器加入到这个网络即可。
| Name | Value |
| - | - |
| driver | bridge|
|subnet| 173.21.11.0/24|
|gateway| 173.21.11.1 |


# Router DDNS

## dnspod token
* 名称 rv6300v2-access-key
* ID	149124
* Token	e1b50bb3cd62597844da09b09e6eebc2
* 创建时间 2020-03-28 09:29:34

[1]: https://stackoverflow.com/questions/15227130/using-a-socks-proxy-with-git-for-the-http-transport "Stackoverflow"