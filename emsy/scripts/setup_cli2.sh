#!/bin/bash
function main() {
# ENVIRONMENT
export SYM_SCRIPTDIR=$(dirname $(readlink -f $0))
. $SYM_SCRIPTDIR/../../rundemo/env.sh
export SYM_CLI2_DB=/tmp/client2.sqlite  # Needs an absolute path -- the java client doesn't have environment.
export SYM_CLI2_PROPFILE=$SYM_SCRIPTDIR/../emclient/res/emclient.properties

# Add necessary things to the working directory
rm -f $SYM_CLI2_DB
sqlite3 $SYM_CLI2_DB < $SYM_DEMO_DIR/testtables.sql

# add and populate the sym tables
$SYM_INSTALL/bin/symadmin --properties $SYM_CLI2_PROPFILE create-sym-tables 
sqlite3 $SYM_CLI2_DB < $SYM_SCRIPTDIR/add_client_002.sql
}

main
