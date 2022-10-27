# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Download Znap, if it's not there yet.
[[ -f ~/.zsnap/znap.zsh ]] || git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.zsnap

source ~/.zsnap/znap.zsh  # Start Znapxx

znap prompt romkatv/powerlevel10k

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias k='kubectl'
znap fpath _kubectl 'kubectl completion  zsh'
znap fpath _rustup  'rustup  completions zsh'cs
znap fpath _cargo   'rustup  completions zsh cargo'


#`znap source` automatically downloads and starts your plugins.
znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source git
znap source heroku
znap source pip
znap source lein
znap source command-not-found
znap source zsh-autosuggestions
znap source zsh-autocomplete
znap source zsh-users/zsh-history-substring-search
znap source aperezdc/zsh-fzy
znap source jimeh/zsh-peco-history
znap source oknowton/zsh-dwim
znap source Downager/zsh-helmfile
#`znap eval` caches and runs any kind of command output for you.
znap eval iterm2 'curl -fsSL https://iterm2.com/shell_integration/zsh'

# `znap function` lets you lazy-load features you don't always need.
znap function _pyenv pyenv 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

sshilmn() {
	sshpass -p '!lmn@dmin123!' ssh ilmnadmin@$1
}

sshlit() {
	sshpass -p 'L!ghtn!ngadm!@#' ssh ilmnadmin@$1
}
alias k="kubectl"
alias sshvm="ssh ilmnadmin@10.16.32.61"
alias sshece4="sshpass -p '!lmn@dmin123!' ssh ilmnadmin@10.16.36.116 -t \"zsh\""
alias sshce="sshpass -p 'L!ghtn!ngadm!@#' ssh ilmnadmin@10.16.32.57"

sshpv() {
	sshpass -p '!lmn@dmin123!' $@

}

orch() {	
	sudo systemctl $1 instrument-orchestrator
	echo "successfully executed 'systemctl $1 instrument-orchestrator'"
}

orch_exe() {
	sudo systemctl $1 cloud-service
	sudo systemctl $1 data-path-adapter
	sudo systemctl $1 disk-management-service
	sudo systemctl $1 instrument-state-service
	sudo systemctl $1 secondary-analysis-service
	sudo systemctl $1 ucs-adapter
}

create_file() {
	size=$1
	let count=$2-1
	echo "Creating ${2} files of size ${size}MB"
	for i in {0..$count} 
	do
		dd if=/dev/zero of="./dummy.${size}.${i}.txt" bs=4k iflag=fullblock,count_bytes count="${size}"
	done
}

ucs() {
        sudo systemctl $1 universal-copy-service
}

alias ucslog="tail /usr/local/illumina/logs/universal-copy-service/ucs.log"
alias ucsclear="sudo rm /usr/local/illumina/persistence/universal-copy-service/*"

all_exe() {
	orch_exe $1
	ucs $1
}

dexists() {
	if [[ -d $1 ]]
	then
		echo "$1 exists"
	fi
}

mount_test() {
	if [[ $1 == "help" ]]; then
		echo "mount_test uid gid file_mode dir_mode"
		return 0
	fi
	TUID=${1:-'ilmnadmin'}
	TGID=${2:-'tyhuber'}
	FILE_PERMS=${3:-0775}
	DIR_PERMS=${4:-0775}
	echo "mounting with file_mode=$FILE_PERMS,dir_mode=$DIR_PERMS,uid=$UID,gid=$GID"
	sudo umount /mnt/transfer
	sudo mount -t cifs //ussd-file/users/transfer -o username=sbsuser,password=sbs123 /mnt/transfer -o file_mode=$FILE_PERMS,dir_mode=$DIR_PERMS,uid=$TUID,gid=$TGID
	echo "mounted"
}

cherry_pick() {
	from_branch=$1
	to_branch=$(git rev-parse --abbrev-ref HEAD)
	echo "cherry pick from $from_branch -> $to_branch"
	git cherry $to_branch $from_branch | sed -e 's/\+ //g' | xargs -n1 -I % sh -c "git cherry-pick %"
}

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
sudo chmod 644 /etc/rancher/k3s/k3s.yaml

alias swagger_codegen="java -jar /home/tyhuber/swagger-codegen/swagger-codegen-cli.jar"

alias fmt_gss='jq -R "def mp(\$x): \$x | map(\"[\(.Level|ascii_upcase)]: \(.Message)\"); fromjson? |  . | mp(.logentries) as \$logs | if .errorCode == 200 then { severity: .severity, route: \"\(.accessType) \(.resourceId)\", id: .id, started: .StartedOn, logs: \$logs } else { severity: .severity, route: \"\(.accessType) \(.resourceId)\", id: .id, started: .StartedOn, errorCode: .errorCode, logs: \$logs } end"'
alias fmt_ims='jq -R "fromjson? | . | {info: \"\(.timestamp) | \(.level) | \((if .Method != null then \"\(.Method) \(.RequestPath)\"  else  .RequestPath  end))\", msg: .description }'
alias fmt_gds='jq -R "fromjson? | . | {info: \"\(.timestamp) | \(.level) | \((if .Method != null then \"\(.Method) \(.RequestPath)\"  else  .RequestPath  end))\", msg: .description }'

alias kubectl='k3s kubectl'

alias get_colors="code '~/Documents/color_palette_!best.md'"

function ssheos {
	echo "sshing into root@$1.edgeos.illumina.com"
	ssh "root@$1.edgeos.illumina.com" -i ~/.ssh/edgeos_dragen_root.id_rsa
}

#export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" 
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
alias shopt='/usr/bin/shopt'
PROMPT='$(kube_ps1)'$PROMPT
export GOROOT="/home/tyhuber/go"
