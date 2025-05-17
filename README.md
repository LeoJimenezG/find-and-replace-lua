# Find and Replace Txt

A Lua script for processing `.txt` files. Offers interactive options to search, replace, and count specific text occurrences within file content.

---

## Installation

To get this project up and runnig on your local machine, follow the next instructions.

### Prerequisites
Before anything else, make sure you have installed **Lua 5.x.x** or a newer version in your system.

### Steps
1. **Clone the repository:**
Open your prefered terminal and clone the project to your local machine.
    ```bash
    git clone https://github.com/LeoJimenezG/find-and-replace-txt.git
    ```
2. **Navigate into the project directory:**
    ```bash
    cd find-and-replace-txt
    ```
3. **Run the Application: Finally, execute the main script to launch the Find and Replace Txt Program**
    ```bash
    lua main.lua
    ```

---

## How Does It Work?

This script operates by reading input parameters and the text content to be processed from `data.txt`, and writing the results of replace operations to `output.txt`.

### `data.txt`
This file serves as the primary input source. It must be structured with specific information on the first two lines, followed by the content you wish to process:
1. **First line:** Must contain **only** the **search term** (the text you want to find).
    * *Example:* `ipsum`
2. **Second line:** Must contain **only** the **replacement term** (the text you want to use for replacement). This line is ignored when using the **Count all occurrences** option, but it must be there even if it is blank.
    * *Example:* `LUA`
3. **Rest of the file (starting from the third line):** Contains the actual **text content to be processed**. The script will read all lines from the third line onwards. There are no specific formatting limitations for this section. However, if you are working with a massive amount of text, it is strongly recommended to divide it in blocks.

### `output.txt`
This file is used by the script to store the result of operations that involve text replacement.
* You do **not** need to prepare this file beforehand. The script will create the `output.txt` file if it doesn't exist or **overwrite** its entire content with the new result if it already exists.
* After a successful replace operation, the processed text will be written to `output.txt`, from where you can easily access and copy it.

***Example of Replacement Output:***

* *Original content (read from `data.txt`, line 3 onwards)*:
*Lorem ipsum dolor sit amet, consectetur ipsum adipiscing elit.*
* *Resulting content (written to `output.txt` after replacement)*:
*Lorem LUA dolor sit amet, consectetur LUA adipiscing elit.*

---

## Available Options

The script presents a command-line menu with the following interactive options for processing the content from `data.txt`:
### 1. Replace all occurrences:
* Finds all occurrences of the **search term** (from `data.txt` line 1) within the content (from `data.txt` line 3 onwards).
* Replaces every found occurrence with the **replacement term** (from `data.txt` line 2).
* Writes the entire modified content to `output.txt`, **overwriting** any previous content in that file.

### 2. Count all occurrences:
* Finds all occurrences of the **search term** (from `data.txt` line 1) within the content (from `data.txt` line 3 onwards).
* Ignores the **replacement term** (from `data.txt` line 2).
* Counts the total number of occurrences found.
* Does **not** modify the original content or write to `output.txt`.
* Displays the total count directly in the terminal.

### 3. Replace and Count all occurrences:
* Performs both the replacement and counting actions.
* Executes the replacement process as described in **Option 1** (finding and replacing all occurrences, writing modified content to `output.txt`).
* Simultaneously, counts the total number of replacements made, as described in **Option 2**.
* Displays the total count in the terminal after completing the replacement and file writing.

### 4. Exit:
* Terminates the script immediately. No processing or file changes are performed.

---

## Notes

* This project is my first one to be completed in Lua, which makes it quite special to me. I certainly encountered challenges and made mistakes while writing it, but working with Lua has been a very positive experience, and it has quickly become one of my favorite programming languages.
* I've used this script for my own personal text processing needs and found it to be reliable when the input in `data.txt` is correctly formatted as described in the **How Does It Work?** section. If you experience any issues, please double check the format of your `data.txt` file.
* Developing this relatively small project was highly valuable and entertaining. It strongly reinforced important development principles, such as focusing on building a basic functional core first and then adding complexity, and highlighted the efficiency gained by utilizing a language's built-in features (like `string.gsub`).

---

## Useful Resources

* **[Lua Manual](https://www.lua.org/manual/5.4/)** - The official and comprehensive reference manual for Lua 5.4.
* **[PiL Files Chapter](https://www.lua.org/pil/21.1.html)** - A chapter from the *Programming in Lua* book covering file input and output.
