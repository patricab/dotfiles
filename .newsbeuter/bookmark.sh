#!/bin/bash

url="$1"
title="$2"
description="$3"
feed_title="$4"

echo -e "${url}\t${title}\t${description}\t${feed_title}" >> ~/.newsbeuter/bookmarks.txt
