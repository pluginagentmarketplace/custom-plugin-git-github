#!/usr/bin/env python3
import json
def basics(): return {"commands": ["init", "add", "commit", "status", "log"], "areas": ["working", "staging", "repo"]}
if __name__ == "__main__": print(json.dumps(basics(), indent=2))
