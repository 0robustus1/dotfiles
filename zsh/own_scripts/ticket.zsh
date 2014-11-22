# Please set the GITHUB prefix by setting the environment
# variable GITHUB_KEYWORD.
# EXAMPLES:
# - GITHUB_KEYWORD="https://github.com/"
# - GITHUB_KEYWORD="github:"
# Then use the following commands to open a ticket in your browser:
# - ticket some_ticket_number
# - ticket
#   - if you're on a branch that is which is names like this:
#     ISSUE_ID-something_else, we can infer the ticket from
#     the branch name

rr_github() {
  ticket_regex='[[:digit:]]+';
  if [ ! -d .git ]; then
    echo "This is not a git repository..."
    return 0;
  else
    the_remote=$(git ls-remote --get-url origin);
    repository=$(echo $the_remote | grep -oP --color=never "${GITHUB_KEYWORD}\w+/\w+");
    repository=$(echo $repository | grep -oP --color=never "\w+/\w+");
    if [ ! -n $repository ]; then
      echo "This is not a known github repository. Try setting GITHUB_KEYWORD."
      return 0;
    else
      ticket_number=$1;
      if [ "$ticket_number" =~ $ticket_regex ]; then
        echo "Opening ticket #$ticket_number";
      else
        prefix="refs/heads/";
        fq_branch=$(git rev-parse --symbolic-full-name HEAD);
        ticket_number=$(echo $fq_branch | grep --color=never -oP "${prefix}\d+");
        ticket_number=$(echo $ticket_number | grep --color=never -oP "\d+");
        if [ "$ticket_number" =~ $ticket_regex ]; then
          echo "Opening the branch-ticket #$ticket_number";
        else
          echo "Didn't supply a ticket";
          echo "Also couldn't find one in the branch name"
          return 0;
        fi
      fi
      `open https://github.com/$repository/issues/$ticket_number`;
    fi
  fi
}

alias ticket='rr_github'
