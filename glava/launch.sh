#! /bin/sh

ps -ef | grep 'glava --desktop' | grep -v grep | awk '{print $2}' | xargs -r kill -9

# Launch glava
glava --desktop
