pwc() {
    typeset _project="perlweeklychallenge-club"

    [ "$pwc" -a ! -d "$pwc" ] && {
	# Reset if pwc is set already but the directory isn't found.
	echo -e "Warning: Directory \n" \
	     "             '$pwc'\n" \
	     "         doesn't exist. Trying to reset \$pwc." >&2
	unset pwc
    }

    [ ! "$pwc" ] && {
	typeset _pwc_path="perl_projects/$_project"
	typeset _home
	for _home in "$HOME" "$HOME/Documents/Projekte"; do
	    export pwc="$_home/$_pwc_path"
	    [ -d "$pwc" ] && break || unset pwc
	done
    }
    [ ! "$pwc" ] && {
	echo -e "Error: Could not find '${_project}' project directory." >&2
	return 1
    }

    typeset _pwc_challenge _pwc_cd_to _pwc_announce _pwc_git_status_for
    typeset _pwc_github_repo _pwc_edit _pwc_dir
    _pwc_challenge=`ls -dr "$pwc"/challenge-*/matthias-muth | head -1`
    _pwc_cd_to="$pwc_challenge"
    _pwc_git_status_for="."
    _pwc_github_repo="https://github.com/MatthiasMuth/perlweeklychallenge-club"
    # [ $# = 0 ] && set -- "perl"
    while :; do
        case "$1" in
            [0-9]* )            _pwc_challenge=$(
                                    ls -d "$pwc/challenge-$1/matthias-muth"
                                )
                                _pwc_cd_to="$_pwc_challenge"
                                _pwc_announce=1
                                ;;
            h | home )          _pwc_cd_to="$pwc"
                                _pwc_git_status_for=""
                                ;;
            c | challenge )     _pwc_cd_to="$_pwc_challenge"
                                _pwc_announce=1
                                ;;
            p | perl )          _pwc_cd_to="$_pwc_challenge/perl"
                                _pwc_announce=1
                                _pwc_git_status_for=".."
                                ;;
            d | download* )     _pwc_cd_to="$pwc/download_challenge" ;;
            w | weekly* )       _pwc_cd_to="$pwc/weekly_check" ;;
            e | edit )          _pwc_edit="$_pwc_github_repo/edit/dev"
                                _pwc_dir="${_pwc_challenge#$pwc/}"
                                echo "$_pwc_edit/$_pwc_dir/README.md"
                                return
                                ;;
            * )                 break;;
        esac
        shift
    done
    if [ "$_pwc_announce" -a -f "$_pwc_challenge/perl/challenge-*.txt" ]; then
        perl -wne 'print if $. == 1 || /^Task \d+:/' \
            "$_pwc_challenge/perl/challenge-*.txt"
        echo ""
    fi
    cd "${_pwc_cd_to:-$pwc}"
    git status $_pwc_git_status_for
}
