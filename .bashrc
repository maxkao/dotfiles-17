# etcのbashrcを読み込む
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# homebrewで自動的にbrew-fileをアップデートするようにする
if [ -f $(brew --prefix)/etc/brew-wrap ]; then
  . $(brew --prefix)/etc/brew-wrap
fi


# プロンプトの表示形式を設定
PS1="[\u@\h \W]\$"


# alias
alias ls='ls -G'  # lsを色付きにする


# function
## pandoc
pandocpdf ()
{
  iconv -f UTF-8-MAC -t UTF-8 -c $1 | pandoc -o $2 -f markdown -V documentclass=ltjarticle --latex-engine=lualatex
}