#!/usr/bin/env python

import os, subprocess, datetime, tempfile

d = datetime.datetime.now().strftime("%d%b%y")

masses = [500, 750, 1000, 1250, 1500, 2000]

tmpfile = tempfile.NamedTemporaryFile(dir = '/scratch/', delete = False)

# Build output tree structure

print("Computing keys PDF systematics ...")

for mass in masses:
    tmpfile.write("./computeKeysPdfSyst.sh %d\n" % (mass))

tmpfile.flush()

args = ["parallel", "-u", "-a", tmpfile.name, "-j", "6"]
subprocess.call(args)
#print args

tmpfile.close()

