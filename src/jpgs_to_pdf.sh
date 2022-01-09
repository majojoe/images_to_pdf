#!/bin/bash -e

OUTPUT_FILE=""

usage() { echo "Usage: $0 [-o <OUTPUT_FILE_NAME>]" 1>&2; exit 1; }

while getopts ":o:" o; do
    case "${o}" in
        o)
            echo "${OPTARG}"
            OUTPUT_FILE=${OPTARG}
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

convert "*.jpg" -quality 50 "${OUTPUT_FILE}.pdf"

