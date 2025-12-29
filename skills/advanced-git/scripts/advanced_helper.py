#!/usr/bin/env python3
import json
def advanced(): return {"commands": ["rebase_i", "cherry_pick", "bisect", "reflog", "stash"]}
if __name__ == "__main__": print(json.dumps(advanced(), indent=2))
