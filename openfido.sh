#!/bin/sh
#
# Generic python environment for OpenFIDO
#

on_error()
{
    echo '*** ABNORMAL TERMINATION ***'
    echo 'See error Console Output stderr for details.'
    exit 1
}

trap on_error 1 2 3 4 6 7 8 11 13 14 15

set -x # print commands
set -e # exit on error
set -u # nounset enabled

INPUTGLM=$(grep '^INPUTGLM,' ${OPENFIDO_INPUT}/config.csv | cut -f2 -d,)
SPACING=$(grep '^SPACING,' ${OPENFIDO_INPUT}/config.csv | cut -f2 -d,)
POLETYPE=$(grep '^POLETYPE,' ${OPENFIDO_INPUT}/config.csv | cut -f2 -d,)
POLEDATACSV=$(grep '^POLEDATACSV,' ${OPENFIDO_INPUT}/config.csv | cut -f2 -d,)
WEATHERNAME=$(grep '^WEATHERNAME,' ${OPENFIDO_INPUT}/config.csv | cut -f2 -d,)
OUTPUTGLM=$(grep '^OUTPUTGLM,' ${OPENFIDO_INPUT}/config.csv | cut -f2 -d,)
OPTIONS=$(grep '^OPTIONS,' ${OPENFIDO_INPUT}/config.csv | cut -f2 -d,)

cd ${OPENFIDO_OUTPUT}
/usr/local/bin/gridlabd create_poles ${INPUTGLM} --spacing="${SPACING}" --pole_type="${POLETYPE}" --pole_data="${POLEDATACSV}" --weather="${WEATHERNAME}" --output="${OUTPUTGLM}" ${OPTIONS}
