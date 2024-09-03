sed -n 's/^\([^ ]*\).*/\1/p' packages.txt > package_names.txt
while IFS= read -r line; do
    sudo yum install -y "$line"
done < package_names.txt
