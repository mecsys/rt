#!/bin/bash
find $(cat backup.txt ) -mtime +90 -exec cp --parents -Rap {} /tmp/test_backup/ \;