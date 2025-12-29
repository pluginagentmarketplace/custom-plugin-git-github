#!/usr/bin/env python3
import json
def collab(): return {"remote": ["clone", "fetch", "pull", "push"], "sync": ["upstream", "origin"]}
if __name__ == "__main__": print(json.dumps(collab(), indent=2))
