#!/bin/bash -e

OUTPUT_FILE=""
QUALITY="50"

usage() { echo "Usage: $0 [-o <OUTPUT_FILE_NAME>] | [-q <QUALITY_IN_PERCENT>]" 1>&2; exit 1; }

while getopts ":o:q:" o; do
    case "${o}" in
        o)
            OUTPUT_FILE=${OPTARG}
            ;;
        q)
            QUALITY=${OPTARG}
            ;;
        
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))

if [ -z "${OUTPUT_FILE}" ]; then
    usage
fi

ls  {*.jpg,*.jpeg,*.png}  2> /dev/null | sort -V | sed -n 's/..*/"&"/p' | paste -sd' ' - | convert @- -quality "${QUALITY}" "${OUTPUT_FILE}.pdf"
