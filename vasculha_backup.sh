#!/bin/bash
find . -mtime +90 -exec cp --parents -Rap {} /tmp/test_backup/ \;
