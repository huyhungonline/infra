count_files=0
count_images=0

for file in *.tar; do
  echo "Loading $file..."
  output=$(docker load --input "$file")
  echo "$output"
  ((count_files++))
  
  # Count "Loaded image:" occurrences in the docker output
  loaded=$(echo "$output" | grep -c "Loaded image:")
  ((count_images+=loaded))
done

echo "Total .tar files imported: $count_files"
echo "Total images successfully imported: $count_images"