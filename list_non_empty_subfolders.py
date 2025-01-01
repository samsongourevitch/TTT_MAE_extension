import os
import sys

def list_non_empty_subfolders(folder_path):
    non_empty_subfolders = []
    for root, dirs, files in os.walk(folder_path):
        for dir in dirs:
            subfolder_path = os.path.join(root, dir)
            if any(os.path.isfile(os.path.join(subfolder_path, f)) for f in os.listdir(subfolder_path)):
                non_empty_subfolders.append(subfolder_path)
    return non_empty_subfolders

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python list_non_empty_subfolders.py <folder_path>")
        sys.exit(1)

    folder_path = sys.argv[1]
    if not os.path.isdir(folder_path):
        print(f"Error: {folder_path} is not a valid directory")
        sys.exit(1)

    non_empty_subfolders = list_non_empty_subfolders(folder_path)
    for subfolder in non_empty_subfolders:
        print(subfolder)