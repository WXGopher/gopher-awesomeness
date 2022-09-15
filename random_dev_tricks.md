## Random Pro-tips

1. Select venv in Jupyter notebook: `conda install nb_conda_kernels`;

2. [Maya install numpy](https://forums.autodesk.com/t5/maya-programming/guide-how-to-install-numpy-scipy-in-maya-windows-64-bit/td-p/5796722): unzip whl file and copy the folder to `%MAYA_INSTALL_DIR%\Python\Lib\site-packages`;

3. [Pycharm tricks from zhihu](https://zhuanlan.zhihu.com/p/60383815) (Chinese);

4. Specify TeX compiler in your document, add `!TEX TS-program = lualatex`. This directive is understood by most TeX IDEs. More TeX directives see [here](https://tex.stackexchange.com/questions/78101/when-and-why-should-i-use-tex-ts-program-and-tex-encoding);

5. While annotating a codebase (C++ for example), in Visual Studio, change color of `XML Doc Comment` (in Tools->Options->Environment->Fonts and Colors). Start annotation using `///` instead of regular comment `//`;

6. To work with different ssh identities on the same machine, simply change `~/.ssh/config`:

    ```
    # Personal GitHub account
    Host github.com
     HostName github.com
     User git
     AddKeysToAgent yes
     IdentityFile ~/.ssh/your_customized_id_rsa
    ```

7. One-shot `git difftool` for specific file extensions

    ```
    # set difftool
    git config --global diff.tool bc
    git config --global difftool.bc.path "c:/Program Files/Beyond Compare 4/bcomp.exe"
    
    # diff in one shot, -d for dir-diff
    git difftool -d commit_id_1 commit_id_2 -- '*.cpp' '*.hpp'
    ```

    



## Misc troubleshooting

1. WSL doesn't start on win10. [Solution](https://superuser.com/questions/1275505/wsl-bash-doesnt-start);

2. `xelatex` running slow. Try to delete `texlive/${version}/texmf-var/fonts/cache;`

3. If debugger fails to stop at breakpoint, maybe you forgot to generate debugging symbol (duh..., to verify this, use [objdump](https://stackoverflow.com/questions/3284112/how-to-check-if-program-was-compiled-with-debug-symbols));

4. Linux is case-sensitive but Windows is not, it may cause problem with cross-platform code. [Here](https://www.howtogeek.com/354220/how-to-enable-case-sensitive-folders-on-windows-10/) is a solution to make windows folders case-sensitive

5. Fix git connection issues on WSL:

   ```
   touch ~/.ssh/config
   chmod 755 ~/.ssh/config
   sudo nano ~/.ssh/config
   # add the following to this config
   Host github.com
     Hostname ssh.github.com
     Port 22
     
   # restart ssh
   sudo /etc/init.d/ssh restart
   # verify
   ssh -T git@github.com
   ```

   



## Copy-and-paste programming from Stackoverflow

1. Find and replace a string in multiple files using `find` and `sed` (note the trailing `\;`):

```
find /home/user/directory -name \*.c -exec sed -i "s/cybernetnews/cybernet/g" {} \;
```



## Misc.

### Configure VS Code for Linux C++ Project

Ref:

[Using C++ and WSL in VS Code](https://code.visualstudio.com/docs/cpp/config-wsl)

[Developing in WSL](https://code.visualstudio.com/docs/remote/wsl)

[Target Debugging and Launching](https://vector-of-bool.github.io/docs/vscode-cmake-tools/debugging.html)

[Quick Start to Use Visual Studio Code for C++ Programmers in Linux](https://www.codeproject.com/Articles/1184735/Quick-Start-to-Use-Visual-Studio-Code-for-Cplusplu)

[C++ Development using Visual Studio Code, CMake and LLDB](https://medium.com/audelabs/c-development-using-visual-studio-code-cmake-and-lldb-d0f13d38c563)

Steps:

1. Install VS Code extensions: WSL remote development, C/C++ extension **in Windows**;
2. Configure WSL:

```
sudo apt-get update
sudo apt-get install build-essential gdb cmake
sudo apt-get install freeglut3  freeglut3-dev binutils-gold libglew-dev mesa-common-dev libglew1.5-dev libglm-dev #OpenGL optional
```

3. Install X client (`xming` for example, then forward X using `export DISPLAY=:0`; a modern X client is [mobaxterm](https://mobaxterm.mobatek.net/features.html)

4. Configure `launch.json` for your project;

5. In **WSL**, from project folder, type `code .`.

   

### Useful Configs
#### My git config:

```
[alias]
	co = checkout
	br = branch
	ci = commit
	st = status
	dt = difftool -d
[core]
	autocrlf = true
[user]
	email = xxx
	name = xxx
# Make sure you have meld installed
[diff] 
	tool = meld
	guitool = meld
[difftool]
	prompt = false
[difftool "meld"]
	cmd = meld \"$LOCAL\" \"$REMOTE\"
```

#### sublime

```
{
	"font_size": 13,
    "word_wrap": "true",
    "match_brackets_angle": true // especially for dealing with ugly stl output...
}
```

