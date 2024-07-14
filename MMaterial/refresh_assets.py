import os

def write_filenames_to_file(directory_path, output_txt_file_name):
    try:
        # List to store all file paths
        all_files = []

        # Traverse the directory tree
        for root, dirs, files in os.walk(directory_path):
            for file in files:
                # Add the full path of the file to the list
                full_path = os.path.join(root, file)
                all_files.append(full_path)

        # Join the filenames with ";"
        file_contents = ";".join(all_files)

        # Ensure the output directory exists
        output_dir = os.path.dirname(output_txt_file_name)
        if output_dir and not os.path.exists(output_dir):
            os.makedirs(output_dir)

        # Write to the output file
        with open(output_txt_file_name, 'w') as output_file:
            output_file.write(file_contents)
        
        print(f"Successfully written filenames to {output_txt_file_name}")

    except Exception as e:
        print(f"An error occurred: {e}")

write_filenames_to_file("Icons/assets/svg", "./cmake_data/svgPaths.txt")
write_filenames_to_file("Icons/assets/png", "./cmake_data/pngPaths.txt")
write_filenames_to_file("Fonts/Families", "./cmake_data/fontPaths.txt")