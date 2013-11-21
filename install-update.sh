


function install_or_update ()
{
	SRC_FILE=$1
	DST_FILE=$2

	# if destination file does not exists - do a link or do a copy
	if [[ ! -e "$DST_FILE" ]]; then
		ln -v "$SRC_FILE" "$DST_FILE" || cp -a -v "$SRC_FILE" "$DST_FILE"
		return
	fi

	# if this is hard link - nothing to do :)
	src_inode=`stat -c '%D %i' "$SRC_FILE"`
	dst_inode=`stat -c '%D %i' "$DST_FILE"`
	if [[ "$src_inode" = "$dst_inode" ]]; then
		echo "$SRC_FILE -> $DST_FILE: was a hard link"
		return
	fi

	# if destination file exists and is not a hard link - check if the same or copy with backup
	if diff -q "$SRC_FILE" "$DST_FILE"; then
		echo "$SRC_FILE -> $DST_FILE: is the same"
	else
		cp -v -a -b "$SRC_FILE" "$DST_FILE"
	fi
}


# copy dot-file entries

for file in \
	git-flow-completion.bash \
	git-completion.sh \
	git-prompt.sh \
	bashrc_private \
	vimrc \
	screenrc \
	tmux.conf
do
	install_or_update "${file}" "${HOME}/.${file}";
done


# setup .bashrc_private

if grep -q "source ~/.bashrc_private" "${HOME}/.bashrc"; then
	echo "~/.bashrc still loading ~/.bashrc_private"
else
	echo "updating ~/.bashrc to load ~/.bashrc_private"
	echo "source ~/.bashrc_private" >>~/.bashrc
fi

if [[ -d ~/.vim/bundle/neobundle.vim ]]; then
	# FIXME: do we really need this?
	echo "calling 'git fetch' for ~/.vim/bundle/neobundle.vim"
	(cd ~/.vim/bundle/neobundle.vim; git fetch)
else
	mkdir -p ~/.vim/bundle/
	git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

# load submodules

echo "git init neobundle.vim submodule"
(git submodule init && git submodule update)
