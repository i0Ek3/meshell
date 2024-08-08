import os
import shutil

def move_files(src_dir, dest_dir, extensions):
    """
    Move all files with specified extensions from src_dir to dest_dir.

    :param src_dir: Source directory where to search for files.
    :param dest_dir: Destination directory where files will be moved.
    :param extensions: A list of file extensions to look for.
    """
    # Check if the source directory exists
    if not os.path.exists(src_dir):
        print(f"Source directory {src_dir} does not exist.")
        return

    # Create the destination directory if it doesn't exist
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir)
        print(f"Destination directory {dest_dir} created.")

    # Walk through the source directory
    for root, dirs, files in os.walk(src_dir):
        for file in files:
            # Check the file extension
            if file.lower().endswith(tuple(extensions)):
                # Create the full file path
                file_path = os.path.join(root, file)
                # Move the file to the destination directory
                shutil.move(file_path, os.path.join(dest_dir, file))
                print(f"Moved: {file_path} to {dest_dir}")

# Set the source and destination directories
source_directory = './'  # Replace with your source directory path
destination_directory = './pdf'  # Replace with your destination directory path

# Set the extensions of files you want to move
file_extensions = ['.pdf', '.doc', '.docx']

# Call the function to move the files
move_files(source_directory, destination_directory, file_extensions)
