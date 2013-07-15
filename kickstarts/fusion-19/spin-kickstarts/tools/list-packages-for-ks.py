#!/usr/bin/python
# Given as input a comps definition and a .ks file, list
# the packages which would be installed.  This list is
# NOT depsolved, it's merely a textual list of explicitly
# added or removed packages from the combined set.
#
# Licensed under the new-BSD license (http://www.opensource.org/licenses/bsd-license.php)
# Copyright (C) 2010 Red Hat, Inc.
# Written by Colin Walters <walters@verbum.org>

import os
import sys
import getopt
import xml.etree.cElementTree as ElementTree

import pykickstart
import pykickstart.parser
import pykickstart.version

def usage(ecode):
    print "Usage: %s [--version=VERSION] COMPS.xml KICKSTART.ks" % (sys.argv[0], )
    print "List packages installed by KICKSTART."
    sys.exit(ecode)

def main():
    try:
        opts,args = getopt.getopt(sys.argv[1:], 'h', ['help', 'version=', 'debug'])
    except getopt.GetoptError, e:
        usage(1)
        
    version = None
    debug = False
    for o,a in opts:
        if o in ('-h', '--help'):
            usage(0)
        elif o in ('--debug', ):
            debug = True
        elif o in ('--version', ):
            version = a
        
    if len(args) != 2:
        usage(1)
    comps_filename = args[0]
    kickstart_filename = args[1]
    
    if version:
        version_cls = pykickstart.version.stringToVersion(version)
    else:
        version_cls = pykickstart.version.makeVersion()

    comps = ElementTree.parse(comps_filename)

    # pykickstart is going to look for files relative to
    # the current directory of the kickstart file
    working_directory = os.path.dirname(kickstart_filename)
    if working_directory:
        os.chdir(working_directory)
        
    parser = pykickstart.parser.KickstartParser(version_cls)
    parser.readKickstart(kickstart_filename)
   
    comps_groups = comps.findall('group')
    packages_for_group = {}
    for group in comps_groups:
        group_id = group.find('id')
        assert group_id is not None
        pkglist_node = group.find('packagelist')
        assert pkglist_node is not None
        reqs = pkglist_node.findall('packagereq')
        pkglist = []
        for req in reqs:
            if req.attrib['type'] in ('default', 'mandatory'):
                pkglist.append(req.text)
        packages_for_group[group_id.text] = pkglist

    pkg_list = set()
   
    for group in parser.handler.packages.groupList:
        if debug:
            print >>sys.stderr, "# Including %d packages from group %r" % (len(packages_for_group[group.name]), group.name)
        for pkg in packages_for_group[group.name]:
            pkg_list.add(pkg)
    if debug:
        print >>sys.stderr, "# Adding %d explicitly specified packages" % (len(parser.handler.packages.packageList), )
    for pkg in parser.handler.packages.packageList:
        pkg_list.add(pkg)
    if debug:
        print >>sys.stderr, "# Processing %d explicitly excluded packages" % (len(parser.handler.packages.excludedList), )
    for pkg in parser.handler.packages.excludedList:
        if pkg in pkg_list:
            pkg_list.remove(pkg)

    for pkg in sorted(pkg_list):
        print "%s" % (pkg, )

    sys.exit(0)

if __name__ == '__main__':
    main()

