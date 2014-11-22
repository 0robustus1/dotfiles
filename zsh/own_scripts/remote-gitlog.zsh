#! /usr/bin/env zsh

# grep -P "ARGV=sascha\s+SOC=git-upload-pack\s+'realized.git'" /home/git/.gitolite/logs/gitolite-2014-08.log | cut -f1 | sort -r

rr_retrieve_gitolite_log_data() {

  server=$1
  log_time=$2
  key_name=$3

  logfile_path="/home/git/.gitolite/logs/gitolite-$log_time.log"
  grep_params="ARGV=$key_name\s+SOC"

  ssh $server "grep -P '$grep_params' '$logfile_path'"
}

rr_gitolite_log() {
  server="fare"
  log_time=$1
  key_name=$2
  action=$3

  response=$(rr_retrieve_gitolite_log_data $server $log_time $key_name)

  # response_lines=("${(@f)${response}}")

  # for line in $response_lines; do
  #   echo "line: $line"
  # done

  echo $response | awk '{
    timestamp=$1;
    sub("ARGV=", "",$4); key=$4;
    sub("SOC=", "", $5); action=$5;
    repo=$6;
    print timestamp, key, action, repo
  }' | tr -d "'" | sort -r

}

alias remote-gitlog='rr_gitolite_log'
