SOURCE_URL=${1}
OUTPUT_FILENAME=${2}

npx vivliostyle build --output ${OUTPUT_FILENAME} ${SOURCE_URL}
