# Vim automaitc scripts for Verilog

安装方法，使用vim plug, 添加

```
Plug 'Meuhor/automatic-for-Verilog'
```
到插件源。

或下载plugin文件夹中的.vim添加到~/vimfiles/plugin/（Windows）或~/.vim/plugin/（Linux）文件夹。

This page contains two files: Addalways.vim and automatic.vim.

Use vim-plug to install, simply add 

```
Plug 'Meuhor/automatic-for-Verilog'
```

to Plugin source, or simply down the \*.vim files and drop them to ~/vimfiles/plugin/ (Windows) of ~/.vim/plugin/ (Linux).

## eetop_automatic.vim

插件eetop_automatic.vim是由eetop用户[zhangguo1286](http://bbs.eetop.cn/thread-335755-1-1.html)在eetop上发布的，详细信息与用法请查看bbs链接内容。插件包括自动例化等功能。

本Github页面上的插件修改了一些内容：添加了命令行调用，移除（注释了菜单入口），以及添加Always块的功能，保留了其他特性。

如果您使用eetop，请前往bbs页面下载原插件代码和回帖，给予原作者支持，谢谢。

The plugin eetop_automatic.vim is originally developed by [zhangguo1286 and published on eetop](http://bbs.eetop.cn/thread-335755-1-1.html). 

Please go to the bbs to download the original source scripts and make a reply to the original author, if you are using eetop bbs.

And original descriptions on the bbs are

```text
description：

Support Automatic functions like Emacs for verilog hdl
RtlTree work like as Verdi


Feature list:


    1) Auto Argument (the same as Emacs)         -- shortcut key<Shift+F1>
    2) Auto Define Signals                                  -- shortcut key<Shift+F2>
    3) Auto Instance (power than Emacs)            -- shortcut key<Shift+F3>
    4) Auto unit delay "<=" to "<= #1"
    5) Auto Template                                      -- create a new .v file with auto template
    7) Auto comment                                       -- shortcut key <F2> and <F3>
    8) DrawTimingWave                                  -- only used for gvim
    9) ShowInst                                                 -- shortcut key<Ctrl+J>
	10)GotoInst                                                 -- shortcut key<Ctrl+K>,    go back shortcut key is <Ctrl+T>
	11)RtlTree                                                   -- start with cmd :RtlTree,  user can map key <F4>, such as: map <F4> :RtlTree<CR> in your .vimrc
```

This scripts also contains Addalways method but the name of clock and reset signal would always be clk and rst followed by a suffix "\_n", if negedge was determined, so the original Addalways methods were removed.

Also, the menu entries and keybindings were removed and commandline were added. Other features remains unchanged.

*Attention*: The eetop_automatic.vim plugin relies on ctags to work, which could be obtained on [Github ctas](https://github.com/universal-ctags/ctags) or by package manager if you're using Linux or Mac. Ctags-win32 build binaries could also be obtained on [Github ctags-win32](https://github.com/universal-ctags/ctags-win32). Make sure ctags was in the system path. The plugin automatically calls ctags to generate tags if tags not exits.

## Addalways.vim

插件Addalways.vim是从插件[automatic-for-Verilog (Vim script)](https://github.com/vim-scripts/automatic-for-Verilog)中提取的，本Github页面的Addalways.vim仅包含了AddAlways函数的相关内容。插件最初由[arrowroothover](http://blog.sina.com.cn/arrowroothover)开发并在新浪博客上发布。

The Addalways.vim was originally extracted from the plugin [automatic-for-Verilog (Vim script)](https://github.com/vim-scripts/automatic-for-Verilog), which is developed by [arrowroothover and published on his blog](http://blog.sina.com.cn/arrowroothover).The original project contains a similar features like eetop_automatic.vim, but uses regular expression. This piece script only have the function to detect clock and reset in port and generate always block, for more original features please refer to the blog or Vim scripts page. There is a example:

```verilog
module example(
	input wire clk, // clock
	input wire rst, // reset
	output wire out
	);
```

use commandline, :Alpp, then An always block will be added under the cursor, looks like

```verilog
always @(posedge clk or posedge rst) begin
    if (rst) begin
    end
    else begin
    end
end
```
note that the clk and rst declaration in put must followed by comments // clock, and // reset to determine the signal. The white space behind the // could be omitted but these inline comments should not followed by any other characters. The name of clock and reset signal could vary.

Other commandline useage:

1. :Alnn stands for add negedge clock and negedge reset;

1. :Alpp stands for add posedge clock and posedge reset;

1. :Alpn stands for add posedge clock and negedge reset;

1. :Alnp stands for add negedge clock and posedge reset;

1. :Alp stands for add posedge clock;

1. :Aln stands for add negedge clock;

1. :Al stands for add always @(\*);

## Reference

Again, many thanks to the developers, arrowroothover and zhangguo1286 for their work. Although arrowroothover's work seems to be not continued for the blog was not published since 2008, zhangguo1286' work is actively under develop, for any further information please refer to their blogs.

1. [一个支持Verilog的Vim插件——自动插入always块 ](http://blog.sina.com.cn/s/blog_5acdd0c30100aozv.html)

1. [vim auto script for verilog & RtlTree - (like Emacs, Verdi)](http://bbs.eetop.cn/thread-335755-1-1.html)

