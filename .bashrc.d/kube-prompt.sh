#!/bin/bash
__kube_ps1()
{
	if [ ! -e ~/.kube/config ]; then
		exit 1
	fi

	CTX=$(cat ~/.kube/config | grep "current-context:" | awk '{gsub("current-context:", "");$1=$1;print}')
	if [ ! -n "$CTX" ]; then
		exit 1
	fi

	NS=$(cat ~/.kube/config | grep "namespace:" | awk '{gsub("namespace:", "");$1=$1;print}')
	if [ ! -n "$NS" ]; then
		exit 1
	fi

	echo " \e[36m${CTX} (${NS})\e[m"
}
