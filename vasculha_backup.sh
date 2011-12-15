#!/bin/bash
find $(cat backup.txt ) -mtime +90 -print -exec cp --parents -Rap {} /tmp/test_backup/ \;
