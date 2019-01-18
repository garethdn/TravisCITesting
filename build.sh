GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

on_success() {
    echo -ne " ${GREEN}✔${NC}"
    echo -ne '\n'
}
on_complete() {
    rc=$?;
    if [[ $rc != 0 ]]; then
        echo -ne '\n'
        exit $rc;
    fi

    if [[ $rc == 0 ]]; then
        on_success;
    fi
}

# Cleaning distribution folder
echo -ne "Cleaning distribution folder"
rm -rf distribution
on_complete

# Copy Assets (images and fonts)
echo -ne "Copying assets (images and fonts)"
cp -R src/assets distribution
on_complete

# Copy readme
echo -ne "Copying README"
cp README.md distribution
on_complete

echo ""
echo "=========================="
echo -ne "${GREEN}Library built successfully${NC}\n"
echo "=========================="
echo ""
