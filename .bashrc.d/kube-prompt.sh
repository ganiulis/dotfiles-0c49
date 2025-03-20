#!/bin/bash
__kube_ps1()
{
	if [ ! -e ~/.kube/config ]; then
		exit 1
	fi
	CONTEXT=$(cat ~/.kube/config | grep "current-context:" | sed "s/current-context: //")
	if [ -n "$CONTEXT" ]; then
		echo " \e[36m[${CONTEXT}]\e[m"
	fi
}
