# Personal Work Envs
建立个人常见的开发环境设置，包括:
* vim
* tmux
* ml-workspace

## Vim
建议安装vim 8.0及以上的版本。这些版本支持插件的异步执行，能很大的提高插件的载入速度。可通过```vim --version```查看版本信息。

安装方式：
1.  PPA

    对于系统为Ubuntu 16.04, Ubuntu 14.04, Linux Mint 18/17和它们的衍生版本，需要添加自定义的ppa，如下。对于Ubuntu 20.04，不需要添加ppa。
    ```bash
    # 添加ppa
    sudo add-apt-repository ppa:jonathonf/vim
    # 移除ppa
    sudo apt install ppa-purge && sudo ppa-purge ppa:jonathonf/vim
    ```
    安装即可使用如下命令：
    ```
    apt update
    apt install vim
    ```
2.  Git 从源码编译安装
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

将```vundle.vimrc```的内容写入```~/.vimrc```，并在vim内运行```:PluginInstall```就可以完成插件的安装。

> 该过程使用git下载插件的文件，如果git需要设置代理，则可以使用如下指令，参考[Stackoverfloww][1]\
> 使用代理```git config --global http.proxy 'socks5://127.0.0.1:7070'```\
> 关闭代理```git config --global --unset http.proxy```

### Vim-plug
另一个vim插件管理器[vim-plug](https://github.com/junegunn/vim-plug)，功能相比Vundle更丰富一点，也是我目前使用的。基于此插件的vim配置文件为vim-plug.vimrc，可以复制使用，目前我使用了如下设置：
* Paste toggle with \<F2>
* Line number toggle with \<F3>
* [NerdTree Explorer](https://github.com/preservim/nerdtree) with \<F4>
* ~~Colorscheme [afterglow](https://github.com/danilo-augusto/vim-afterglow)~~ 由Solarized代替
> Colorscheme afterglow：在tmux内的vim内该配色可能无法正确显示，这是由于tmux内的$TERM变量没有设置成256color，可以在```.tmux.conf```中添加```set -g default-terminal "xterm-256color"```解决。如果terminal不支持256color，最好保持默认，不添加该命令。参考[Link](https://vi.stackexchange.com/questions/10708/no-syntax-highlighting-in-tmux)。

## Powerline
[Powerline](https://github.com/powerline/powerline)是一款状态栏插件，可用于vim、bash、tmux等。这里记录下我安装使用的一些步骤。

### Installation
在ubuntu下安装可以直接使用apt，即```sudo apt install powerline```。安装之后```{repository_root}```可以通过命令```sudo dpkg -L powerline```查看，在Ubuntu下应该为```/usr/share/```。
### Bash prompts intergration
在bash中使用只需在bashrc中增加如下内容。其中POWERLINE_BASH_*的设置是为了优化PS2，PS3，使其只会计算一次。
```
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. {repository_root}/powerline/bindings/bash/powerline.sh
```
### Tmux statusline
设置Tmux的状态栏，可以将如下命令添加到```~/.tmux.conf```中。该设置脚本依赖于```powerline-config```命令，如果系统PATH中没有该命令，可以设置环境变量```$POWERLINE_CONFIG_COMMAND```，用以指向该命令。
```
run-shell "powerline-daemon -q"
source "{repository_root}/powerline/bindings/tmux/powerline.conf"
```
### Vim statusline
设置vim中的状态栏，将如下命令添加到```~/.vimrc```中即可。其中的```python```可能需要替换成系统上可用的版本，如在我的设置里就是```python3```。其中最后设置的```laststatus```是为了始终显示状态栏，可查看vim的帮助了解更多信息```:h laststatus```。设置参考[Link](https://devpro.media/install-powerline-ubuntu/#configure-vim)。
```
" powerline statusline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
```

## Tmux
Tmux是类似screen的终端复用工具，可以远程运行并挂起终端，并且可以同步多个远程终端。

配置文件为本目录下的```.tmux.conf```文件，将其内容添加到用户目录下的同名文件即可。可以参考[tmux-bash-completion][2]配置bash的命令补全功能，将```completions/tmux```文件存到```/usr/share/bash-completion/completions/```即可。

Key Binding Definitions
* Ctrl-A %: split pane vertically
* Ctrl-A ": split pane horizontally
* Ctrl-A hjkl: move between panels like vim's hjkl
* Ctrl-A c: create new window
* Ctrl-A [: copy mode (can scrollback the buffer)
* Ctrl-A ,: change window name

## Solarized Colorscheme
[Solarized Colorscheme](https://github.com/altercation/solarized)是一个美观使用的颜色体系，可以很好地支持各种代码的高亮。该颜色主题适配到了各种工具中，如Tmux、Vim等。本文档记录个人使用该主题的安装方法。
### Vim solarized
安装Vim的Solarized配色可参考子仓库[vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)的说明。这里采用Option 2的插件安装：在```~/.vimrc```的vim-plug区域加入
```
" Solarized colorscheme
Plug 'https://github.com/altercation/vim-colors-solarized'
```
然后运行```:PlugInstall```下载插件，然后在```~/.vimrc```中加入设置主题的代码（其中background可根据需要设置为暗色dark或亮色light，当终端不能支持较多颜色时可设置16色模式，最后设置了F5按键切换背景颜色）：
```
" Set colorscheme
syntax enable
set background=dark/light
" let g:solarized_termcolors=16
" set t_Co=16
colorscheme solarized
call togglebg#map("<F5>")
```
### Windows Terminal
为让Windows Terminal正确显示Solarized主题，需要设置对应Profile的配色主题为Solarized Dark或Solarized Light。具体在Ubuntu profiles中添加
ColorScheme即可
```
"profiles": {
  "list": [{
      ...Ubuntu Profile...
      "colorScheme": "Solarized Dark"
      ......
    }]}
```
### Powerline adaptation
为了让powerline能够正确显示solarized配色，还需修改其配置，在```~/.config/powerline/config.json```中增加如下内容修改powerline在vim，shell和tmux中配色，匹配solarized。
```
{
  "ext": {
    "shell": {
      "colorscheme": "solarized"
    },
    "tmux": {
      "colorscheme": "solarized"
    },
    "vim": {
      "colorscheme": "solarized"
    }
  }
}
```

## ml-workspace
一个包含了常见的深度学习库和jupyter notebook的docker镜像，可以通过环境变量配置密码以及各种容器属性。具体配置参考[ml-workspace](https://github.com/ml-tooling/ml-workspace)

## Git
命令行设置Git用户名和邮箱
* 全局(所有仓库)
  ```
  git config --global user.name "PanYicheng"
  git config --global user.email "1316699379@qq.com"
  ```
* 局部(单个仓库)：取消上面指令中的```--global```即可。

保存Git账号密码
* 全局
  ```
  git config --global credential.helper store
  ```

## Database
在GPU10上配置自用的数据库容器，采用docker compose方式。
配置文件为本目录下的mysqlserver.yaml文件。这里设置了附加的volumn来保存数据库文件。

> 为了使得其他容器可以访问数据库容器，配置了桥接网络myNetwork，其
  参数如下，然后将需要访问数据库的容器加入到这个网络即可。
> | Name | Value |
> | - | - |
> | driver | bridge|
> |subnet| 173.21.11.0/24|
> |gateway| 173.21.11.1 |


# Router DDNS

## dnspod token
* 名称 rv6300v2-access-key
* ID	149124
* Token	e1b50bb3cd62597844da09b09e6eebc2
* 创建时间 2020-03-28 09:29:34

[1]: https://stackoverflow.com/questions/15227130/using-a-socks-proxy-with-git-for-the-http-transport "Stackoverflow"
[2]: https://github.com/imomaliev/tmux-bash-completion "tmux-bash-completion"