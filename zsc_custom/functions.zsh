#########################################
# Make a directory and cd into it       #
#########################################
mkd() {
	mkdir -p -- "$@" && cd -- "$@"
}

#########################################
# Go to the root of git directory       #
#########################################
root() {
	while ! [ -d .git ]; do cd ..; done
}

########################################
# Get public IP address                #
########################################
ip() {
	ip=$(curl -s ifconfig.me)
	echo "$ip"
	echo "$ip" | pbcopy
}

#########################################
# Move target $1 to $1.bak              #
#                                       #
# https://github.com/shazow/dotfiles/   #
#########################################
bak() {
	declare target=$1;
	if [[ "${target:0-1}" = "/" ]]; then
		target=${target%%/}; # Strip trailing / of directories
	fi
	mv -v $target{,.bak}
}

#########################################
# Move target $1.bak to $1              #
#                                       #
# https://github.com/shazow/dotfiles/   #
#########################################
unbak() {
	declare target=$1;
	if [[ "${target:0-1}" = "/" ]]; then
		# Strip trailing / of directories
		target="${target%%/}"
	fi

	if [[ "${target:0-4}" = ".bak" ]]; then
		mv -v "$target" "${target%%.bak}"
	else
		echo "No .bak extension, ignoring: $target"
	fi
}

_unbak() { compadd "${(@)$(ls *.bak)}" }
compdef _unbak unbak

########################################
# Send file to a8                      #
########################################
transfer(){ 
  if [ $# -eq 0 ];
  then 
    echo "No arguments specified.\nUsage:\n transfer <file|directory>\n ... | transfer <file_name>">&2;
    return 1;
  fi;
  if tty -s;
  then 
    file="$1";file_name=$(basename "$file");
    if [ ! -e "$file" ];
    then 
      echo "$file: No such file or directory">&2;
      return 1;
    fi;
    if [ -d "$file" ];
    then 
      file_name="$file_name.zip" ,;
      (cd "$file"&&zip -r -q - .)|curl --progress-bar --upload-file "-" "https://transfer.anvileight.com/$file_name"|tee /dev/null,;
    else 
      cat "$file"|curl --progress-bar --upload-file "-" "https://transfer.anvileight.com/$file_name"|tee /dev/null;
    fi;
  else 
    file_name=$1;
    curl --progress-bar --upload-file "-" "https://transfer.anvileight.com/$file_name"|tee /dev/null;
  fi;
}
