import os

def replicate_directory_structure(source_dir, destination_dir):
    for root, dirs, files in os.walk(source_dir):
        # Construct the destination path
        dest_path = root.replace(source_dir, destination_dir, 1)
        
        # Create the destination directory if it doesn't exist
        if not os.path.exists(dest_path):
            os.makedirs(dest_path)
            print(f"Created directory: {dest_path}")

# Example usage
if __name__ == "__main__":
    source_dir = 'imagenetC_OOD/full'
    destination_dir = 'imagenetC_OOD/extract'

    replicate_directory_structure(source_dir, destination_dir)