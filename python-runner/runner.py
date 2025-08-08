import sys
import json
import io
import contextlib

def execute(code, user_input):
    sys.stdin = io.StringIO(user_input)
    output_stream = io.StringIO()
    error = None

    try:
        with contextlib.redirect_stdout(output_stream):
            exec(code, {})
    except Exception as e:
        error = str(e)

    return {
        "output": output_stream.getvalue() if not error else "",
        "error": error
    }

if __name__ == "__main__":
    # ✅ Must match the path you're mounting from Node.js
    code_file_path = './temp/main.py'
    input_file_path = './temp/input.txt'
    
    try:
        with open(code_file_path, 'r') as f:
            code_to_run = f.read()

        with open(input_file_path, 'r') as f:
            user_input = f.read()

        result = execute(code_to_run, user_input)

    except Exception as e:
        result = {"output": "", "error": str(e)}

    sys.stdout = sys.__stdout__
    print(json.dumps(result))
