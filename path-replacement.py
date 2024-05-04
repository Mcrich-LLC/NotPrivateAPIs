import os
import re

def replace_in_files(root_dir, regex_pattern, replacement):
    # Walk through directory tree
    for root, _, files in os.walk(root_dir):
        for file in files:
            file_path = os.path.join(root, file)
            # Process only regular files
            if os.path.isfile(file_path):
                # Read the file in binary mode
                with open(file_path, 'rb') as f:
                    content = f.read()
                # Perform regex replacement
                new_content = re.sub(regex_pattern, replacement, content)
                # Write back to the file
                with open(file_path, 'wb') as f:
                    f.write(new_content)

# Replace for href attributes
href_regex_pattern = br'(?:href)\s*=\s*["\']?\s*'
href_replacement = b'href="https://notprivateapis.pages.dev'

# Replace in all files in the specified directory and below
replace_in_files('./Build', href_regex_pattern, href_replacement)

# Replace for src attributes
src_regex_pattern = br'(?:src)\s*=\s*["\']?\s*'
src_replacement = b'src="https://notprivateapis.pages.dev'

# Replace in all files in the specified directory and below
replace_in_files('./Build', src_regex_pattern, src_replacement)

# Replace for https://notprivateapis.pages.devhttps://
http_regex_pattern = br'https:\/\/notprivateapis\.pages\.devhttps:\/\/'
http_replacement = b'src="https://'

# Replace in all files in the specified directory and below
replace_in_files('./Build', http_regex_pattern, http_replacement)