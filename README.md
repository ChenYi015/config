# My Configurations

Configurations about bash, zsh and vim.

# Install

```bash
git clone https://github.com/ChenYi015/MyConfigurations.git
cd MyConfigurations
```

下载 zsh 插件：

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

覆盖配置文件：

```bash
cp .zshrc ~
cp .vimrc ~
cp .gitconfig ~
```

