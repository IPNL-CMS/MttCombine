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

# all is done, merge ...
print("Merging keys PDF systematics ...")

tmpfile.seek(0)
tmpfile.truncate(0)

for mass in masses:
    tmpfile.write("hadd -f keyspdf_syst_%s/mlfit_%s.root keyspdf_syst_%s/mlfit_%s_*.root\n" % (mass, mass, mass, mass))

tmpfile.flush()

args = ["parallel", "-u", "-a", tmpfile.name, "-j", "6"]
subprocess.call(args)
#print args

tmpfile.close()


